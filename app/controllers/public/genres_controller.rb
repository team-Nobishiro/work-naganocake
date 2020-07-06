class Public::GenresController < ApplicationController
  def show
		@items = Item.all
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name, :is_valid)
  end
end
