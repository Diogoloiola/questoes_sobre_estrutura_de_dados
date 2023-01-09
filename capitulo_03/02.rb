require 'faker'
class Functionary
  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    @salary = salary
  end

  def to_s
    "Name #{name} with salary #{salary}"
  end

  def self.validate_name(name)
    return false if name.nil?
    return false if name.empty?
    return false if name.size <= 1

    true
  end

  def self.validate_salary(salary)
    return false if salary.nil?
    return false if salary.empty?
    return false if salary.size <= 1

    true
  end
end

class Node
  attr_accessor :functionary, :next_element

  def initialize(functionary, next_element = nil)
    @functionary = functionary
    @next_element = next_element
  end

  def to_s
    functionary.to_s
  end
end

class LinkedList
  def initialize
    @list = nil
  end

  def add(functionary)
    raise 'Object not Functionary' unless functionary.is_a? Functionary

    if @list.nil?
      @list = Node.new(functionary, @list)
    else
      current = @list
      previous = nil

      while current && current.functionary.salary < functionary.salary
        previous = current
        current = current.next_element
      end

      if current == @list
        @list = Node.new(functionary, @list)

      else
        node = Node.new(functionary)
        node.next_element = previous.next_element
        previous.next_element = node
      end
    end
  end

  def fetch_highest_salary
    functionary = @list.functionary

    aux = @list

    while aux
      functionary = aux.functionary if aux.functionary.salary > functionary.salary

      return self.print if functionary.salary == aux.functionary.salary && (aux.functionary != functionary)

      aux = aux.next_element
    end
    functionary
  end

  def average_wage
    count = 0
    sum = 0
    aux = @list
    while aux
      sum += aux.functionary.salary
      aux = aux.next_element
      count += 1
    end
    sum / count
  end

  def salary_greater_than(salary)
    counter = 0
    aux = @list
    while aux
      counter += 1 if aux.functionary.salary > salary

      aux = aux.next_element
    end
    counter
  end

  def print
    aux = @list

    while aux
      puts aux.to_s

      aux = aux.next_element
    end
  end
end

def random_functionary(list)
  8.times do
    list.add(Functionary.new(Faker::Name.name, rand(10...42)))
  end
end

def options
  puts '1 - Random functionary'
  puts '2 - I/O functionary'
end

def second_options
  puts '1 - Name of the employee with the highest salary'
  puts '2 - Average wage'
  puts '3 - Number of employees with salary salary greater than'
  puts '0 - Exit'
end

def fetch_choice
  loop do
    options
    choice = gets.chomp.to_i

    return choice if [1, 2].include?(choice)
  end
end

def fetch_functionary
  loop do
    puts 'Enter with name and salary'
    name, salary = gets.split

    return Functionary.new(name, salary.to_f) if Functionary.validate_name(name) && Functionary.validate_salary(salary)
  end
end

def menu
  list = LinkedList.new

  choice = fetch_choice

  if choice == 1
    puts 'Generating...'
    random_functionary(list)
  else
    8.times do
      list.add fetch_functionary
    end
  end

  loop do
    second_options
    choice = gets.chomp.to_i

    case choice
    when 1
      puts list.fetch_highest_salary
    when 2
      puts list.average_wage
    when 3
      puts 'Enter the salary'
      salary = gets.chomp.to_i
      response = list.salary_greater_than(salary)

      if response.zero?
        puts 'no results found'
      else
        puts "Result #{response}"
      end
    when 0
      break
    else
      puts 'Invalid option'
    end
  end
end

menu
