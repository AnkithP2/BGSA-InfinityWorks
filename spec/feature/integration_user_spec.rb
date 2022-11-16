# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('creating an user: ', type: :feature) do
  it 'valid inputs' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin(admin.name, admin.email, admin.password)

    visit new_user_path
    fill_in 'user_firstname', with: 'John'
    fill_in 'user_lastname', with: 'Smith'
    fill_in 'user_userpoints', with: 23
    fill_in 'user_usertotal', with: 26
    click_on 'Create User'
    visit users_path

    expect(page).to(have_content('John'))
  end

  it 'attempt to create new user without admin' do
    visit new_user_path
    expect(page).to(have_content('You need'))
  end

  it 'invalid username with number' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin(admin.name, admin.email, admin.password)

    visit new_user_path
    fill_in 'user_firstname', with: 'John1'
    fill_in 'user_lastname', with: 'Smith'
    fill_in 'user_userpoints', with: 23
    fill_in 'user_usertotal', with: 26
    click_on 'Create User'
    visit users_path

    expect(page).not_to(have_content('John'))
  end

  it 'Edit a user with correct input' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin(admin.name, admin.email, admin.password)

    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    visit edit_user_path(id: user)
    fill_in 'user_firstname', with: 'Sean'
    click_on 'Update User'

    visit users_path
    expect(page).to(have_content('Sean'))
  end

  it 'Edit a user with invalid input' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin(admin.name, admin.email, admin.password)

    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    visit edit_user_path(id: user)
    fill_in 'user_firstname', with: 'test1'
    click_on 'Update User'

    visit users_path
    expect(page).not_to(have_content('test'))
  end

  it 'Edit a user without admin' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin(admin.name, admin.email, admin.password)

    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    visit loginout_path

    visit edit_user_path(id: user)
    expect(page).to(have_content('You need'))
  end

  it 'delete an existing user' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin(admin.name, admin.email, admin.password)

    User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    visit users_path
    click_on 'Destroy'
    expect(page).not_to(have_content('John'))
  end

  it 'attempt delete an existing user without admin' do
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    user.destroy!
  end

  it 'Attempt to delete and invalid user' do
    Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin('Sean', 'test@gmail.com', '1234')
    visit users_path
    expect(page).not_to(have_content('Destroy'))
  end
end

def login_as_admin(_name, email, password)
  visit(login_path)
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_on('Log In')
end
