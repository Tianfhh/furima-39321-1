class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show]

  def index
      @items = Item.includes(:user).order("created_at DESC")
  end

  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def show
  
  end



  

  private

  def item_params
    params.require(:item).permit(:user_id, :item_name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end