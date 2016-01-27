require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe 'attributes' do
    it 'has a join_date' do 
      join_date = 2001-01-05
      membership = Membership.create(join_date: join_date)
      expect(membership.join_date).to eq(join_date) 
    end

    it 'has a user_id' do 
      user_id = 2
      membership = Membership.create(user_id: user_id)
      expect(membership.user_id).to eq(user_id) 
    end

    it 'has a group_id' do 
      group_id = 3
      membership = Membership.create(group_id: group_id)
      expect(membership.group_id).to eq(group_id) 
    end
  end
end