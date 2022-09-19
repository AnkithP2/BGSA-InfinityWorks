require 'rails_helper'

RSpec.describe "rsvps/edit", type: :view do
  before(:each) do
    @rsvp = assign(:rsvp, Rsvp.create!(
      userid: 1,
      rsvped: false
    ))
  end

  it "renders the edit rsvp form" do
    render

    assert_select "form[action=?][method=?]", rsvp_path(@rsvp), "post" do

      assert_select "input[name=?]", "rsvp[userid]"

      assert_select "input[name=?]", "rsvp[rsvped]"
    end
  end
end
