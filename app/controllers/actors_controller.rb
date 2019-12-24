class ActorsController < ApplicationController
  def new
    @actor = current_user.movies.find(params[:id]).actors.new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    @actor = current_user.movies.find(params[:id]).actors.new(actor_params)
    @actor.save
    redirect_to movie_path(current_user.movies.find(params[:id]))
  end
  private 
  def actor_params
      params.require(:actor).permit(:name, :img)
end
end
