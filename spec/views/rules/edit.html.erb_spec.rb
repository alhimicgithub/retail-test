require 'rails_helper'

RSpec.describe "rules/edit", type: :view do
  before(:each) do
    @rule = assign(:rule, Rule.create!(
      :name => "MyString",
      :condition => '>=',
      :product_number => 1.5,
      :product => Product.create!(name: 'Name', code: 'N', price: 1),
      :value => 1.5,
      :measurment => "%"
    ))
  end

  it "renders the edit rule form" do
    render

    assert_select "form[action=?][method=?]", rule_path(@rule), "post" do

      assert_select "input#rule_name[name=?]", "rule[name]"

      assert_select "select#rule_condition[name=?]", "rule[condition]"

      assert_select "input#rule_product_number[name=?]", "rule[product_number]"

      assert_select "select#rule_product_id[name=?]", "rule[product_id]"

      assert_select "input#rule_value[name=?]", "rule[value]"

      assert_select "select#rule_measurment[name=?]", "rule[measurment]"
    end
  end
end
