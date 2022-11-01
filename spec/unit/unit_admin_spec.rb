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

    it 'is not valid email not containing @' do
        admin.name = 'sean'
        admin.email = 'anEmailsomewebsite.com'
        expect(admin).not_to be_valid
    end

    it 'is valid email not containing .' do
        admin.email = 'anEmail@somewebsitecom'
        expect(admin).to be_valid
    end

    # text slot containing:
        # sql statements:
            # ALTER
            # CREATE
            # DELETE
            # DROP
            # EXEC
            # INSERT
            # MERGE
            # SELECT
            # UPDATE
            # UNION
        # block statements
end

  
