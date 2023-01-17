require_relative 'stack'
require 'byebug'

def menu
  puts '1 - Add number to stack'
  puts '2 - Range even numbers'
  puts '3 - Delete number'
  puts '4 - Print Stack'
  puts '5 - Exit'
end

def fetch_choice_menu
  loop do
    choice = gets.chomp.to_i

    return choice if [1, 2, 3, 4, 5].include? choice

    puts 'Invalid Option'
    puts '-------------------'
    menu
  end
end

def main
  stack = Stack.new

  loop do
    menu

    choice = fetch_choice_menu

    case choice
    when 1
      puts 'Digit number'
      number = gets.chomp.to_i
      stack.push(number)
    when 2
      number_one, number_two = gets.chomp.split

      stack.fetch_range_numbers(number_one, number_two)

    when 3
      value = stack.pop

      puts "Delete value #{value}"

    when 4
      stack.print_stack
    when 5
      puts 'Bye'
      break
    end
    puts '========================'
  end
end

main
