class Member < ApplicationRecord
    has_many :reservations
    has_secure_password 
end
