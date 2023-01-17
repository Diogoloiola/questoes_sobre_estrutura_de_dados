require_relative 'node'

class Queue
  def initialize
    @queue = nil
  end

  def add(value)
    if @queue.nil?
      @queue = Node.new(value)
    else
      aux = @queue
      aux = aux.next_element while aux.next_element

      aux.next_element = Node.new(value)
    end
  end

  def print_queue
    aux = @queue

    while aux
      puts "Value -> #{aux.value}"
      aux = aux.next_element
    end
  end
end
