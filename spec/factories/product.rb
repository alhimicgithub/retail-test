FactoryGirl.define do
	factory :product do
		trait :sr do
			name 'Strawberries'
		  code 'SR'
		  price 5
		end	
		trait :fr do
		  name 'Fruit Tea'
		  code 'FR'
		  price 3.11
		end  
		trait :cf do
      name 'Coffee'
      code 'CF'
      price 11.23		
    end
    trait :aj do
    	name 'Apple Juice'
    	code 'AJ'
    	price 7.25
    end	
  end
end
