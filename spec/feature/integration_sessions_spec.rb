# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# sessions integration tests
RSpec.describe('Sessions integration test: ', type: :feature) do
  it 'valid login inputs' do
    visit new_registration_path
    fill_in 'admin_name', with: 'Ankith'
    fill_in 'admin_email', with: 'test@gmail.com'
    fill_in 'admin_password', with: '1234'
    click_on 'Create Admin'
    visit login_path
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '1234'
    click_on 'Log In'
    # visit events_path

    expect(page).to(have_content('Ankith'))
  end

  it 'invalid login inputs' do
    visit new_registration_path
    fill_in 'admin_name', with: 'Ankith'
    fill_in 'admin_email', with: 'test@gmail.com'
    fill_in 'admin_password', with: '1234'
    click_on 'Create Admin'
    visit login_path
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '4321'
    click_on 'Log In'
    # visit events_path

    expect(page).to(have_content('Could not find admin'))
  end

  it 'valid logout' do
    visit new_registration_path
    fill_in 'admin_name', with: 'Ankith'
    fill_in 'admin_email', with: 'test@gmail.com'
    fill_in 'admin_password', with: '1234'
    click_on 'Create Admin'
    visit events_path
    click_on 'Logout'

    expect(page).to(have_content('Login'))
  end
end
