require_relative 'linked_list'
require_relative 'double_linked_list'

def main_menu
  puts '1 - Random values'
  puts '2 - I/O values'
  puts '0 - Exit'
end

def fetch_init_choice
  loop do
    choice = gets.chomp.to_f

    return choice if [1, 2, 0].include?(choice)

    main_menu
  end
end

def fetch_value
  puts 'Digit value'
  loop do
    value = gets.chomp.to_s

    return value.to_f unless value.empty?

    puts 'Digit value'
  end
end

def define_random_values(list_one, list_two)
  20.times do
    number = rand(0...3000)

    list_one.add(number) if number.odd?
    list_two.add(number) if number.even?
  end
end

def main
  main_menu

  choice = fetch_init_choice

  list_one = LinkedList.new
  list_two = LinkedList.new

  double_linked_list = DoubleLinkedList.new

  case choice
  when 1
    define_random_values(list_one, list_two)
  when 2
    20.times do
      number = rand(0...3000)
      if number.odd?
        list_one.add(number)
      else
        list_two.add(number)
      end
    end
  when 0
    puts 'Bye'
  end

  return unless [1, 2].include?(choice)

  list_one.list_to(double_linked_list)
  list_two.list_to(double_linked_list)

  double_linked_list.print_list
end

main
