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
