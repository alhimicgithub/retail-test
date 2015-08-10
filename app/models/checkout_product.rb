class CheckoutProduct < ActiveRecord::Base
  belongs_to :checkout
  belongs_to :product
  
end
