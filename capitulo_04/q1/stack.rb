require_relative 'node'

class Stack
  def initialize
    @stack = nil
  end

  def add(value)
    # valido se existe algum elemento

    if @stack.nil?
      # adiciono no fim da lista
      @stack = Node.new(value)
    else
      # percorro até o fim da pilha para adicionar o elemento no topo
      aux = @stack
      aux = aux.next_element while aux.next_element

      # ultimo no aponta para o novo elemento
      aux.next_element = Node.new(value)
    end
  end

  def print_stack
    aux = @stack

    while aux
      puts "Value -> #{aux.value}"
      aux = aux.next_element
    end
  end
end
