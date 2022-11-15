# frozen_string_literal: true

require 'rails_helper'

# Attendance integration tests
RSpec.describe('creating an Attendance: ', type: :feature) do
  it 'valid inputs' do
    visit attendances_path
  end
end

# Helper functions below, do not touch
def loginAsAdmin(_name, _email, _password); end
