class Public::SearchsController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]
    if @range == '1'
      @end_user = EndUser.search(search,word)
    else
      @item = item.search(search,word)
    end
  end
end
