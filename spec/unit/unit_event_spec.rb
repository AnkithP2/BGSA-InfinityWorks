# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

# event unit tests
RSpec.describe Event, type: :model do
  event = Event.new(title: 'test', date: '2022-09-12', starttime: '18:45', endtime: '19:45', logincode: 'abcd',
                    location: 'at my house', eventpoints: '2')

  it 'is valid with valid attributes' do
    expect(event).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a date' do
    subject.date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a start time' do
    subject.starttime = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a end time' do
    subject.endtime = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a login code' do
    subject.logincode = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a location' do
    subject.location = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a event points' do
    subject.eventpoints = nil
    expect(subject).not_to be_valid
  end
end
