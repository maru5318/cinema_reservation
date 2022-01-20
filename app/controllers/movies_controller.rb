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
    def search_date
        p "#{params}"
        day = "#{params[:month]}-#{params[:day]}"
        @movie = Movie.find(params[:movie_id])
        @schedule = Movie.search_date(day).where(theater_id:params[:theater_id],movie_id:params[:movie_id])
        p "検索結果#{@schedule.count}"
        render"show"
    end
end
