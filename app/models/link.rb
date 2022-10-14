class Link < ApplicationRecord
    validates :title, :link, presence: true
    belongs_to :section
end
