class TheatersController < ApplicationController
    def index
        @theaters = Theater.order("store_name")
    end
    def show
        @theater = Theater.find(params[:id])
        p"パラメータ#{params[:id]}"
        a = Date.parse("#{Time.current.year}-0#{Time.current.month}-#{Time.current.day}")
        @schedules = Schedule.where(theater_id: params[:id]).where("screening_date >= ?",a)
            # .page(params[:page]).per(5)
        p"数#{@schedules.count}"
    end
end
