# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject do
    described_class.new(name: 'Rick Morty', email: 'test@tamu.edu', password: "testPass")
  end

  it 'is valid with all valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).not_to be_valid
  end

end