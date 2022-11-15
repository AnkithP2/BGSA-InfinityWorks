# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# event integration tests
# create an event with no special attributes
RSpec.describe('event integration tests: ', type: :feature) do
  it 'valid inputs' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')

    visit new_event_path
    fill_in 'event_title', with: 'test'
    fill_in 'event_date', with: '11/04/2022'
    fill_in 'event_starttime', with: '11/4/2022 18:45'
    fill_in 'event_endtime', with: '11/4/2042 19:45'
    fill_in 'event_logincode', with: 'abcd'
    fill_in 'event_location', with: 'At my house'
    fill_in 'event_eventpoints', with: '2'
    click_on 'Create Event'
    expect(page).to(have_content('test'))
  end

  it 'access new event without admin permissions' do
    visit new_event_path
    expect(page).not_to(have_content('you need admin'))
  end

  it 'edit an event with admin permissions' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit edit_event_path(id: ev)
    fill_in 'event_title', with: 'testing'
    click_on 'Update Event'

    expect(page).to(have_content('testing'))
  end

  it 'edit an event without admin permissions' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit loginout_path
    visit edit_event_path(id: ev)

    expect(page).not_to(have_content('Ankith'))
  end

  it 'creating an event with zero RSVP: ' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')

    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit event_path(id: ev.id)
    expect(page).to(have_content('None'))
  end

  it 'creating an event with at least one RSVP/Attended: ' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')

    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    at = Attendance.create!(event_id: ev.id, userid: user.id, password: 'abcd')
    rsvp = Rsvp.create!(event_id: ev.id, userid: user.id)

    visit event_path(id: ev.id)
    expect(page).not_to(have_content('None'))
  end

  it 'Attempt to attend an event which is closed: ' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')

    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    at = Attendance.create!(event_id: ev.id, userid: user.id, password: 'abcd')
    at = Attendance.create!(event_id: ev.id, userid: user.id, password: 'abcd')

    rsvp = Rsvp.create!(event_id: ev.id, userid: user.id)

    visit event_path(id: ev.id)
    expect(page).not_to(have_content('None'))
  end

  it 'delete existing event with admin permissions' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit event_path(id: ev.id)
    click_on 'Delete'
  end

  it 'delete existing event without admin permissions' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin('Sean','test@gmail.com','1234')
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit event_path(id: ev.id)
    click_on 'Delete'
  end
end

#Helper Functions
def loginAsAdmin(name, email, password)
  visit login_path
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_on 'Log In'
end
