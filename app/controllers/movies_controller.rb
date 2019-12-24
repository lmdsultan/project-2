class MoviesController < ApplicationController


  before_action :authenticate_user! ,only:[:show, :edit, :update, :destroy , :new]
  def index
    @movies = Movie.all
    @user = current_user
  end

  def new
    @movie = current_user.movies.new
    @user = current_user
  end

  def show
      @movie = Movie.find(params[:id])
      @user = current_user
  end

  def edit
    @movie = current_user.movies.find(params[:id])
    @user = current_user
    
  end

  def update
    @movie = current_user.movies.find(params[:id])
    @movie.update(movie_params)
    redirect_to @movie
  end


#  create a new movie 
  def create
    # @movie just a varible
    # current_user.movies it goes to the list of movies for the user and add a new movie
    @movie = current_user.movies.new(movie_params)
    @movie.save

    #this will redirectited to the index 
    redirect_to movies_path(@movie)
  end



  #destroy
def destroy
  @movie = current_user.movies.find(params[:id])
  @movie.destroy
  respond_to do |format|
    format.html { redirect_to movies_url, notice: 'movie successfully Deleted.' }
    format.json { head :no_content }
  end
end

#        Method for 
  private 
    def movie_params
        params.require(:movie).permit(:image, :title, :year, :star)
end
end