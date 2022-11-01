# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

# event unit tests
RSpec.describe Event, type: :model do
   event = Event.new(title: 'test', date: '2022-09-12', starttime: '2022-09-12 18:45', endtime: '2022-09-12 19:45', logincode: 'abcd', location: 'at my house', eventpoints: '2')

  it 'is valid with valid attributes' do
    expect(event).to be_valid
  end

  # check empty containers
  it 'is not valid without a title' do
    event.title = nil
    expect(event).not_to be_valid
  end

  it 'is not valid without a date' do
    event.title = 'test'
    event.date = nil
    expect(event).not_to be_valid
  end

  it 'is not valid without a start time' do
    event.date = '2022-09-12'
    event.starttime = nil
    expect(event).not_to be_valid
  end

  it 'is not valid without a end time' do
    event.starttime = '2022-09-12 18:45'
    event.endtime = nil
    expect(event).not_to be_valid
  end

  it 'is not valid without a login code' do
    event.endtime = '2022-09-12 19:45'
    event.logincode = nil
    expect(event).not_to be_valid
  end

  it 'is not valid without a location' do
    event.logincode = 'abcd'
    event.location = nil
    expect(event).not_to be_valid
  end

  it 'is not valid without a event points' do
    event.location = "at my house"
    event.eventpoints = nil
    expect(event).not_to be_valid
  end

  # check disallowed characters on title
  it 'is not valid with a title not containing alphabetic characters' do
    event.eventpoints = '2'
    event.title = 'test#@'
    expect(event).not_to be_valid
  end

  it 'is not valid with a title containing numerical characters' do
    event.title = 'test0'
    expect(event).not_to be_valid
  end

  # check disallowed characters on logincode
  it 'is not valid with a logincode containing numerical characters' do
    event.title = 'test'
    event.logincode = 'abcd019='
    expect(event).not_to be_valid
  end

  # general text slot checks
  # SQL statement checks
  it 'is not valid textbox containing ALTER' do
    event.logincode = 'abcd'
    event.title = 'test ALTER'
    expect(event).not_to be_valid
  end
  
  it 'is not valid textbox containing CREATE' do
    event.title = 'test CREATE'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing DELETE' do
    event.title = 'test DELETE'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing DROP' do
    event.title = 'test DROP'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing EXEC' do
    event.title = 'test EXEC'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing INSERT' do
    event.title = 'test INSERT'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing MERGE' do
    event.title = 'test MERGE'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing SELECT' do
    event.title = 'test SELECT'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing UPDATE' do
    event.title = 'test UPDATE'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing UNION' do
    event.title = 'test UNION'
    expect(event).not_to be_valid
  end

  # SQL block statement checks
  it 'is not valid textbox containing block statements [ OR ]' do
    event.title = '[Sean ]'
    expect(event).not_to be_valid
  end
  
  it 'is not valid textbox containing block statements ( OR )' do
    event.title = '( )'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing block statements ^' do
    event.title = '^'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing block statements *' do
    event.title = '*'
    expect(event).not_to be_valid
  end

  it 'is not valid textbox containing block statements |' do
    event.title = '|'
    expect(event).not_to be_valid
  end

  #Final check for good text statement
  it 'Final check' do
      event.title = 'test'
      expect(event).to be_valid
  end
end
