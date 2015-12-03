require 'rails_helper'

RSpec.describe Haiku do

  describe 'a haiku that contains the proper syllable structure' do
    it 'is valid' do
      haiku = Haiku.new
      haiku.title = "Valid Haiku"
      haiku.first_line = "This should be valid" 
      haiku.second_line = "This should be valid as well"
      haiku.third_line = "This will be valid"
      expect(haiku.valid?).to be true
    end
  end

  describe 'a wannabe haiku with incorrect syllable structure' do
    haiku = Haiku.new
    haiku.title = "Invalid Haiku"
    haiku.first_line = "Fail"
    haiku.second_line = "Fail"
    haiku.third_line = "Fail"
    it 'is invalid' do
      expect(haiku.valid?).to be false
      [:first_line, :second_line, :third_line].each do |e|
        expect(haiku.errors).to include(e)
      end
    end 
  end

end

