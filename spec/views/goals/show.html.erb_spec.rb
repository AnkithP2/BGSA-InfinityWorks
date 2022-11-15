# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('goals/show', type: :view) do
  before do
    @goal = assign(:goal, Goal.create!(
                            belongs_to: '',
                            goal: 'Goal',
                            status: 'Status'
                          )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Goal/))
    expect(rendered).to(match(/Status/))
  end
end
