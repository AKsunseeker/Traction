require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'attributes' do
    it 'has a first name' do 
      first_name = 'Bob'
      user = User.create(first_name: first_name)
      expect(user.first_name).to eq(first_name) 
    end
    it 'has a last name' do 
      last_name = 'Boberton'
      user = User.create(last_name: last_name)
      expect(user.last_name).to eq(last_name) 
    end

    it 'has a handle' do 
      handle = 'bobbyb'
      user = User.create(handle: handle)
      expect(user.handle).to eq(handle) 
    end

    it 'has a gender' do
      gender = 'male'
      user = User.create(gender: gender)
      expect(user.gender).to eq(gender)
    end

    it 'has a date of birth' do
      date = Date.today
      user = User.create(date_of_birth: date)
      expect(user.date_of_birth).to eq(date)
    end

    it 'has a trainer_id' do
      trainer_id = 1
      user = User.create(trainer_id: trainer_id)
      expect(user.trainer_id).to eq(trainer_id)
    end
  end

  describe 'validations' do
    it { should have_many(:workouts)}
    it { should have_many(:biometrics)}
    it { should have_many(:locations)}
    it { should have_many(:memberships)}
    it { should have_many(:locations)}
    it { should have_many(:groups).through(:memberships) }
  end
  describe 'model facebook omniauth methods' do
    auth_hash = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => '1234',
      :info => {
      :email => "user@example.com",
      :name => "Justin Bieber",
      :image => "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/2000px-Smiley.svg.png"
      }
    })
    it 'retrieves and existing user' do
      user = User.new(
            :provider => "facebook", 
            :uid => 1234,
            :email => "user@example.com",
            :password => 'password',
            :first_name => 'Justin',
            :last_name => 'Bieber',
            :password_confirmation => 'password',
            :avatar => "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/2000px-Smiley.svg.png"
            )
        user.save
        omniauth_user = User.from_omniauth(auth_hash)
        expect(user).to eq(omniauth_user)
    end
    it 'creates new user if one does not exist' do
      expect(User.count).to eq(0)
      omniauth_user = User.from_omniauth(auth_hash)
      expect(User.count).to eq(1)
    end
  end
end