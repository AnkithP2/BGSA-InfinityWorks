require 'rails_helper'

RSpec.describe "rsvps/index", type: :view do
  before(:each) do
    assign(:rsvps, [
      Rsvp.create!(
        userid: 2,
        rsvped: false
      ),
      Rsvp.create!(
        userid: 2,
        rsvped: false
      )
    ])
  end

  it "renders a list of rsvps" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
