class ItemsController < ApplicationController
  before_action :move_to_signed_in, only: [:new]
  before_action :set_item, only:[:show,:edit,:update,:destroy]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
    redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:description,:category_id,:condition_id,:postage_id,:prefecture_id,:handling_time_id,:price,:image).merge(user_id: current_user.id)
  end
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  root_path
    end
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
