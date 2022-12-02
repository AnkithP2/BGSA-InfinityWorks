# frozen_string_literal: true

require 'rails_helper'

# rsvp integration tests
RSpec.describe('RSVP Integration Tests: ', type: :feature) do
  it 'RSVP with valid rsvp' do
    create_admin
    Event.create!(title: 'test', date: '2022-09-12', starttime: '2040-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)

    visit new_rsvp_path
    select 'test', from: 'rsvp_event_id'
    select 'John Smith', from: 'rsvp_user_id'
    click_on 'Submit'
    visit rsvps_path
    expect(page).to(have_content('test'))
  end

  it 'valid inputs 1' do
    create_admin
    visit new_event_path
    fill_in 'event_title', with: 'test'
    fill_in 'event_date', with: '2022-12-30'
    fill_in 'event_starttime', with: '2022-12-30 18:45'
    fill_in 'event_endtime', with: '2022-12-30 19:45'
    fill_in 'event_logincode', with: 'abcd'
    fill_in 'event_location', with: 'At my house'
    fill_in 'event_eventpoints', with: '2'
    click_on 'Create Event'
    visit new_user_path
    fill_in 'user_firstname', with: 'John'
    fill_in 'user_lastname', with: 'Smith'
    fill_in 'user_userpoints', with: 0
    fill_in 'user_usertotal', with: 0
    click_on 'Create User'
    visit new_rsvp_path
    select 'test', from: 'rsvp_event_id'
    select 'John Smith', from: 'rsvp_user_id'
    click_on 'Submit'
    visit rsvps_path
    expect(page).to(have_content('Smith'))
  end

  it 'valid inputs 2' do
    create_admin
    visit new_event_path
    fill_in 'event_title', with: 'test'
    fill_in 'event_date', with: '2022-12-30'
    fill_in 'event_starttime', with: '2022-12-30 18:45'
    fill_in 'event_endtime', with: '2022-12-30 19:45'
    fill_in 'event_logincode', with: 'abcd'
    fill_in 'event_location', with: 'At my house'
    fill_in 'event_eventpoints', with: '2'
    click_on 'Create Event'
    visit new_user_path
    fill_in 'user_firstname', with: 'John'
    fill_in 'user_lastname', with: 'Smith'
    fill_in 'user_userpoints', with: 0
    fill_in 'user_usertotal', with: 0
    click_on 'Create User'
    visit new_rsvp_path
  end

  it 'Update RSVP' do
    create_admin
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2040-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    rsvp = Rsvp.create!(event_id: ev.id, user_id: user.id)

    visit edit_rsvp_path(id: rsvp)
    select 'test', from: 'rsvp_event_id'
    select 'John Smith', from: 'rsvp_user_id'
    click_on 'RSVP'
    visit rsvps_path
    expect(page).to(have_content('test'))

    visit rsvps_path
  end

  it 'Destroy RSVP' do
    create_admin
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2040-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    Rsvp.create!(event_id: ev.id, user_id: user.id)

    visit rsvps_path
    click_on 'Destroy'

    visit rsvps_path
    expect(page).not_to(have_content('John'))
  end
end

# Helper functions below, do not touch
def create_admin
  visit(new_registration_path)
  fill_in('admin_name', with: 'Ankith')
  fill_in('admin_email', with: 'test@gmail.com')
  fill_in('admin_password', with: '1234')
  click_on('Create Admin')
end
