class CheckoutVisitor
  def initialize(checkout)
    @checkout = checkout
  end

  def visit
    checkout.products.each do |code, value|
      rules.each do |rule|
        rules.get_discount(value)
      end  
    end  
  end 

end  