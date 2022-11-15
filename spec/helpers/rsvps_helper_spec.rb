# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# admin integration tests
RSpec.describe('Admin integration test: ', type: :feature) do
  it 'valid inputs' do
    visit new_event_path
    expect(page).to(have_content('Login'))
  end
end
