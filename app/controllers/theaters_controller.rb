class TheatersController < ApplicationController
    def index
        @theaters = Theater.order("store_name")
    end
    def show
        @theater = Theater.find(params[:id])
        p"パラメータ#{params[:id]}"
        if Time.current.month.to_i < 10
            a = Date.parse("#{Time.current.year}-0#{Time.current.month}-#{Time.current.day}")
        else
            a = Date.parse("#{Time.current.year}-#{Time.current.month}-#{Time.current.day}")
        end
        @schedules = Schedule.where(theater_id: params[:id]).where("screening_date >= ?",a)
            # .page(params[:page]).per(5)
        p"数#{@schedules.count}"
    end
end
