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
end