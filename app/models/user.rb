class User < ApplicationRecord
    validates :firstname, :lastname, :userpoints, :usertotal, presence: true
    has_many :attendances
end
