class Section < ApplicationRecord
    validates :label, presence: true
    has_many :links
end
