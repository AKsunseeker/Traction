require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'attributes' do
    it 'has a name' do 
      name = 'Groupies'
      group = Group.create(name: name)
      expect(group.name).to eq(name) 
    end

    it 'has a status' do 
      status = 'Open'
      group = Group.create(status: status)
      expect(group.status).to eq(status) 
    end

    it 'has a founding_date' do 
      founding_date = Date.today
      group = Group.create(founding_date: founding_date)
      expect(group.founding_date).to eq(founding_date) 
    end
  end

  describe 'validations' do
    it { should have_many(:memberships)}
    it { should have_many(:locations)}
    it { should have_many(:users).through(:memberships) }
  end
end