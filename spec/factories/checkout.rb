FactoryGirl.define do
	factory :checkout do
		
    factory :checkout_with, parent: :checkout do |checkout|
     	ignore do
     	  checkout_products {[FactoryGirl.create(:checkout_product)]}
     	end	
     	 
      before(:create) do |ch, evaluator|
        ch.scans = []
        evaluator.products.each do |product|
       	  ch.scans << FactoryGirl.create(:checkout_product,  product: product, checkout: ch)
       	end	
      end
    end
  end
end