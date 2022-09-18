require 'rails_helper'

RSpec.describe "admin_securities/show", type: :view do
  before(:each) do
    @admin_security = assign(:admin_security, AdminSecurity.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
