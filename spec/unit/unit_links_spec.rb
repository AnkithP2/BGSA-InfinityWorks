# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
    link = Link.new(section_id: '01', title: 'alink', link: 'link.com')

    it 'is valid with valid attributes' do
      expect(link).to be_valid
    end

    # check empty containers
    it 'is not valid without a section_id' do
      link.section_id = nil
      expect(link).not_to be_valid
    end

    it 'is not valid without a title' do
      link.section_id = '01'
      link.title = nil
      expect(link).not_to be_valid
    end

    it 'is not valid without a link' do
      link.title = 'alink'
      link.link = nil
      expect(link).not_to be_valid
    end

    # check disallowed characters
    it 'is not valid with a name not containing alphabetic characters' do
      link.password = '1234'
      link.name = 'sean#@'
      expect(link).not_to be_valid
    end

    # email checks
    it 'is not valid email not containing @' do
      link.name = 'sean'
      link.email = 'anEmailsomewebsite.com'
      expect(link).not_to be_valid
    end

    it 'is valid email not containing .' do
      link.email = 'anEmail@somewebsitecom'
      expect(link).to be_valid
    end


    # general text slot checks
    # SQL statement checks
    it 'is not valid textbox containing ALTER' do
      link.name = 'sean ALTER'
      expect(link).not_to be_valid
    end
    
    it 'is not valid textbox containing CREATE' do
        link.name = 'sean CREATE'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing DELETE' do
        link.name = 'sean DELETE'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing DROP' do
        link.name = 'sean DROP'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing EXEC' do
        link.name = 'sean EXEC'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing INSERT' do
        link.name = 'sean INSERT'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing MERGE' do
        link.name = 'sean MERGE'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing SELECT' do
        link.name = 'sean SELECT'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing UPDATE' do
        link.name = 'sean UPDATE'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing UNION' do
        link.name = 'sean UNION'
        expect(link).not_to be_valid
    end

    # SQL block statement checks
    it 'is not valid textbox containing block statements [ OR ]' do
        link.name = '[Sean ]'
        expect(link).not_to be_valid
    end
    
    it 'is not valid textbox containing block statements ( OR )' do
        link.name = '( )'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing block statements ^' do
        link.name = '^'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing block statements *' do
        link.name = '*'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing block statements |' do
        link.name = '|'
        expect(link).not_to be_valid
    end

    #Final check for good text statement
    it 'Final check' do
        link.name = 'sean'
        expect(link).to be_valid
    end
end

  
