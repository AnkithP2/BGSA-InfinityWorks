class Link < ApplicationRecord
    validates :author, :title, :link, presence: true
end
