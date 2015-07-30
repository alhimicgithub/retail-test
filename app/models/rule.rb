class Rule < ActiveRecord::Base
  MEASURMENTS = {
    '%': ->{|orign, value| orign*value/100.0}],
    'times to': ->{|orign, value| orign - value}],
    'times by': ->{|orign, value| orign*value}]
  }
  belongs_to :product

  def get_discount
    MEASURMENTS[self.measurment].call( product.price, self.value)
  end  

  private

  def get_measure(measure_sign)

  end  
end
