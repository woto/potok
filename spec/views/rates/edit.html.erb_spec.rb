require 'rails_helper'

RSpec.describe "rates/edit", type: :view do
  before(:each) do
    @rate = assign(:rate, Rate.create!(
      :from_currency => 1,
      :to_currency => 1,
      :buy => "9.99",
      :sell => "9.99"
    ))
  end

  it "renders the edit rate form" do
    render

    assert_select "form[action=?][method=?]", rate_path(@rate), "post" do

      assert_select "input[name=?]", "rate[from_currency]"

      assert_select "input[name=?]", "rate[to_currency]"

      assert_select "input[name=?]", "rate[buy]"

      assert_select "input[name=?]", "rate[sell]"
    end
  end
end
