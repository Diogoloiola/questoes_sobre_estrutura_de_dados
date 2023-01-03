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

list = LinkedList.new

random_products(list)

puts 'How much discount do you want to apply?'

discount = gets.chomp.to_i

list.apply_discount(discount)

puts 'Print report'

list.report
