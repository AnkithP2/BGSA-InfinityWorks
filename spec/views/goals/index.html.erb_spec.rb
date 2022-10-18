require 'rails_helper'

RSpec.describe "goals/index", type: :view do
  before(:each) do
    assign(:goals, [
      Goal.create!(
        belongs_to: "",
        goal: "Goal",
        status: "Status"
      ),
      Goal.create!(
        belongs_to: "",
        goal: "Goal",
        status: "Status"
      )
    ])
  end

  it "renders a list of goals" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Goal".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
  end
end
