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
    click_on 'Check In'
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
    click_on 'Check In'
    expect(page).to have_content('Incorrect Password')
  end

  scenario 'no password given' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    
    visit new_attendance_path
    select 'test', from: 'attendance_event_id'
    select 'John Smith', from: 'attendance_userid'
    click_on 'Check In'
    expect(page).to have_content('Incorrect Password')
  end

  scenario 'update existing attendance' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    at = Attendance.create!(event_id: ev.id, userid: user.id, password: 'abcd')

    visit edit_attendance_path(id: at)
    fill_in 'attendance_password', with: 'abcd'
    click_on 'Update Attendance'

    visit attendances_path
    expect(page).to(have_content('John'))
  end

  scenario 'delete existing attendance' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    at = Attendance.create!(event_id: ev.id, userid: user.id, password: 'abcd')

    visit attendances_path
    click_on 'Destroy'
    expect(page).not_to(have_content('John'))
  end

  it 'Attempt to delete and invalid attendance' do
    visit attendances_path
    expect(page).not_to(have_content('Destroy'))
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