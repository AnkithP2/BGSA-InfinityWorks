# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# sessions integration tests
RSpec.describe('Sessions integration test: ', type: :feature) do
  it 'valid login inputs' do
    visit attendances_path
  end
end
