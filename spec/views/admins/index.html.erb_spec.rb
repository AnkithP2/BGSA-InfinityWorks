require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        name: "Name",
        email: "Email",
        password: "Password"
      ),
      Admin.create!(
        name: "Name",
        email: "Email",
        password: "Password"
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
  end
end
