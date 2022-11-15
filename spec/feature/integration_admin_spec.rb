# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# admin integration tests
RSpec.describe('Admin integration test: ', type: :feature) do
  it 'valid inputs' do
    visit new_registration_path
    fill_in 'admin_name', with: 'Ankith'
    fill_in 'admin_email', with: 'test@gmail.com'
    fill_in 'admin_password', with: '1234'
    click_on 'Create Admin'
    visit events_path

    expect(page).to(have_content('Ankith'))
  end

  it 'admin with invalid characters' do
    visit new_registration_path
    fill_in 'admin_name', with: 'Ankith'
    fill_in 'admin_email', with: 'test@gmail.com'
    fill_in 'admin_password', with: '1234'
    click_on 'Create Admin'
    visit events_path

    expect(page).to(have_content('Ankith'))
  end

  it 'logout as admin' do
    visit new_registration_path
    fill_in 'admin_name', with: 'Ankith'
    fill_in 'admin_email', with: 'test@gmail.com'
    fill_in 'admin_password', with: '1234'
    click_on 'Create Admin'
    visit events_path
    expect(page).to(have_content('Ankith'))

    visit loginout_path
    visit events_path
    expect(page).not_to(have_content('Ankith'))
  end

  it 'update an existing admin' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')

    visit edit_admin_path(id: admin)
    fill_in 'admin_password', with: 'abcd'
    click_on 'Update Admin'

    visit admin_path(id: admin)
    expect(page).to(have_content('Sean'))
  end

  it 'delete existing admin' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    admin.destroy!
  end
end
