class Reservation < ApplicationRecord
    belongs_to :member
    belongs_to :schedule
end
