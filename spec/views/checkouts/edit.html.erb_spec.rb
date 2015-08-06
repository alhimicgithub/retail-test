require 'rails_helper'

RSpec.describe "checkouts/edit", type: :view do
  before(:each) do
    @checkout = assign(:checkout, Checkout.create!(
      :number => "MyString"
    ))
  end

  it "renders the edit checkout form" do
    render

    assert_select "form[action=?][method=?]", checkout_path(@checkout), "post" do

      assert_select "input#checkout_number[name=?]", "checkout[number]"
    end
  end
end
