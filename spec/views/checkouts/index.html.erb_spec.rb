require 'rails_helper'

RSpec.describe "checkouts/index", type: :view do
  before(:each) do
    assign(:checkouts, [
      Checkout.create!(
        :number => "Number"
      ),
      Checkout.create!(
        :number => "Number"
      )
    ])
  end

  it "renders a list of checkouts" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
  end
end
