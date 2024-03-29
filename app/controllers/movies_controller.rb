class MoviesController < ApplicationController
    def index
        @movies = Movie.where(status:1)
    end
    def show
        @movie = Movie.find_by(id: params[:id])
        if params[:theater_id].present?
            if Time.current.month.to_i < 10
                month = "0#{Time.current.month}"
            else
                month = "#{Time.current.month}"
            end
            if Time.current.day.to_i < 10
                day = "0#{Time.current.day}"
            else
                day = "#{Time.current.day}"
            end
            a = Date.parse("#{Time.current.year}-#{month}-#{day}")
            p "今日の日にち#{a.since(6.days)}"
            @schedule = Schedule.where(theater_id:params[:theater_id],movie_id:params[:id]).where("screening_date = ?",a)
            @schedule_will = Schedule.where(theater_id:params[:theater_id],movie_id:params[:id]).where("screening_date <= ?",a.since(6.days))
            p "上映#{@schedule_will.count}"
        else
            @movie = Movie.find_by(id: params[:id])
            @schedule_day = Schedule.where(movie_id: @movie.id) 
        end
    end
    def search
        @movies = Movie.search(params[:q]).where(status:1)
        render"index"
    end
    def date_schedule
        p "パラメータ#{params}"
        if params[:theater_id].present?
            if params[:month].to_i < 10
                month = "0#{params[:month].to_i}"
            else
                month = params[:month]
            end
            if params[:day].to_i < 10
                day = "0#{params[:day].to_i}"
            else
                day = params[:day]
            end
            @schedule = Schedule.where("to_char(screening_date,'MM-DD') LIKE ? ","%#{month}-#{day}%").where(theater_id: params[:theater_id]).where(movie_id: params[:movie_id])
            @movie = Movie.find(params[:movie_id])
        elsif 
            @theater = Schedule.where(movie_id: params[:movie_id])
            @movie = Movie.find(params[:movie_id])
        end
        render"show"
    end
end
