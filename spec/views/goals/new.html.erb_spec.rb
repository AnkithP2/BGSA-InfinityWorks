require 'rails_helper'

RSpec.describe "goals/new", type: :view do
  before(:each) do
    assign(:goal, Goal.new(
      belongs_to: "",
      goal: "MyString",
      status: "MyString"
    ))
  end

  it "renders new goal form" do
    render

    assert_select "form[action=?][method=?]", goals_path, "post" do

      assert_select "input[name=?]", "goal[belongs_to]"

      assert_select "input[name=?]", "goal[goal]"

      assert_select "input[name=?]", "goal[status]"
    end
  end
end
