require 'rails_helper'

RSpec.describe "admin_securities/index", type: :view do
  before(:each) do
    assign(:admin_securities, [
      AdminSecurity.create!(),
      AdminSecurity.create!()
    ])
  end

  it "renders a list of admin_securities" do
    render
  end
end
