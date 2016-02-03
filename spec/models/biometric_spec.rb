require 'rails_helper'

RSpec.describe Biometric, type: :model do
  describe 'attributes' do
    
    it 'has a weight' do
      weight = 175.5
      biometric = Biometric.create(weight: weight)
      expect(biometric.weight).to eq(weight)
    end

    it 'has a body_fat_percentage measurment' do
      body_fat_percentage = 1.2
      biometric = Biometric.create(body_fat_percentage: body_fat_percentage)
      expect(biometric.body_fat_percentage).to eq(body_fat_percentage)
    end

    it 'has a chest measurment' do
      chest = 22.4
      biometric = Biometric.create(chest: chest)
      expect(biometric.chest).to eq(chest)
    end

    it 'has a height measurment' do
      height = 65.5
      biometric = Biometric.create(height: height)
      expect(biometric.height).to eq(height)
    end

    it 'has a waist measurment' do
      waist = 65.5
      biometric = Biometric.create(waist: waist)
      expect(biometric.waist).to eq(waist)
    end

    it 'has a shoulder measurment' do
      shoulder = 65.5
      biometric = Biometric.create(shoulder: shoulder)
      expect(biometric.shoulder).to eq(shoulder)
    end

    it 'has a hips measurment' do
      hips = 65.5
      biometric = Biometric.create(hips: hips)
      expect(biometric.hips).to eq(hips)
    end

    it 'has a biceps measurment' do
      biceps = 65.5
      biometric = Biometric.create(biceps: biceps)
      expect(biometric.biceps).to eq(biceps)
    end

    it 'has a ape_index measurment' do
      ape_index = 65.5
      biometric = Biometric.create(ape_index: ape_index)
      expect(biometric.ape_index).to eq(ape_index)
    end

    it 'has a thigh measurment' do
      thigh = 65.5
      biometric = Biometric.create(thigh: thigh)
      expect(biometric.thigh).to eq(thigh)
    end

    it 'has a calf measurment' do
      calf = 65.5
      biometric = Biometric.create(calf: calf)
      expect(biometric.calf).to eq(calf)
    end

    it 'has a forearm measurment' do
      forearm = 65.5
      biometric = Biometric.create(forearm: forearm)
      expect(biometric.forearm).to eq(forearm)
    end

    it 'has a wrist measurment' do
      wrist = 65.5
      biometric = Biometric.create(wrist: wrist)
      expect(biometric.wrist).to eq(wrist)
    end

    it 'has a neck measurment' do
      neck = 65.5
      biometric = Biometric.create(neck: neck)
      expect(biometric.neck).to eq(neck)
    end

    it 'has a date' do
      date = Date.today
      biometric = Biometric.create(date: date)
      expect(biometric.date).to eq(date)
    end

    it 'has a user_id' do
      user_id = 1
      biometric = Biometric.create(user_id: user_id)
    end
  end

  describe 'validates' do
    it { should belong_to(:user) }
  end
end