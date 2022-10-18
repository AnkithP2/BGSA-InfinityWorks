require 'rails_helper'

RSpec.describe User, type: :model do
    subject do
      described_class.new(firstname: 'jacob', lastname: 'jacobs', userpoints: 14, usertotal: 64)
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a name' do
      subject.firstname = nil
      expect(subject).not_to be_valid
    end
  end

  RSpec.describe User, type: :model do
    subject do
        described_class.new(firstname: 'jacob', lastname: 'jacobs', userpoints: 14, usertotal: 64)
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a name' do
      subject.lastname = nil
      expect(subject).not_to be_valid
    end
  end

  RSpec.describe User, type: :model do
    subject do
        described_class.new(firstname: 'jacob', lastname: 'jacobs', userpoints: 14, usertotal: 64)
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a name' do
      subject.userpoints = nil
      expect(subject).not_to be_valid
    end
  end

  RSpec.describe User, type: :model do
    subject do
        described_class.new(firstname: 'jacob', lastname: 'jacobs', userpoints: 14, usertotal: 64)
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a name' do
      subject.usertotal = nil
      expect(subject).not_to be_valid
    end
  end