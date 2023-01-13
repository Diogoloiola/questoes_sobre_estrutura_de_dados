class Node
  attr_accessor :value, :next_element, :previous_element

  def initialize(value, next_element = nil, previous_element = nil)
    @value = value
    @next_element = next_element
    @previous_element = previous_element
  end
end
