class CheckoutRule < ActiveRecord::Base
  belongs_to :checkout
  belongs_to :rule
end
