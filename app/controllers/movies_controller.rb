class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    
    def show
        id = params[:id]
        @movie = Movie.find(id)
    end
    
    def new
        @movie = Movie.new
    end 

    def create
        @movie = Movie.create!(params.require(:movie).permit(:title,:rating,:release_date))
        flash[:notice] = "#{@movie.title} was successfully created."
        redirect_to movie_path(@movie)
    end
    
    def edit
        @movie = Movie.find params[:id]
    end

    def update
        @movie = Movie.find params[:id]
        @movie.update_attributes!(params.require(:movie).permit(:title,:rating,:release_date))
        flash[:notice] = "#{@movie.title} was successfully updated."
        redirect_to movie_path(@movie)
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted."
        redirect_to movies_path
    end

end