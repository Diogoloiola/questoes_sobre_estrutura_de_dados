# frozen_string_literal: true

require_relative 'node'

class DoubleLinkedList
  def initialize
    @list = nil
  end

  def add(value) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    return @list = Node.new(value) if @list.nil?

    current = @list
    previous = nil

    while current && current.value < value
      previous = current
      current = current.next_element
    end

    if current == @list
      append(value)
    else
      new_node = Node.new(value)

      new_node.next_element = previous.next_element
      new_node.previous_element = previous
      previous.next_element = new_node

      current.previous_element = new_node unless current.nil?
    end
  end

  def print_list
    aux = @list

    puts 'In ascending order'
    while aux.next_element
      print "#{aux.value} "
      aux = aux.next_element
    end
    puts aux.value
    puts 'In descending order'
    while aux.previous_element
      print "#{aux.value} "
      aux = aux.previous_element
    end
    puts aux.value
  end

  private

  def append(functionary)
    node = Node.new(functionary, @list)

    @list.previous_element = node if @list

    @list = node
  end
end
