require 'rails_helper'

RSpec.describe "rsvps/new", type: :view do
  before(:each) do
    assign(:rsvp, Rsvp.new(
      userid: 1,
      rsvped: false
    ))
  end

  it "renders new rsvp form" do
    render

    assert_select "form[action=?][method=?]", rsvps_path, "post" do

      assert_select "input[name=?]", "rsvp[userid]"

      assert_select "input[name=?]", "rsvp[rsvped]"
    end
  end
end
