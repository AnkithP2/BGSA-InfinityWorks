# frozen_string_literal: true

# location: spec/feature/integration_links_spec.rb
require 'rails_helper'

RSpec.describe('Creating a title for links: ', type: :feature) do
  it 'valid inputs' do
    visit attendances_path
  end
end

def loginAsAdmin(_name, _email, _password); end
