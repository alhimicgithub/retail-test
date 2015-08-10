class Product < ActiveRecord::Base
	has_many :rules, :dependent => :destroy
	has_many :checkout_products, :dependent => :destroy
end
