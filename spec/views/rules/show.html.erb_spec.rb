require 'rails_helper'

RSpec.describe "rules/show", type: :view do
  before(:each) do
    @rule = assign(:rule, Rule.create!(
      :name => "Name",
      :product_number => 1.5,
      :condition => "=",
      :product => Product.create!(:name => 'Strawberry', :code => 'SR', :price => 1),
      :value => 1.5,
      :measurment => "%"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/=/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/%/)
  end
end
