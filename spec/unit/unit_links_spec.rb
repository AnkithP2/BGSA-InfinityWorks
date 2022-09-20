# location: spec/unit/unit_spec.rb
require 'rails_helper'

# link unit tests
RSpec.describe Link, type: :model do
   link = Link.new(author: 'sullivan', title:'stackoverflow' , link: 'https://stackoverflow.com/questions/3757380/ruby-on-rails-no-route-matches')

  it 'is valid with valid attributes' do
    expect(link).to be_valid
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a link' do
    subject.link = nil
    expect(subject).not_to be_valid
  end

end