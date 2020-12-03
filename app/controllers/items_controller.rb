class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @item = Item.new
  end
  
  def index
  end

  def create
    @item = Item.new(item_params)
    if  @item.valid?
        @item.save 
        redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

end