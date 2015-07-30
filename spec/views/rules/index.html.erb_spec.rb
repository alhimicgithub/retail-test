require 'rails_helper'

RSpec.describe "rules/index", type: :view do
  before(:each) do
    assign(:rules, [
      Rule.create!(
        :name => "Name",
        :product_number => 1.5,
        :product => nil,
        :value => 1.5,
        :measurment => "Measurment"
      ),
      Rule.create!(
        :name => "Name",
        :product_number => 1.5,
        :product => nil,
        :value => 1.5,
        :measurment => "Measurment"
      )
    ])
  end

  it "renders a list of rules" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Measurment".to_s, :count => 2
  end
end
