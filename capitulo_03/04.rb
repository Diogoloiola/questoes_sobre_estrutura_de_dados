# frozen_string_literal: true

class Functionary
  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    @salary = salary
  end

  def tax_percentage
    return 0 if salary <= 850

    if salary >= 850 && salary <= 1200
      salary * 0.9
    else
      salary * 0.8
    end
  end

  def valid?
    validate_name && validate_salary
  end

  private

  def validate_name
    return false if @name.nil?
    return false if @name.blank?
    return false if @name.size <= 1

    true
  end

  def validate_salary
    return false if @salary.nil?
    return false if @salary.blank?
    return false if @salary.size <= 1

    true
  end
end

class Node
  attr_accessor :functionary, :next_element

  def initialize(functionary, next_element = nil, previous_element = nil)
    @functionary = functionary
    @next_element = next_element
    @previous_element = previous_element
  end
end

class DoubleLinkedList
  def initialize
    @list = nil
  end

  def add(functionary)
    if @list.nil?
      new_node = Node.new(functionary, @list)
      @list = new_node
    else
      previous = nil
      current = @list

      while current && current.functionary.salary < functionary.salary
        previous = functionary
        functionary = functionary.next_element
      end

      if previous == @list

      else
        new_node = Node.new(functionary)
        new_node.next_element = previous.next_element
        new_node.previous_element = previous
        previous.next_element = new_node

        current.previous_element = new_node unless current.nil?
      end
    end
  end

  def search_with_letter(letter)
    aux = @list

    letter = letter.downcase
    while aux
      functionarys << aux.functionary if functionary.name.split.first == letter

      aux = aux.next_element
    end
    functionarys
  end

  def print_details_functionarys
    aux = @list

    while aux
      puts "Name #{aux.functionary.name} salary #{aux.functionary.salary} tax percente #{aux.functionary.tax_percentage} final value #{aux.functionary.salary - aux.functionary.tax_percentage}"
      aux = aux.next_element
    end
  end
end
