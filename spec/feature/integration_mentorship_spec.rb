# location: spec/feature/integration_spec.rb
require 'rails_helper'

#event integration tests
RSpec.describe 'creating an mentorship: ', type: :feature do

  scenario 'Create valid mentorship' do

    #create admin
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'

    #create mentor
    visit new_user_path
    fill_in 'Firstname', with: 'Mentor'
    fill_in 'Lastname', with: 'A'
    fill_in 'Userpoints', with: 99
    fill_in 'Usertotal', with: 99
    click_on 'Create User'

    #create mentee
    visit new_user_path
    fill_in 'Firstname', with: 'Mentee'
    fill_in 'Lastname', with: 'A'
    fill_in 'Userpoints', with: 10
    fill_in 'Usertotal', with: 10
    click_on 'Create User'

    #create the mentorship
    visit new_mentorship_path
    fill_in 'Mentor', with: '1'
    fill_in 'Mentee', with: '2'
    click_on 'Create Mentorship'
    visit mentorships_path

    expect(page).to have_content('Mentor')
  end

  scenario 'Invalid mentor' do

    #create admin
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'

    #create mentor
    visit new_user_path
    fill_in 'Firstname', with: 'Mentor'
    fill_in 'Lastname', with: 'A'
    fill_in 'Userpoints', with: 99
    fill_in 'Usertotal', with: 99
    click_on 'Create User'

    #create mentee
    visit new_user_path
    fill_in 'Firstname', with: 'Mentee'
    fill_in 'Lastname', with: 'A'
    fill_in 'Userpoints', with: 10
    fill_in 'Usertotal', with: 10
    click_on 'Create User'

    #create the mentorship
    visit new_mentorship_path
    fill_in 'Mentor', with: '0'
    fill_in 'Mentee', with: '2'
    click_on 'Create Mentorship'
    visit mentorships_path

    expect(page).to_not have_content('0')
  end

  scenario 'Invalid mentee' do

    #create admin
    visit new_registration_path
    fill_in 'Name', with: 'Ankith'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '1234'
    click_on 'Create Admin'

    #create mentor
    visit new_user_path
    fill_in 'Firstname', with: 'Mentor'
    fill_in 'Lastname', with: 'A'
    fill_in 'Userpoints', with: 99
    fill_in 'Usertotal', with: 99
    click_on 'Create User'

    #create mentee
    visit new_user_path
    fill_in 'Firstname', with: 'Mentee'
    fill_in 'Lastname', with: 'A'
    fill_in 'Userpoints', with: 10
    fill_in 'Usertotal', with: 10
    click_on 'Create User'

    #create the mentorship
    visit new_mentorship_path
    fill_in 'Mentor', with: '1'
    fill_in 'Mentee', with: '0'
    click_on 'Create Mentorship'
    visit mentorships_path

    expect(page).to_not have_content('0')
  end
end