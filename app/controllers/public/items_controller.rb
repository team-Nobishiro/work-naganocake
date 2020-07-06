class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end
  
  def show
    @item = Item.find(params[:id])
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
