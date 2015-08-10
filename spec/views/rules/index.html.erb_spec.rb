require 'rails_helper'

RSpec.describe "rules/index", type: :view do
  before(:each) do
    assign(:rules, [
      Rule.create!(
        :name => "Name",
        :product_number => 2.0,
        :product => Product.create!(name: 'Strawberry', code: 'SR', price: 1),
        :value => 1.5,
        :measurment => "%"
      ),
      Rule.create!(
        :name => "Name",
        :product_number => 2.0,
        :product => Product.create!(name: 'Oxygen', code: 'OX', price: 0.1),
        :value => 1.5,
        :measurment => "%"
      )
    ])
  end

  it "renders a list of rules" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.0.to_s, :count => 2
    assert_select "tr>td", :text => 'Strawberry (SR)'.to_s, :count => 1
    assert_select "tr>td", :text => 'Oxygen (OX)'.to_s, :count => 1
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "%".to_s, :count => 2
  end
end
