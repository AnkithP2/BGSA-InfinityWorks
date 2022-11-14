# frozen_string_literal: true

require 'rails_helper'

# rsvp integration tests
RSpec.describe('creating an Rsvp: ', type: :feature) do
  it 'valid inputs' do
    visit new_event_path
    fill_in 'Title', with: 'test'
    fill_in 'Date', with: '2022-12-30'
    fill_in 'Starttime', with: '2022-12-30 18:45'
    fill_in 'Endtime', with: '2022-12-30 19:45'
    fill_in 'Logincode', with: 'abcd'
    fill_in 'Location', with: 'At my house'
    fill_in 'Eventpoints', with: '2'
    click_on 'Create Event'
    visit new_user_path
    fill_in 'Firstname', with: 'John'
    fill_in 'Lastname', with: 'Smith'
    fill_in 'Userpoints', with: 0
    fill_in 'Usertotal', with: 0
    click_on 'Create User'
    visit new_rsvp_path
    select 'test', from: 'rsvp_event_id'
    select 'John Smith', from: 'rsvp_userid'
    click_on 'RSVP'
    visit rsvps_path
    expect(page).to(have_content('John'))
  end
end

RSpec.describe('creating an Rsvp: ', type: :feature) do
  it 'valid inputs' do
    visit new_event_path
    fill_in 'Title', with: 'test'
    fill_in 'Date', with: '2022-12-30'
    fill_in 'Starttime', with: '2022-12-30 18:45'
    fill_in 'Endtime', with: '2022-12-30 19:45'
    fill_in 'Logincode', with: 'abcd'
    fill_in 'Location', with: 'At my house'
    fill_in 'Eventpoints', with: '2'
    click_on 'Create Event'
    visit new_user_path
    fill_in 'Firstname', with: 'John'
    fill_in 'Lastname', with: 'Smith'
    fill_in 'Userpoints', with: 0
    fill_in 'Usertotal', with: 0
    click_on 'Create User'
    visit new_rsvp_path
    select 'test', from: 'rsvp_event_id'
    select 'John Smith', from: 'rsvp_userid'
    click_on 'RSVP'
    visit rsvps_path
    expect(page).to(have_content('Smith'))
  end
end

RSpec.describe('creating an Rsvp: ', type: :feature) do
  it 'valid inputs' do
    visit new_event_path
    fill_in 'Title', with: 'test'
    fill_in 'Date', with: '2022-12-30'
    fill_in 'Starttime', with: '2022-12-30 18:45'
    fill_in 'Endtime', with: '2022-12-30 19:45'
    fill_in 'Logincode', with: 'abcd'
    fill_in 'Location', with: 'At my house'
    fill_in 'Eventpoints', with: '2'
    click_on 'Create Event'
    visit new_user_path
    fill_in 'Firstname', with: 'John'
    fill_in 'Lastname', with: 'Smith'
    fill_in 'Userpoints', with: 0
    fill_in 'Usertotal', with: 0
    click_on 'Create User'
    visit new_rsvp_path
    select 'test', from: 'rsvp_event_id'
    select 'John Smith', from: 'rsvp_userid'
    click_on 'RSVP'
    visit rsvps_path
    expect(page).to(have_content('test'))
  end
end
