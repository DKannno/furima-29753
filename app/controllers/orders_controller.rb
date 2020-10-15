class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address =OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address =OrderAddress.new(order_params)
   
    if @order_address.valid?
      pay_item
      @order_address.save
    binding.pry
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
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :orders_id ,:item_id).merge(token: params[:token],user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  
        card: order_params[:token], 
        currency: 'jpy' 
      )
  end
  


end

