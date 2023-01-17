require_relative 'node'

class Stack
  def initialize
    @stack = nil
  end

  def push(value)
    if @stack.nil?
      @stack = Node.new(value)
    else
      aux = @stack
      aux = aux.next_element while aux.next_element

      aux.next_element = Node.new(value)
    end
  end

  def pop
    previous = nil
    current = @stack

    while current.next_element
      previous = current
      current = current.next_element
    end

    if current == @stack
      @stack = nil
      current.value
    else
      previous.next_element = current.next_element
      previous.value
    end
  end

  def print_stack
    aux = @stack
    while aux
      puts "Value #{aux.value}"
      aux = aux.next_element
    end
  end

  def fetch_range_numbers(star_range, end_range)
    aux = @stack

    while aux
      puts "Value -> #{aux.value}" if aux.value.even? && (aux.value > star_range && aux.value < end_range)

      aux = aux.next_element
    end
  end
end
