# frozen_string_literal: true

require 'rails_helper'

# Attendance integration tests
RSpec.describe('creating an Attendance: ', type: :feature) do
  it 'valid inputs' do
    Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin('Sean', 'test@gmail.com', '1234')
    Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)

    visit new_attendance_path
    select 'test', from: 'attendance_event_id'
    select 'John Smith', from: 'attendance_user_id'
    fill_in 'attendance_password', with: 'abcd'
    click_on 'Submit'
    visit attendances_path
    expect(page).to(have_content('John'))
  end

  it 'incorrect password when attempting to attend' do
    Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin('Sean', 'test@gmail.com', '1234')
    Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)

    visit new_attendance_path
    select 'test', from: 'attendance_event_id'
    select 'John Smith', from: 'attendance_user_id'
    fill_in 'attendance_password', with: 'abc'
    click_on 'Submit'
    expect(page).to(have_content('Incorrect Password'))
  end

  it 'no password given' do
    Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin('Sean', 'test@gmail.com', '1234')
    Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)

    visit new_attendance_path
    select 'test', from: 'attendance_event_id'
    select 'John Smith', from: 'attendance_user_id'
    click_on 'Submit'
    expect(page).to(have_content('Incorrect Password'))
  end

  it 'update existing attendance' do
    Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin('Sean', 'test@gmail.com', '1234')
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    at = Attendance.create!(event_id: ev.id, user_id: user.id, password: 'abcd')

    visit edit_attendance_path(id: at)
    fill_in 'attendance_password', with: 'abcd'
    click_on 'Submit'

    visit attendances_path
    expect(page).to(have_content('John'))
  end

  it 'delete existing attendance' do
    Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    login_as_admin('Sean', 'test@gmail.com', '1234')
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    Attendance.create!(event_id: ev.id, user_id: user.id, password: 'abcd')

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
def login_as_admin(_name, email, password)
  visit(login_path)
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_on('Log In')
end
