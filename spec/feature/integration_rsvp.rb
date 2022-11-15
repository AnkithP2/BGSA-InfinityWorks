# frozen_string_literal: true

require 'rails_helper'

# rsvp integration tests
RSpec.describe('RSVP Integration Tests: ', type: :feature) do
  it 'RSVP with valid rsvp' do
    visit attendances_path
  end
end
