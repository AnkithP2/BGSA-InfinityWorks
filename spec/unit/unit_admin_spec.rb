# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
    admin = Admin.new(name: 'Sean', email: 'anEmail@somewebsite.com', password: '1234')

    it 'is valid with valid attributes' do
      expect(admin).to be_valid
    end
    
    # check empty containers
    it 'is not valid without a name' do
      admin.name = nil
      expect(admin).not_to be_valid
    end

    it 'is not valid without a email' do
      admin.name = 'sean'
      admin.email = nil
      expect(admin).not_to be_valid
    end

    it 'is not valid without a password' do
      admin.email = 'anEmail@somewebsite.com'
      admin.password = nil
      expect(admin).not_to be_valid
    end

    # check disallowed characters
    it 'is not valid with a name not containing alphabetic characters' do
      admin.password = '1234'
      admin.name = 'sean#@'
      expect(admin).not_to be_valid
    end

    # email checks
    it 'is not valid email not containing @' do
      admin.name = 'sean'
      admin.email = 'anEmailsomewebsite.com'
      expect(admin).not_to be_valid
    end

    it 'is valid email not containing .' do
      admin.email = 'anEmail@somewebsitecom'
      expect(admin).to be_valid
    end


    # general text slot checks
    # SQL statement checks
    it 'is not valid textbox containing ALTER' do
      admin.name = 'sean ALTER'
      expect(admin).not_to be_valid
    end
    
    it 'is not valid textbox containing CREATE' do
        admin.name = 'sean CREATE'
        expect(admin).not_to be_valid
    end

    it 'is not valid textbox containing DELETE' do
        admin.name = 'sean DELETE'
        expect(admin).not_to be_valid
    end

    it 'is not valid textbox containing DROP' do
        admin.name = 'sean DROP'
        expect(admin).not_to be_valid
    end

    it 'is not valid textbox containing EXEC' do
        admin.name = 'sean EXEC'
        expect(admin).not_to be_valid
    end

    it 'is not valid textbox containing INSERT' do
        admin.name = 'sean INSERT'
        expect(admin).not_to be_valid
    end

    it 'is not valid textbox containing MERGE' do
        admin.name = 'sean MERGE'
        expect(admin).not_to be_valid
    end

    it 'is not valid textbox containing SELECT' do
        admin.name = 'sean SELECT'
        expect(admin).not_to be_valid
    end

    it 'is not valid textbox containing UPDATE' do
        admin.name = 'sean UPDATE'
        expect(admin).not_to be_valid
    end

    it 'is not valid textbox containing UNION' do
        admin.name = 'sean UNION'
        expect(admin).not_to be_valid
    end

    # SQL block statement checks

end

  
