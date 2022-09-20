# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an admin: ', type: :feature do
  scenario 'valid inputs' do
    visit new_admins_path
    fill_in 'Name', with: 'rick morty'
    fill_in 'Email', with: 'test@tamu.edu'
    fill_in 'Password', with: 'Password1!'
    click_on 'Submit'
    visit admins_path
    expect(page).to have_content('rick morty')
  end
end