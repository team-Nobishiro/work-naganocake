class Admin::ItemsController < ApplicationController

  def new
  	@item_new = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
  	params.require(:item).permit(:name, :introduction, :image, :not_taxprice, :is_sale_status, :genre_id)
  end
  	
end