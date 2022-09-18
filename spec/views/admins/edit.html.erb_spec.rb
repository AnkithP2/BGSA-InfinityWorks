require 'rails_helper'

RSpec.describe "admins/edit", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!(
      name: "MyString",
      email: "MyString",
      password: "MyString"
    ))
  end

  it "renders the edit admin form" do
    render

    assert_select "form[action=?][method=?]", admin_path(@admin), "post" do

      assert_select "input[name=?]", "admin[name]"

      assert_select "input[name=?]", "admin[email]"

      assert_select "input[name=?]", "admin[password]"
    end
  end
end
