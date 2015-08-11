class Rule < ActiveRecord::Base
  MEASURMENTS = {
    '%' => Proc.new{|orign_price, value, product_number| orign_price*value/100.0},
    'times to' => Proc.new{|orign_price, value, product_number, product_amount| value*product_amount},
    'times by' => Proc.new{|orign_price, value, product_number, product_amount| ((product_amount/product_number).to_i*value)*orign_price}
  }
  CONDITIONS = [">=", "==", ">"]
  
  belongs_to :product

  def get_discount(product_amount)
    return 0 unless eval("#{product_amount} #{self.condition} #{self.product_number}")
    MEASURMENTS[measurment].call(self.product.price, value, product_number, product_amount)
  end

  private

  def get_measure(measure_sign)

  end  
end
