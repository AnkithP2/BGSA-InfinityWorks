# location: spec/feature/integration_spec.rb
require 'rails_helper'

#sessions integration tests
RSpec.describe 'Sessions integration test: ', type: :feature do
  scenario 'valid login inputs' do
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'
    visit login_path	
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '1234'
    click_on 'Log In'
    # visit events_path

    expect(page).to have_content('Admin: Ankith')
  end

    scenario 'invalid login inputs' do
      visit new_registration_path
      fill_in 'Name', with: 'Ankith'
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '1234'
      click_on 'Create Admin'
      visit login_path	
      fill_in 'email', with: 'test@gmail.com'
      fill_in 'password', with: '4321'
      click_on 'Log In'
      # visit events_path
  
      expect(page).to have_content('Log In')
    end

    scenario 'valid logout' do
      visit events_path
      click_on 'Logout'
      
      expect(page).to have_content('No admin permissions')
    end
  
end