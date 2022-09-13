class Book < ApplicationRecord
    validates :title, :author, presence: true
    validates :price, numericality: true
    validates :published, presence: true
end
