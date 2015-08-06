class Checkout < ActiveRecord::Base
	attr_reader :total_price, :oroginal_price

	has_many :rules
	has_many :products, :through => CheckoutProduct
	has_many :rules, :through => CheckoutRule

	before_save :set_number

#  def initialize(*rules)
#    @total_price = 0
#    @orign_price = 0
#  end
  
  # def scan(product_code, amount = 1)
  #   if products[product_code]
  #     @products[product_code] += amount
  #   else
  #     @products[product_code] = amount
  #   end  
  #   @total_price = total
  # end

  # def total
  #   visitor = CheckoutVisitor.new(self)
    
  # end

  private

  def set_number
  	self.number = Time.now.to_i if self.number.blank?
  end 	

end
