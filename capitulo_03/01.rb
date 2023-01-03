class Product
  attr_accessor :code, :price, :quantity

  def initialize(code, price, quantity)
    @code = code
    @price = price
    @quantity = quantity
  end

  def to_s
    "Quantity #{quantity}, price #{price.round(2)} with code #{code}"
  end
end

class Node
  attr_accessor :product, :next_element

  def initialize(product, next_element)
    @product = product
    @next_element = next_element
  end

  def to_s
    product
  end
end

class LinkedList
  def initialize
    @list = nil
  end

  def add_product(product)
    raise 'Object not product' unless product.is_a? Product

    @list = Node.new(product, @list)
  end

  def print
    aux = @list

    while aux
      puts aux.to_s

      aux = aux.next_element
    end
  end

  def report
    aux = @list
    while aux
      puts aux.to_s if aux.product.quantity > 500

      aux = aux.next_element
    end
  end

  def apply_discount(discount)
    aux = @list

    while aux
      price = aux.product.price
      aux.product.price = (price * discount) / 100
      aux = aux.next_element
    end
  end
end

def random_products(list)
  5.times do
    list.add_product(Product.new(rand(10...42), rand(10.0...200.0), rand(10...42)))
  end
end

def options
  puts '1 - Random products'
  puts '2 - I/O products'
end

def fetch_choice
  loop do
    options
    choice = gets.chomp.to_i

    return choice if [1, 2].include?(choice)
  end
end

def fetch_products
  loop do
    puts 'Enter the code, price and quantity'
    code, price, quantity = gets.split.map(&:to_f)

    return Product.new(code, price, quantity) if [code, price, quantity].all? { |e| !e.nil? }
  end
end

def menu
  list = LinkedList.new

  choice = fetch_choice

  if choice == 1
    random_products(list)
  else
    5.times do
      list.add_product fetch_products
    end
  end

  puts 'How much discount do you want to apply?'

  discount = gets.chomp.to_i

  list.apply_discount(discount)

  puts 'Print report'

  list.report
end

menu
