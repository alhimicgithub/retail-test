require 'rule'
require 'product'

class Checkout
  def initialize(*rules)
    @rules = *rules
    @total_price = 0
    @orign_price = 0
    @products = {}
  end
  
  def scan(product_code, amount = 1)
    if @products[product_code]
      @products[product_code] += amount
    else
      @products[product_code] = amount
    end  
    @total_price = total
  end

  def total
    visitor = CheckoutVisitor.new(self)
    
  end
end