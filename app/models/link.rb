class Link < ApplicationRecord
    validates :section, :title, :link, presence: true

    scope :sections, -> {distinct.select(:section)}
    
    scope :specsections, -> {where(section:"123")}
end
