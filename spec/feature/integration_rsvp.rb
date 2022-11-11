# frozen_string_literal: true

require 'rails_helper'

# rsvp integration tests
RSpec.describe 'RSVP Integration Tests: ', type: :feature do
  scenario 'RSVP with valid rsvp' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2040-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)

    visit new_rsvp_path
    select 'test', from: 'rsvp_event_id'
    select 'John Smith', from: 'rsvp_userid'
    click_on 'Create Rsvp'
    expect(page).to have_content('test')
    
    visit rsvps_path
  end

  scenario 'Attempt RSVP with event currently going' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2020-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)

    visit new_rsvp_path
    select 'test', from: 'rsvp_event_id'
    select 'John Smith', from: 'rsvp_userid'
    click_on 'Create Rsvp'
    
    visit rsvps_path
    expect(page).not_to have_content('test')
  end

  scenario 'Update RSVP' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2040-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    rsvp = Rsvp.create!(event_id: ev.id, userid: user.id)

    visit edit_rsvp_path(id: rsvp)
    select 'test', from: 'rsvp_event_id'
    select 'John Smith', from: 'rsvp_userid'
    click_on 'Update Rsvp'

    visit rsvps_path
    expect(page).to have_content('test')
    
    visit rsvps_path
  end

  scenario 'Destroy RSVP' do
    createAdmin()
    ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2040-09-12 18:45', endtime: '2045-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
    user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
    rsvp = Rsvp.create!(event_id: ev.id, userid: user.id)

    visit rsvps_path
    click_on 'Destroy'
    
    visit rsvps_path
    expect(page).not_to(have_content('John'))
    
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