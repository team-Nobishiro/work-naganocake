class Admin::GenresController < ApplicationController
  
	def index
		@genres = Genre.all
		@genre = Genre.new
	end
	def edit
	  @genre = Genre.find(params[:id])
	end
    def create
		@genre = Genre.new(genre_params)
    if  @genre.save
      redirect_to admin_genres_path
    else
      redirect_to edit_admin_genre_path
    end
	end

	def update
	   genre = Genre.find(params[:id])
    if genre.update(genre_params)
      redirect_to admin_genres_path
    else
      redirect_to edit_admin_genre_path(genre)
    end
	end
  def valid
    @genre = Genre.find(params[:id])
  end
  def hide
    @genre = Genre.find(params[:id])
    @genre.update(is_valid: true)
    reset_session
    flash[:notice] = "このジャンルを停止します"
    redirect_to root_path
  end
	 private
     def genre_params
    params.require(:genre).permit(:name, :is_valid)
  end
  end
