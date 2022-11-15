# frozen_string_literal: true

# location: spec/feature/integration_links_spec.rb
require 'rails_helper'

RSpec.describe('Links tests', type: :feature) do
  it 'Creating a title for links:' do
    visit new_registration_path
    fill_in 'admin_name', with: 'Brandon'
    fill_in 'admin_email', with: 'test@gmail.com'
    fill_in 'admin_password', with: '12345'
    click_on 'Create Admin'
    visit new_section_path
    fill_in 'Label', with: 'newsection'
    click_on 'Create Section'
    visit new_link_path
    fill_in 'link_title', with: 'stackoverflow'
    fill_in 'link_link', with: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches'
    click_on 'Create Link'
    visit links_path
    expect(page).to(have_content('stackoverflow'))
  end

  it 'Creating a link' do
    visit new_registration_path
    fill_in 'admin_name', with: 'Brandon'
    fill_in 'admin_email', with: 'test@gmail.com'
    fill_in 'admin_password', with: '12345'
    click_on 'Create Admin'
    visit new_section_path
    fill_in 'Label', with: 'newsection'
    click_on 'Create Section'
    visit new_link_path
    fill_in 'link_title', with: 'stackoverflow'
    fill_in 'link_link', with: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches'
    click_on 'Create Link'
    visit links_path
    expect(page).to(have_content('https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches'))
  end

  it 'Creating a section in links: ' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin(admin.name, admin.email, admin.password)
    visit new_section_path
    fill_in 'Label', with: 'newsection'
    click_on 'Create Section'
    visit new_link_path
    fill_in 'link_title', with: 'stackoverflow'
    fill_in 'link_link', with: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches'
    click_on 'Create Link'
    visit links_path
    expect(page).to(have_content('newsection'))
  end

  it 'Attempt to create a link without admin: ' do
    visit new_link_path
    expect(page).to(have_content('You need'))
  end

  it 'edit a link with admin: ' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin(admin.name, admin.email, admin.password)

    section = Section.create!(label: 'newsection')
    link = Link.create!(section: section, title: 'stackoverflow', link: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches')
    visit edit_link_path(id: link)
    fill_in 'link_title', with: 'othertitle'
    click_on 'Update Link'
    visit links_path
    expect(page).to(have_content('othertitle'))
  end

  it 'edit a link without admin: ' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin(admin.name, admin.email, admin.password)

    section = Section.create!(label: 'newsection')
    link = Link.create!(section: section, title: 'stackoverflow', link: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches')

    visit loginout_path
    visit edit_link_path(id: link)

    expect(page).to(have_content('You need'))
  end

  it 'delete a link with admin: ' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin(admin.name, admin.email, admin.password)

    section = Section.create!(label: 'newsection')
    link = Link.create!(section: section, title: 'stackoverflow', link: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches')
    visit links_path
    click_on 'Destroy'
    visit links_path

    expect(page).not_to(have_content('stackoverflow'))
  end

  it 'delete a link without admin: ' do
    admin = Admin.create!(name: 'Sean', email: 'test@gmail.com', password: '1234')
    loginAsAdmin(admin.name, admin.email, admin.password)

    section = Section.create!(label: 'newsection')
    link = Link.create!(section: section, title: 'stackoverflow', link: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches')

    visit loginout_path
    visit links_path
    expect(page).not_to(have_content('Destroy'))
  end
end

def loginAsAdmin(_name, email, password)
  visit(login_path)
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_on('Log In')
end
