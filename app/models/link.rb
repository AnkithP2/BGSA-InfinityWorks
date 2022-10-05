class Link < ApplicationRecord
    validates :section, :title, :link, presence: true
end
