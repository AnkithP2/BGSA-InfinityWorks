# frozen_string_literal: true

require 'rails_helper'

# Session integration tests
RSpec.describe 'Log in testing ', type: :feature do
  scenario 'Incorrect login' do
    visit login_path
    fill_in 'email', with: 'wrong_email'
    fill_in 'password', with: 'bad_pass'
    click_on 'Log In'
    expect(page).to have_content('Could not find admin')
  end

  scenario 'Correct Login' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com', '1234')
    click_on 'Logout'
    visit login_path
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '1234'
    click_on 'Log In'
    expect(page).to have_content('Sean')
  end
end

def loginAsAdmin(name, email, password)
  visit login_path
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_on 'Log In'
end

