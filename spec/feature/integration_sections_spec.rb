# frozen_string_literal: true

# location: spec/feature/integration_links_spec.rb
require 'rails_helper'

RSpec.describe('Creating a link: ', type: :feature) do
  it 'valid inputs' do
    visit new_registration_path
    fill_in 'admin_name', with: 'Brandon'
    fill_in 'admin_email', with: 'test@gmail.com'
    fill_in 'admin_password', with: '12345'
    click_on 'Create Admin'
    visit new_section_path
    fill_in 'Label', with: 'newsection'
    click_on 'Create Section'
    visit sections_path
    expect(page).to(have_content('newsection'))
  end
end
