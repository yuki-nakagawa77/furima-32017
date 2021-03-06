class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :data, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.order_history != nil
      redirect_to root_path
    else
      @order = OrderAddress.new
    end
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def data
    @item = Item.find(params[:item_id])
  end 

end
