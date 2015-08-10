require 'rails_helper'

RSpec.describe Checkout, type: :model do
	before :each do
		@fr = FactoryGirl.create(:product, :fr) 
		@sr = FactoryGirl.create(:product, :sr)
		@cf = FactoryGirl.create(:product, :cf)
		@aj = FactoryGirl.create(:product, :aj)

		@checkout_combination1 = FactoryGirl.create(:checkout_with, products: [@fr, @sr, @fr, @fr, @cf])
		@checkout_combination2 = FactoryGirl.create(:checkout_with, products: [@fr, @fr])
		@checkout_combination3 = FactoryGirl.create(:checkout_with, products: [@sr, @sr, @fr, @sr])
	end	

	it 'original_total should return complete total for first combination' do 
		expect(@checkout_combination1.original_total).to eq(9.33 + 5 + 11.23)
	end	

	it 'original_total should return complete total for second combination' do 
		expect(@checkout_combination2.original_total).to eq(6.22)
	end	

	it 'original_total should return complete total for third combination' do 
		expect(@checkout_combination3.original_total).to eq(18.11)
	end	

	it 'total should return total for first combination with discount' do 
		expect(@checkout_combination1.total).to eq(22.45)
	end	

	it 'total should return total for second combination with discount' do 
		expect(@checkout_combination2.total).to eq(3.11)
	end	

	it 'total should return total for third combination with discount' do 
		expect(@checkout_combination3.total).to eq(16.61)
	end	

end
