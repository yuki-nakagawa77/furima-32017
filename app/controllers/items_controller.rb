class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :data, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end
  
  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
    if @item.user.id != current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.user.id != current_user.id
      redirect_to action: :index
    end
    @item.destroy
    redirect_to root_path
  end




  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def data
    @item= Item.find(params[:id])
  end 

end

