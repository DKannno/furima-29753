class OrdersController < ApplicationController
  before_action :move_to_signed_in, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_address =OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address =OrderAddress.new(order_params)
    # binding.pry
    if @order_address.valid?
      pay_item
      @order_address.save
    # binding.pry
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  # def set_item
  #   @item = Item.find(params[:item_id])
  # end

   
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
    unless user_signed_in?
      redirect_to   new_user_session_path
    end
  end

end

