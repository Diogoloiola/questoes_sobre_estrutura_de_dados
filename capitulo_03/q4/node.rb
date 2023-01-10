class Node # rubocop:disable Style/Documentation, Style/FrozenStringLiteralComment
  attr_accessor :functionary, :next_element, :previous_element

  def initialize(functionary, next_element = nil, previous_element = nil)
    @functionary = functionary
    @next_element = next_element
    @previous_element = previous_element
  end
end
