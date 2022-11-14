# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# event integration tests
# create an event with no special attributes
RSpec.describe 'event integration tests: ', type: :feature do
  scenario 'valid inputs' do
    createAdmin()

    visit new_event_path
    fill_in 'Title', with: 'test'
    fill_in 'Date', with: '11/04/2022'
    fill_in 'Starttime', with: '11/4/2022 18:45'
    fill_in 'Endtime', with: '11/4/2042 19:45'
    fill_in 'Logincode', with: 'abcd'
    fill_in 'Location', with: 'At my house'
    fill_in 'Eventpoints', with: '2'
    click_on 'Create Event'
    expect(page).to have_content('test')
  end

  scenario 'access new event without admin permissions' do

    visit new_event_path
    expect(page).not_to have_content('you need admin')
  end

  scenario 'edit an event with admin permissions' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit edit_event_path(id: ev)
    fill_in 'Title', with: 'testing'
    click_on 'Update Event'

    expect(page).to have_content('testing')
  end

  scenario 'edit an event without admin permissions' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit loginout_path
    visit edit_event_path(id: ev)

    expect(page).not_to have_content('Ankith')
  end

  scenario 'creating an event with zero RSVP: ' do
    createAdmin()

    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit event_path(id: ev.id)
    expect(page).to have_content('None')
  end

  scenario 'creating an event with at least one RSVP/Attended: ' do
    createAdmin()

    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    at = Attendance.create!(event_id: ev.id, userid: user.id, password: 'abcd')
    rsvp = Rsvp.create!(event_id: ev.id, userid: user.id)

    visit event_path(id: ev.id)
    expect(page).not_to have_content('None')
  end

  scenario 'Attempt to attend an event which is closed: ' do
    createAdmin()

    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    at = Attendance.create!(event_id: ev.id, userid: user.id, password: 'abcd')
    at = Attendance.create!(event_id: ev.id, userid: user.id, password: 'abcd')

    rsvp = Rsvp.create!(event_id: ev.id, userid: user.id)

    visit event_path(id: ev.id)
    expect(page).not_to have_content('None')
  end

  scenario 'delete existing event with admin permissions' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit event_path(id: ev.id)
    click_on 'Delete'
  end

  scenario 'delete existing event without admin permissions' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2042-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    visit event_path(id: ev.id)
    click_on 'Delete'
  end
end

def createAdmin()
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'
end