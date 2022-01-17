class Theater < ApplicationRecord
    has_many :schedules
    has_many :screens
end
