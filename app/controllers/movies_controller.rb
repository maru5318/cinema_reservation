class MoviesController < ApplicationController
    def index
        @movies = Movie.order(:title)
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
end
