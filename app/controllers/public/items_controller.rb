class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end
  
  def show
    # if end_user_signed_in?
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
    # else
    #   @genres = Genre.all
    #   @items = Item.all
    #   flash.now[:notice] = '会員登録をしてください'
    #   render :index
    # end
  end

  # def select_genre
  #   @genres = Genre.all
  #   @genre = Genre.find_by(id: params[:id])
  # end

  # def find_item(genre)
  #   genre.each do |id|
  #     item_array = Item.includes(:images).where(genre_id: id)
  #     # find_by()メソッドで該当のレコードがなかった場合、itemオブジェクトに空の配列を入れないようにするための処理
  #     if item_array.present?
  #       item_array.each do |item|
  #         if item.present?
  #         else
  #           # find_by()メソッドで該当のレコードが見つかった場合、@item配列オブジェクトにそのレコードを追加する
  #           @items.push(item)
  #         end
  #       end
  #     end
  #   end
  # end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :not_taxprice)
  end
end
