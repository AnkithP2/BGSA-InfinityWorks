# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('mentorships/show', type: :view) do
  before do
    @mentorship = assign(:mentorship, Mentorship.create!(
                                        mentor_id: nil,
                                        mentee_id: nil
                                      )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
  end
end
