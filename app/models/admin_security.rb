class AdminSecurity < ApplicationRecord
    validates :last_login, presence: true
end
