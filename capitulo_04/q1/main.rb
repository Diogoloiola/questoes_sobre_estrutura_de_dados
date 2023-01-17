require_relative 'stack'
require_relative 'queue'

def menu
  puts '1 - Random Numbers'
  puts '2 - I/O'
  puts '0 - Exit'
end

def fetch_choice_menu
  loop do
    choice = gets.chomp.to_i

    return choice if [1, 2, 0].include? choice

    menu
  end
end

def random_numbers(structure)
  5.times do
    structure.add(rand(0...3000))
  end
end

def fetch_numbers(structure)
  5.times do
    number = gets.chomp.to_i
    structure.add(number)
  end
end

def main
  menu

  choice = fetch_choice_menu
  stack = Stack.new
  queue = Queue.new

  case choice
  when 1
    random_numbers(stack)
    random_numbers(queue)
  when 2
    fetch_numbers(stack)
    fetch_numbers(queue)
  when 0
    puts 'Bye'
  end
  puts 'Stack and queue'
  stack.print_stack
  queue.print_queue

  puts 'Only stack'
  stack.print_stack

  puts 'Only Queue'
  queue.print_queue
end

main
