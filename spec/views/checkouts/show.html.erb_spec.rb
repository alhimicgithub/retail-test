require 'rails_helper'

RSpec.describe "checkouts/show", type: :view do
  before(:each) do
    @checkout = assign(:checkout, Checkout.create!(
      :number => "Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
  end
end
