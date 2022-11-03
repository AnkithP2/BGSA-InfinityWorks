# frozen_string_literal: true
'''
require "rails_helper"

RSpec.describe "creating an user: ", type: :feature do
  scenario "valid inputs" do
    visit new_user_path
    fill_in "Firstname", with: "John"
    fill_in "Lastname", with: "Smith"
    fill_in "Userpoints", with: 23
    fill_in "Usertotal", with: 26
    click_on "Create User"
    visit users_path

    expect(page).to have_content("John")
  end
end

RSpec.describe "creating an user: ", type: :feature do
  scenario "valid inputs" do
    visit new_user_path
    fill_in "Firstname", with: "John"
    fill_in "Lastname", with: "Smith"
    fill_in "Userpoints", with: 23
    fill_in "Usertotal", with: 26
    click_on "Create User"
    visit users_path

    expect(page).to have_content("Smith")
  end
end

RSpec.describe "creating an user: ", type: :feature do
  scenario "valid inputs" do
    visit new_user_path
    fill_in "Firstname", with: "John"
    fill_in "Lastname", with: "Smith"
    fill_in "Userpoints", with: 23
    fill_in "Usertotal", with: 26
    click_on "Create User"
    visit users_path

    expect(page).to have_content(23)
  end
end

RSpec.describe "creating an user: ", type: :feature do
  scenario "valid inputs" do
    visit new_user_path
    fill_in "Firstname", with: "John"
    fill_in "Lastname", with: "Smith"
    fill_in "Userpoints", with: 23
    fill_in "Usertotal", with: 26
    click_on "Create User"
    visit users_path

    expect(page).to have_content(26)
  end
end
'''