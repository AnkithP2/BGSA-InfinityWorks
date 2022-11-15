# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# event integration tests
# create an event with no special attributes
RSpec.describe('event integration tests: ', type: :feature) do
  it 'valid inputs' do
    visit attendances_path
  end
end

# Helper Functions
def loginAsAdmin(_name, _email, _password); end
