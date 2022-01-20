class MoviesController < ApplicationController
    def index
        time = "#{Time.current.year}-#{Time.current.month}-#{Time.current.day}"
        p "time#{time.to_date.class}"
        p "class #{Movie.first.released_at.class}"
        @movies = Movie.where("status == 1")
    end
    def show
        @movie = Movie.find_by(id: params[:id])
        if params[:theater_id].present?
            @schedule = Schedule.where(theater_id:params[:theater_id],movie_id:params[:id])
            p "来ましたよ"
        else
            @movie = Movie.find_by(id: params[:id])
            @theater = Schedule.where(movie_id: @movie.id)
        end
    end
    def search
        @movies = Movie.search(params[:q]).where("status==1")
        render"index"
    end
    def date_schedule
        p "パラメータ#{params}"
        if params[:theater_id].present?
            @schedule = Schedule.where("screening_date LIKE ? ","%#{params[:month]}-#{params[:day]}%").where(theater_id: params[:theater_id]).where(movie_id: params[:movie_id])
            @movie = Movie.find(params[:movie_id])
        elsif 
            @theater = Schedule.where(movie_id: params[:movie_id])
            @movie = Movie.find(params[:movie_id])
        end
        render"show"
    end
end
