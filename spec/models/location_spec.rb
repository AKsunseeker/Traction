require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'attributes' do
    it 'has an id' do 
      id = 10
      location = Location.create(id: id)
      expect(location.id).to eq(id) 
    end

    it 'has a lat' do 
      lat = 100.1
      location = Location.create(lat: lat)
      expect(location.lat).to eq(lat) 
    end

    it 'has a long' do 
      long = 100.1
      location = Location.create(long: long)
      expect(location.long).to eq(long) 
    end

    it 'has a street' do 
      street = 'Mulberry'
      location = Location.create(street: street)
      expect(location.street).to eq(street) 
    end

    it 'has a city' do 
      city = 'Salt Lake City'
      location = Location.create(city: city)
      expect(location.city).to eq(city) 
    end

    it 'has a state' do 
      state = 'Utah'
      location = Location.create(state: state)
      expect(location.state).to eq(state) 
    end

    it 'has a zip' do 
      zip = '84010'
      location = Location.create(zip: zip)
      expect(location.zip).to eq(zip) 
    end

    it 'has a addressable_id' do 
      addressable_id = 1
      location = Location.create(addressable_id: addressable_id)
      expect(location.addressable_id).to eq(addressable_id) 
    end

    it 'has a addressable_type' do 
      addressable_type = 'addressable type'
      location = Location.create(addressable_type: addressable_type)
      expect(location.addressable_type).to eq(addressable_type) 
    end
  end

  describe 'validations' do
    it { should belong_to(:addressable)}
  end
end