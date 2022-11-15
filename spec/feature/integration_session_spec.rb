# frozen_string_literal: true

require 'rails_helper'

# Session integration tests
RSpec.describe('Log in testing ', type: :feature) do
  it 'Incorrect login' do
    visit attendances_path
  end
end
