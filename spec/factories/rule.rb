FactoryGirl.define do
	factory :rule do
		trait :by_one_get_one_free do
			name 'By one get one free'
			product {Product.find_by_code('FR') || FactoryGirl.create(:product, :fr)}
			product_number 2
			condition '>='
			value 1
			measurment 'times by'
		end	
		trait :discounted_down_to do
			name 'Strawberries discounted down to 4.50$'
			product {Product.find_by_code('SR') || FactoryGirl.create(:product, :sr)}
			product_number 3
			condition '>='
			value 0.50
			measurment 'times to'
		end	
  end
end
