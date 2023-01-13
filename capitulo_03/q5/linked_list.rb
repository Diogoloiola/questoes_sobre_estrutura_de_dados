require_relative 'node'

class LinkedList # rubocop:disable Style/Documentation
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

  def list_to(double_linked_list)
    aux = @list

    while aux
      double_linked_list.add(aux.value)
      aux = aux.next_element
    end
  end
end
