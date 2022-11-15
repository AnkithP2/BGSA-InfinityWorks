# frozen_string_literal: true

# location: spec/feature/integration_links_spec.rb
require 'rails_helper'

RSpec.describe('Links tests', type: :feature) do
  it 'Creating a title for links:' do
    visit new_registration_path
    fill_in 'Name', with: 'Brandon'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '12345'
    click_on 'Create Admin'
    visit new_section_path
    fill_in 'Label', with: 'newsection'
    click_on 'Create Section'
    visit new_link_path
    fill_in 'Title', with: 'stackoverflow'
    fill_in 'Link', with: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches'
    click_on 'Create Link'
    visit links_path
    expect(page).to(have_content('stackoverflow'))
  end

  it 'Creating a link: ' do
    visit new_registration_path
    fill_in 'Name', with: 'Brandon'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '12345'
    click_on 'Create Admin'
    visit new_section_path
    fill_in 'Label', with: 'newsection'
    click_on 'Create Section'
    visit new_link_path
    fill_in 'Title', with: 'stackoverflow'
    fill_in 'Link', with: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches'
    click_on 'Create Link'
    visit links_path
    expect(page).to(have_content('https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches'))
  end

  it 'Creating a section in links:' do
    visit new_registration_path
    fill_in 'Name', with: 'Brandon'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '12345'
    click_on 'Create Admin'
    visit new_section_path
    fill_in 'Label', with: 'newsection'
    click_on 'Create Section'
    visit new_link_path
    fill_in 'Title', with: 'stackoverflow'
    fill_in 'Link', with: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches'
    click_on 'Create Link'
    visit links_path
    expect(page).to(have_content('newsection'))
  end
end
