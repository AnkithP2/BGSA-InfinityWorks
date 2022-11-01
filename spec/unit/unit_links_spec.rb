# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
    link = Link.new(section_id: '01', title: 'alink', link: 'link.com')

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

    # check disallowed characters for title
    it 'is not valid with a title not containing alphabetic characters' do
      link.link = 'link.com'
      link.title = 'aLink#@'
      expect(link).not_to be_valid
    end

    # check disallowed characters for section_id
    it 'is not valid section_id not containing an alpha-numerical character' do
      link.title = 'aLink'
      link.section_id = '01a#'
      expect(link).not_to be_valid
    end

    # general text slot checks
    # SQL statement checks
    it 'is not valid textbox containing ALTER' do
      link.title = 'aLink ALTER'
      expect(link).not_to be_valid
    end
    
    it 'is not valid textbox containing CREATE' do
        link.title = 'aLink CREATE'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing DELETE' do
        link.title = 'aLink DELETE'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing DROP' do
        link.title = 'aLink DROP'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing EXEC' do
        link.title = 'aLink EXEC'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing INSERT' do
        link.title = 'aLink INSERT'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing MERGE' do
        link.title = 'aLink MERGE'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing SELECT' do
        link.title = 'aLink SELECT'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing UPDATE' do
        link.title = 'aLink UPDATE'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing UNION' do
        link.title = 'aLink UNION'
        expect(link).not_to be_valid
    end

    # SQL block statement checks
    it 'is not valid textbox containing block statements [ OR ]' do
        link.title = '[aLink ]'
        expect(link).not_to be_valid
    end
    
    it 'is not valid textbox containing block statements ( OR )' do
        link.title = '( )'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing block statements ^' do
        link.title = '^'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing block statements *' do
        link.title = '*'
        expect(link).not_to be_valid
    end

    it 'is not valid textbox containing block statements |' do
        link.title = '|'
        expect(link).not_to be_valid
    end
end

  
