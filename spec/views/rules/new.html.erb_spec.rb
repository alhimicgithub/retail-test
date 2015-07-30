require 'rails_helper'

RSpec.describe "rules/new", type: :view do
  before(:each) do
    assign(:rule, Rule.new(
      :name => "MyString",
      :product_number => 1.5,
      :product => nil,
      :value => 1.5,
      :measurment => "MyString"
    ))
  end

  it "renders new rule form" do
    render

    assert_select "form[action=?][method=?]", rules_path, "post" do

      assert_select "input#rule_name[name=?]", "rule[name]"

      assert_select "input#rule_product_number[name=?]", "rule[product_number]"

      assert_select "input#rule_product_id[name=?]", "rule[product_id]"

      assert_select "input#rule_value[name=?]", "rule[value]"

      assert_select "input#rule_measurment[name=?]", "rule[measurment]"
    end
  end
end
