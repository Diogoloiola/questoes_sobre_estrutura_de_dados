class Node
  attr_accessor :value, :next_element

  def initialize(value, next_element = nil)
    @value = value
    @next_element = next_element
  end
end
