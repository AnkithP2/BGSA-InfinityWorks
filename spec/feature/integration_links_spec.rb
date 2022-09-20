# location: spec/feature/integration_links_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a link: ', type: :feature do
  scenario 'valid inputs' do
    visit new_link_path
    fill_in 'Author', with: 'sullivan'
    fill_in 'Title', with: 'stackoverflow'
    fill_in 'Link', with: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches'
    visit links_path
    expect(page).to have_content('stackoverflow')
  end
end