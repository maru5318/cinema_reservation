class MoviesController < ApplicationController
    def index
        @movies = Movie.where(status:1)
    end
    def show
        @movie = Movie.find_by(id: params[:id])
        if params[:theater_id].present?
            if Time.current.month.to_i < 10
                a = Date.parse("#{Time.current.year}-0#{Time.current.month}-#{Time.current.day}")
            else
                a = Date.parse("#{Time.current.year}-#{Time.current.month}-#{Time.current.day}")
            end
            @schedule = Schedule.where(theater_id:params[:theater_id],movie_id:params[:id]).where("screening_date = ?",a)
            @schedule_will = Schedule.where(theater_id:params[:theater_id],movie_id:params[:id]).where("screening_date < ?",a.since(6.days))
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
            @schedule = Schedule.where("to_char(screening_date,'MM-DD') LIKE ? ","%#{params[:month]}-#{params[:day]}%").where(theater_id: params[:theater_id]).where(movie_id: params[:movie_id])
            @movie = Movie.find(params[:movie_id])
        elsif 
            @theater = Schedule.where(movie_id: params[:movie_id])
            @movie = Movie.find(params[:movie_id])
        end
        render"show"
    end
end
