require 'rails_helper'

RSpec.describe "rates/index", type: :view do
  before(:each) do
    assign(:rates, [
      Rate.create!(
        :from_currency => 2,
        :to_currency => 3,
        :buy => "9.99",
        :sell => "9.99"
      ),
      Rate.create!(
        :from_currency => 2,
        :to_currency => 3,
        :buy => "9.99",
        :sell => "9.99"
      )
    ])
  end

  it "renders a list of rates" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
