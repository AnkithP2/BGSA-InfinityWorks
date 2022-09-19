require 'rails_helper'

RSpec.describe "rsvps/show", type: :view do
  before(:each) do
    @rsvp = assign(:rsvp, Rsvp.create!(
      userid: 2,
      rsvped: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
