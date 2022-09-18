require 'rails_helper'

RSpec.describe "admin_securities/new", type: :view do
  before(:each) do
    assign(:admin_security, AdminSecurity.new())
  end

  it "renders new admin_security form" do
    render

    assert_select "form[action=?][method=?]", admin_securities_path, "post" do
    end
  end
end
