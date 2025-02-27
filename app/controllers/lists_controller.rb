class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.movie = @movie
    if @list.save
    redirect_to list_path(@movie)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
