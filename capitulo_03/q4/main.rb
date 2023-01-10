# frozen_string_literal: true
require 'faker'
# ==================
require_relative 'node'
require_relative 'functionary'
require_relative 'double_linked_list'

def main_menu
  puts '1 - Random users'
  puts '2 - I/O users'
  puts '0 - Exit'
end

def fetch_init_choice
  loop do
    choice = gets.chomp.to_i

    return choice if [1, 2, 0].include? choice

    main_menu
  end
end

def fetch_functionary
  loop do
    name, salary = gets.chomp.split

    functionary = Functionary.new(name, salary)

    return functionary if functionary.valid?
  end
end

def random_functionary(double_linked_list)
  6.times do
    double_linked_list.add(Functionary.new(Faker::Name.name, rand(0...3000)))
  end
end

def main
  main_menu

  choice = fetch_init_choice

  double_linked_list = DoubleLinkedList.new

  case choice
  when 1
    random_functionary(double_linked_list)
  when 2
    6.times do
      double_linked_list.add(fetch_functionary)
    end
  when 0
    puts 'Bye'
  end

  double_linked_list.print_details_functionarys

  puts 'Enter with init letter'

  letter = gets.chomp.downcase

  double_linked_list.search_with_letter(letter)

  puts '======================================='

  returned_list = double_linked_list.salary_in_ascending_order

  puts '======================================='

  double_linked_list.salary_in_descending_order(returned_list)

  puts '======================================='
end

main
