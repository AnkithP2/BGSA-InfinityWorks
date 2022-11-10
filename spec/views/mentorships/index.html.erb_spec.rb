# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mentorships/index', type: :view do
  before(:each) do
    assign(:mentorships, [
             Mentorship.create!(
               mentor_id: nil,
               mentee_id: nil
             ),
             Mentorship.create!(
               mentor_id: nil,
               mentee_id: nil
             )
           ])
  end

  it 'renders a list of mentorships' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
