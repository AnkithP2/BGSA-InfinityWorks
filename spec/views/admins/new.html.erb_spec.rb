require 'rails_helper'

RSpec.describe "admins/new", type: :view do
  before(:each) do
    assign(:admin, Admin.new(
      name: "MyString",
      email: "MyString",
      password: "MyString"
    ))
  end

  it "renders new admin form" do
    render

    assert_select "form[action=?][method=?]", admins_path, "post" do

      assert_select "input[name=?]", "admin[name]"

      assert_select "input[name=?]", "admin[email]"

      assert_select "input[name=?]", "admin[password]"
    end
  end
end
