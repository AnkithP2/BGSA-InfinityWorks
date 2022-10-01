require 'rails_helper'

RSpec.describe "mentorships/new", type: :view do
  before(:each) do
    assign(:mentorship, Mentorship.new(
      mentor_id: nil,
      mentee_id: nil
    ))
  end

  it "renders new mentorship form" do
    render

    assert_select "form[action=?][method=?]", mentorships_path, "post" do

      assert_select "input[name=?]", "mentorship[mentor_id_id]"

      assert_select "input[name=?]", "mentorship[mentee_id_id]"
    end
  end
end
