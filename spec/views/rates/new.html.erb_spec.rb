require 'rails_helper'

RSpec.describe "rates/new", type: :view do
  before(:each) do
    assign(:rate, Rate.new(
      :from_currency => 1,
      :to_currency => 1,
      :buy => "9.99",
      :sell => "9.99"
    ))
  end

  it "renders new rate form" do
    render

    assert_select "form[action=?][method=?]", rates_path, "post" do

      assert_select "input[name=?]", "rate[from_currency]"

      assert_select "input[name=?]", "rate[to_currency]"

      assert_select "input[name=?]", "rate[buy]"

      assert_select "input[name=?]", "rate[sell]"
    end
  end
end
