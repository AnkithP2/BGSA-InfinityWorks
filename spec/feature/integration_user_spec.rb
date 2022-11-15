# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('creating an user: ', type: :feature) do
  it 'valid inputs' do
    visit attendances_path
  end
end

def loginAsAdmin(_name, _email, _password); end
