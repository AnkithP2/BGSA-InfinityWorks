# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mentorships/edit', type: :view do
  before(:each) do
    @mentorship = assign(:mentorship, Mentorship.create!(
                                        mentor_id: nil,
                                        mentee_id: nil
                                      ))
  end

  it 'renders the edit mentorship form' do
    render

    assert_select 'form[action=?][method=?]', mentorship_path(@mentorship), 'post' do
      assert_select 'input[name=?]', 'mentorship[mentor_id_id]'

      assert_select 'input[name=?]', 'mentorship[mentee_id_id]'
    end
  end
end
