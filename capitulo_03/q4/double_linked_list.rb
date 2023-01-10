class DoubleLinkedList # rubocop:disable Style/Documentation, Style/FrozenStringLiteralComment
  def initialize
    @list = nil
  end

  def add(functionary) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    return @list = Node.new(functionary) if @list.nil?

    current = @list
    previous = nil

    while current && current.functionary.salary < functionary.salary
      previous = current
      current = current.next_element
    end

    if current == @list
      append(functionary)
    else
      new_node = Node.new(functionary)

      new_node.next_element = previous.next_element
      new_node.previous_element = previous
      previous.next_element = new_node

      current.previous_element = new_node unless current.nil?
    end
  end

  def search_with_letter(letter) # rubocop:disable Metrics/MethodLength
    aux = @list
    view_user = false

    letter = letter.downcase
    while aux
      if aux.functionary.name.split.first[0].downcase == letter
        puts aux.functionary.name
        view_user = true
      end
      aux = aux.next_element
    end

    puts 'user not found' unless view_user
  end

  def print_details_functionarys
    aux = @list

    while aux
      puts aux.functionary.to_s
      aux = aux.next_element
    end
  end

  def salary_in_ascending_order
    print_list(@list)
  end

  def salary_in_descending_order(list)
    aux = list
    while aux
      puts aux.functionary.to_s
      aux = aux.previous_element
    end
  end

  private

  def append(functionary)
    node = Node.new(functionary, @list)

    @list.previous_element = node if @list

    @list = node
  end

  def print_list(list)
    aux = list
    while aux.next_element
      puts aux.functionary.to_s
      aux = aux.next_element
    end
    puts aux.functionary.to_s
    aux
  end
end
