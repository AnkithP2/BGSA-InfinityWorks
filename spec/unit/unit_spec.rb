# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', section: 'J.K. Rowling', price: '2.5', published: '2022-09-12')
  end
end
