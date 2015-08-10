class Checkout < ActiveRecord::Base
	attr_reader :total_price, :oroginal_price

	has_many :scans, class_name: CheckoutProduct, :dependent => :destroy 
	has_many :rules, through: :checkout_rules
  has_many :products, -> { uniq }, through: :scans
  has_many :rules, through: :products
  has_many :checkout_rules, :dependent => :destroy

	before_save :set_number

  def total
    rules_by_product = rules.group_by(&:product_id)
    scans.joins(:product)
      .select("product_id, price, sum(value) as sum_value")
      .group(:product_id, :price)
      .inject(0) do |sum, obj| 
        product_rules = rules_by_product[obj.product_id]
        sum += product_rules.blank? ? obj.sum_value*obj.price : applay_rules(obj.sum_value, obj.product_id, product_rules)
      end  
  end

  def original_total
    scans.joins(:product)
      .select("product_id, price, sum(value) as sum_value")
      .group(:product_id, :price)
      .inject(0){|sum, obj| sum += obj.sum_value*obj.price}
  end

  private

  def applay_rules(product_amount, product_id, product_rules)
    product = Product.find(product_id)
    total_price = product_amount*product.price
    product_rules.inject(total_price) do |new_price, rule|
      discount = rule.get_discount(product_amount) 
      new_price -= rule.get_discount(product_amount) 
    end    
  end  

  def set_number
  	self.number = Time.now.to_i if self.number.blank?
  end 	

end
