# frozen_string_literal: true

require 'rails_helper'

# Attendance integration tests
RSpec.describe 'creating an Attendance: ', type: :feature do
  scenario 'valid inputs' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)

    visit new_attendance_path
    select 'test', from: 'attendance_event_id'
    select 'John Smith', from: 'attendance_userid'
    fill_in 'attendance_password', with: 'abcd'
    click_on 'Create Attendance'
    visit attendances_path
    expect(page).to have_content('John')
  end

  scenario 'incorrect password when attempting to attend' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    
    visit new_attendance_path
    select 'test', from: 'attendance_event_id'
    select 'John Smith', from: 'attendance_userid'
    fill_in 'attendance_password', with: 'abc'
    click_on 'Create Attendance'
    expect(page).to have_content('Incorrect Password')
  end

  scenario 'user not found when trying to attend' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    
    visit new_attendance_path
    select 'test', from: 'attendance_event_id'
    select 'John Smith', from: 'attendance_userid'
    fill_in 'attendance_password', with: 'abc'
    click_on 'Create Attendance'
    expect(page).to have_content('Incorrect Password')
  end
end

# Helper functions below, do not touch
def createAdmin()
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'
end

def createValidEvent()
    visit new_event_path
    fill_in 'Title', with: 'test'
    fill_in 'Date', with: '11/04/2022'
    fill_in 'Starttime', with: '11/4/2022 18:45'
    fill_in 'Endtime', with: '11/4/2022 19:45'
    fill_in 'Logincode', with: 'abcd'
    fill_in 'Location', with: 'At my house'
    fill_in 'Eventpoints', with: '2'
    click_on 'Create Event'
end

def createValidUser()
    visit new_user_path
    fill_in 'Firstname', with: 'John'
    fill_in 'Lastname', with: 'Smith'
    fill_in 'Userpoints', with: 0
    fill_in 'Usertotal', with: 0
    click_on 'Create User'
    visit users_path
end