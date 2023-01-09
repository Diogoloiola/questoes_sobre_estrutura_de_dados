require 'faker'

class Student
  attr_accessor :name, :score

  def initialize(name, score)
    @name = name
    @score = score
  end

  def self.validate_name(name)
    return false if name.nil?
    return false if name.blank?
    return false if name.size <= 1

    true
  end

  def self.validate_score(score)
    return false if score.nil?
    return false if score.blank?
    return false if score.size <= 1

    true
  end
end

class Node
  attr_accessor :student, :next_element, :previous_element

  def initialize(student, next_element = nil, previous_element = nil)
    @student = student
    @next_element = next_element
    @previous_element = previous_element
  end
end

class DoubleLinkedList
  def initialize
    @list = nil
  end

  def add(student)
    node = Node.new(student, @list)

    @list.previous_element = node if @list

    @list = node
  end

  def approved_students
    return false if @list.nil?

    students = []
    aux = @list

    while aux
      students << aux.student if aux.student.score >= 7
      aux = aux.next_element
    end
    students
  end
end
# print "Student #{aux.student.name} approved with score #{aux.student.score}"

def main_menu
  puts '1 - Random students'
  puts '2 - Students with i/o'
  puts '0 - Exit'
end

def random_students(list)
  5.times do
    list.add(Student.new(Faker::Name.name, rand(0...10)))
  end
end

def fetch_student
  loop do
    puts 'Name and score for student'
    name, score = gets.chomp.split

    return Student.new(name, score) if Student.validate_name(name) && Student.validate_score(score)
  end
end

def fetch_choice_menu
  loop do
    choice = gets.chomp.to_i

    return choice if [1, 2, 0].include?(choice)

    main_menu
  end
end

def main
  main_menu

  choice = gets.chomp.to_i

  double_linked_list = DoubleLinkedList.new

  case choice
  when 1
    random_students(double_linked_list)
  when 2
    5.times do
      double_linked_list.add(fetch_student)
    end
  when 0
    puts 'Bye'
  end

  students = double_linked_list.approved_students
  if students.empty?
    puts 'no approved student'
  else
    students.each do |student|
      puts "Student #{student.name} approved with score #{student.score}"
    end
  end
end

main
