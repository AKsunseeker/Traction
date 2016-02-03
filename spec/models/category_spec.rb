require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'attributes' do

    it 'has a description' do
      description = 'loves to dance'
      category = Category.create(description: description)
      expect(category.description).to eq(description)
    end

    it 'has a name' do
      name = 'Ricardo'
      category = Category.create(name: name)
      expect(category.name).to eq(name)
    end
  end

  describe 'validates' do
    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name) }
    it { should have_many(:workouts)}
  end
end