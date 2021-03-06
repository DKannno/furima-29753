class OrdersController < ApplicationController
  before_action :move_to_signed_in, only: [:index ]
  before_action :soldout_item_move_root, only: [:index ]
  before_action :set_item, only:[:index,:create]

  def index
    @order_address =OrderAddress.new
  end

  def create
    @order_address =OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private
 
  def order_params 
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,:orders_id ).merge(token: params[:token],item_id: params[:item_id],user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  
        card: order_params[:token], 
        currency: 'jpy' 
      )
  end
  
  def move_to_signed_in
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to   root_path
    end
    unless user_signed_in?
      redirect_to   new_user_session_path
    end
  end

  def soldout_item_move_root
    @item = Item.find(params[:item_id])
    unless @item.order.nil?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

