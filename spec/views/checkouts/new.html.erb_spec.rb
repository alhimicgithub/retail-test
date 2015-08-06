require 'rails_helper'

RSpec.describe "checkouts/new", type: :view do
  before(:each) do
    assign(:checkout, Checkout.new(
      :number => "MyString"
    ))
  end

  it "renders new checkout form" do
    render

    assert_select "form[action=?][method=?]", checkouts_path, "post" do

      assert_select "input#checkout_number[name=?]", "checkout[number]"
    end
  end
end
