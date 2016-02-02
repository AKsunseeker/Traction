# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  handle                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  roles                  :string
#

class User < ActiveRecord::Base
  ################################################################################ 
  ## PeterGate Roles
  ## The :user role is added by default and shouldn't be included in this list.
  petergate(roles: [:admin, :trainer])
  ################################################################################
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :workouts
  has_many :locations, as: :addressable
  has_many :biometrics
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  private

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      names =  auth.info.name.split(" ")
      user.first_name = names.first
      user.last_name = names.last
      user.email = auth.info.email
      user.avatar = process_uri(auth.info.image)
      user.password = Devise.friendly_token[0,20]
    end
  end
  
  def self.process_uri(uri)
   avatar_url = URI.parse(uri)
   avatar_url.scheme = 'https'
   avatar_url.to_s
  end
end
