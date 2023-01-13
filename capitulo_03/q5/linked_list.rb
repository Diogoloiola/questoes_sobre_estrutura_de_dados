require_relative 'node'

class LinkedList # rubocop:disable Style/Documentation, Style/FrozenStringLiteralComment
  def initialize
    @list
  end

  def add(value)
    @list = Node.new(value, @list)
  end

  def print_list
    aux = @list

    while aux
      puts aux.value
      aux = aux.next_element
    end
  end
end
