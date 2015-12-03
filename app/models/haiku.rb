require_relative '../../lib/syllable/lib/syllable'
require 'byebug'

class Haiku < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :first_line, :second_line, :third_line, :user_id
  validate  :first_line_has_five_syllables?,
            :second_line_has_seven_syllables?,
            :third_line_has_five_syllables?


  def first_line_has_five_syllables?
    return true if Syllable.guess(first_line) == 5 
    errors.add(:first_line, "does not contain five syllables!")
  end

  def second_line_has_seven_syllables?
    return true if Syllable.guess(second_line) == 7
    errors.add(:second_line, "does not contain seven syllables!")
  end

  def third_line_has_five_syllables?
    return true if Syllable.guess(third_line) == 5
    errors.add(:third_line, "does not contain five syllables!")
  end
end
