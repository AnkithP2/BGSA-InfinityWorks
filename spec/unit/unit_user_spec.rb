# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(firstname: 'jacob', lastname: 'jacobs', userpoints: '14', usertotal: '64')

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a firstname' do
    user.firstname = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a lastname' do
    user.lastname = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a userpoints' do
    user.userpoints = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a usertotal' do
    user.usertotal = nil
    expect(user).not_to be_valid
  end

  # check disallowed characters for first/last names
  it 'is not valid with a first name not containing alphabetic characters' do
    user.usertotal = '64'
    user.firstname = 'sean0'
    expect(user).not_to be_valid
  end

  it 'is not valid with a last name not containing alphabetic characters' do
    user.firstname = 'sean'
    user.lastname = 'kelly0'
    expect(user).not_to be_valid
  end

  # check numericality of userpoints and usertotal
  it 'is not valid with userpoint as non-numeric' do
    user.lastname = 'kelly'
    user.userpoints = 'a'
    expect(user).not_to be_valid
  end

  it 'is not valid with userpoint as non-integer' do
    user.userpoints = '1.2'
    expect(user).not_to be_valid
  end

  it 'is not valid with usertotal as non-numeric' do
    user.userpoints = '1'
    user.usertotal = 'a'
    expect(user).not_to be_valid
  end

  it 'is not valid with usertotal as non-integer' do
    user.usertotal = '1.2'
    expect(user).not_to be_valid
  end

  # general text slot checks
  # SQL statement checks
  it 'is not valid textbox containing ALTER' do
    user.firstname = 'aLink ALTER'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing CREATE' do
    user.firstname = 'aLink CREATE'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing DELETE' do
    user.firstname = 'aLink DELETE'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing DROP' do
    user.firstname = 'aLink DROP'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing EXEC' do
    user.firstname = 'aLink EXEC'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing INSERT' do
    user.firstname = 'aLink INSERT'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing MERGE' do
    user.firstname = 'aLink MERGE'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing SELECT' do
    user.firstname = 'aLink SELECT'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing UPDATE' do
    user.firstname = 'aLink UPDATE'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing UNION' do
    user.firstname = 'aLink UNION'
    expect(user).not_to be_valid
  end

  # SQL block statement checks
  it 'is not valid textbox containing block statements [ OR ]' do
    user.firstname = '[aLink ]'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing block statements ( OR )' do
    user.firstname = '( )'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing block statements ^' do
    user.firstname = '^'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing block statements *' do
    user.firstname = '*'
    expect(user).not_to be_valid
  end

  it 'is not valid textbox containing block statements |' do
    user.firstname = '|'
    expect(user).not_to be_valid
  end
end
