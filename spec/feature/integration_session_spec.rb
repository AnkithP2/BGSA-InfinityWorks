# frozen_string_literal: true

require 'rails_helper'

# Session integration tests
RSpec.describe('Log in testing ', type: :feature) do
  it 'Incorrect login' do
    visit login_path
    fill_in 'email', with: 'wrong_email'
    fill_in 'password', with: 'bad_pass'
    click_on 'Log In'
    expect(page).to(have_content('Could not find admin'))
  end

  it 'Correct Login' do
    Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin('Sean', 'test@gmail.com', '1234')
    click_on 'Logout'
    visit login_path
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '1234'
    click_on 'Log In'
    expect(page).to(have_content('Sean'))
  end
end

def login_as_admin(_name, email, password)
  visit(login_path)
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_on('Log In')
end
