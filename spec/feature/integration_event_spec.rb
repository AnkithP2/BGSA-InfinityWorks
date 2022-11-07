# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# event integration tests
RSpec.describe 'creating an event: ', type: :feature do
  scenario 'valid inputs' do
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'

    visit new_event_path
    fill_in 'Title', with: 'test'
    fill_in 'Starttime', with: '2022-09-12 18:45'
    fill_in 'Endtime', with: '2022-09-12 19:45'
    fill_in 'Logincode', with: 'abcd'
    fill_in 'Location', with: 'At my house'
    fill_in 'Eventpoints', with: '2'
    click_on 'Create Event'
    visit events_path

    expect(page).to have_content('Ankith')
  end
end

RSpec.describe 'creating an event with zero RSVP: ', type: :feature do
    scenario 'valid inputs' do
      visit new_registration_path
      fill_in 'Name', with: 'Ankith'
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '1234'
      click_on 'Create Admin'
  
      ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2022-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
      visit event_path(id: ev.id)
      expect(page).to have_content('None')
    end
end

RSpec.describe 'creating an event with at least one RSVP/Attended: ', type: :feature do
    scenario 'valid inputs' do
      visit new_registration_path
      fill_in 'Name', with: 'Ankith'
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '1234'
      click_on 'Create Admin'
  
      ev = Event.create!(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2022-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')
      user = User.create!(firstname: 'John', lastname: 'Smith', userpoints: 14, usertotal: 20)
      at = Attendance.create!(event_id: ev.id, userid: user.id, password: 'abcd')
      rsvp = Rsvp.create!(event_id: ev.id, userid: user.id)

      visit event_path(id: ev.id)
      expect(page).not_to have_content('None')
    end
  end