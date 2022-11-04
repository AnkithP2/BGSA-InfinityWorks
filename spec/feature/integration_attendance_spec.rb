# frozen_string_literal: true

require 'rails_helper'

# Attendance integration tests
RSpec.describe 'creating an Attendance: ', type: :feature do
  scenario 'valid inputs' do
    createAdmin()
    
    visit new_event_path
    fill_in 'Title', with: 'test'
    fill_in 'Starttime', with: '2022-09-12 18:45'
    fill_in 'Endtime', with: '2022-09-12 19:45'
    fill_in 'Logincode', with: 'abcd'
    fill_in 'Location', with: 'At my house'
    fill_in 'Eventpoints', with: '2'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('test')

    visit new_user_path
    fill_in 'Firstname', with: 'John'
    fill_in 'Lastname', with: 'Smith'
    fill_in 'Userpoints', with: 0
    fill_in 'Usertotal', with: 0
    click_on 'Create User'
    visit user_path
    expect(page).to have_content('John')

    visit new_attendance_path
    select 'test', from: 'attendance_event_id'
    select 'John Smith', from: 'attendance_userid'
    fill_in 'attendance_password', with: 'abcd'
    click_on 'Create Attendance'
    visit attendances_path
    expect(page).to have_content('John')
  end
end

def createAdmin()
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'
end