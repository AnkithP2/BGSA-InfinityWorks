# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# admin integration tests
RSpec.describe('Admin integration test: ', type: :feature) do
  it 'valid inputs' do
    visit attendances_path
  end
end
