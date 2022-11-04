# location: spec/feature/integration_spec.rb
require 'rails_helper'

#admin integration tests
RSpec.describe 'register as a new admin: ', type: :feature do
  scenario 'valid inputs' do
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'
    visit events_path

    expect(page).to have_content('Ankith')
  end
end

RSpec.describe 'log out as an admin: ', type: :feature do
scenario 'valid inputs' do
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'
    visit events_path
    expect(page).to have_content('Ankith')

    visit loginout_path
    visit events_path
    expect(page).to have_content('No admin permissions')
end
end

