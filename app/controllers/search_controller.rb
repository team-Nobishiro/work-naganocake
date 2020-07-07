class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'end_user'
      if method == 'perfect'
        EndUser.where(last_name: content, first_name: content)
      elsif method == 'forward'
        EndUser.where('last_name LIKE ?', content+'%')
      elsif method == 'backward'
        EndUser.where('last_name LIKE ?', '%'+content)
      else
        EndUser.where('last_name LIKE ?', '%'+content+'%')
      end
    elsif model == 'item'
      if method == 'perfect'
        Item.where(name: content)
      elsif method == 'forward'
        Item.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        Item.where('name LIKE ?', '%'+content)
      else
        Item.where('name LIKE ?', '%'+content+'%')
      end
    end
  end
end
