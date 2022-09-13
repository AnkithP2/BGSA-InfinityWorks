# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book: ', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '12.22'
    fill_in "Published", with: '2022-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end