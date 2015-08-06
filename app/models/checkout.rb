class Checkout < ActiveRecord::Base
	attr_reader :total_price, :oroginal_price

	has_many :rules
	has_many :scans, class_name: CheckoutProduct 
	has_many :checkout_rules
	has_many :rules, through: :checkout_rules

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

  def total
    original_total
    # visitor = CheckoutVisitor.new(self)
    
  end

  def original_total
    scans.joins(:product)
      .select("product_id, price, sum(value) as sum_value")
      .group(:product_id, :price)
      .inject(0){|sum, obj| sum += obj.sum_value*obj.price}
  end  

  private

  def set_number
  	self.number = Time.now.to_i if self.number.blank?
  end 	

end
