class TheatersController < ApplicationController
    def index
        @theaters = Theater.order("store_name")
    end
    def show
        @theater = Theater.find(params[:id])
        @schedules = Schedule.where(theater_id: params[:id])
    end
end
