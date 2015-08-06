class Rule < ActiveRecord::Base
  MEASURMENTS = {
    '%' => Proc.new{|orign_price, value, product_number| orign_price*value/100.0},
    'times to' => Proc.new{|orign_price, value, product_number| value},
    'times by' => Proc.new{|orign_price, value, product_number| (product_number - value)*orign_price}
  }
  CONDITIONS = ["<=", ">=", "=", ">", "<"]
  
  belongs_to :product

  def get_discount(product_amount)
    return 0 unless eval("#{product_amount} #{rule.condition} #{rule.product_number}")
    #total_price = product_amount*product.price
    MEASURMENTS[measurment].call(product_price, value, product_number, product_amount)
  end

  private

  def get_measure(measure_sign)

  end  
end
