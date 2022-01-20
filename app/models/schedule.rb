class Schedule < ApplicationRecord
    belongs_to :theater
    belongs_to :movie
    has_many :reservations
    validates :screen_no, presence: true
    validates :theater_id, presence: true
    validates :movie_id, presence: true
    validates :screening_date, presence: true
    validates :starttime, presence: true
    validates :endtime, presence: true
end
