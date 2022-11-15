# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('creating an user: ', type: :feature) do
  it 'valid inputs' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    visit new_user_path
    fill_in 'Firstname', with: 'John'
    fill_in 'Lastname', with: 'Smith'
    fill_in 'Userpoints', with: 23
    fill_in 'Usertotal', with: 26
    click_on 'Create User'
    visit users_path

    expect(page).to(have_content('John'))
  end

  it 'invalid username with number' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    visit new_user_path
    fill_in 'Firstname', with: 'John1'
    fill_in 'Lastname', with: 'Smith'
    fill_in 'Userpoints', with: 23
    fill_in 'Usertotal', with: 26
    click_on 'Create User'
    visit users_path

    expect(page).not_to(have_content('John'))
  end

  it 'Edit a user with correct input' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    visit edit_user_path(id: user)
    fill_in 'Firstname', with: 'Sean'
    click_on 'Update User'

    visit users_path
    expect(page).to(have_content('Sean'))
  end

  it 'Edit a user with invalid input' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    visit edit_user_path(id: user)
    fill_in 'Firstname', with: 'Sean1'
    click_on 'Update User'

    visit users_path
    expect(page).not_to(have_content('Sean'))
  end

  it 'delete an existing user' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    visit users_path
    click_on 'Destroy'
    expect(page).not_to(have_content('John'))
  end

  it 'Attempt to delete and invalid user' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    visit users_path
    expect(page).not_to(have_content('Destroy'))
  end
end

#Helper Functions
def loginAsAdmin(name, email, password)
  visit login_path
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_on 'Log In'
end