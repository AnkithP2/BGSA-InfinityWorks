# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
    user = User.new(firstname: 'jacob', lastname: 'jacobs', userpoints: '14', usertotal: '64')

  
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end
  
    it 'is not valid without a firstname' do
      subject.firstname = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a lastname' do
      subject.lastname = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a userpoints' do
      subject.userpoints = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a usertotal' do
      subject.usertotal = nil
      expect(subject).not_to be_valid
    end
    
end

  
