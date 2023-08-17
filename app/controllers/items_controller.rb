class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:user, :item_name, :description, :category_id, :condition_id, :shippig_fee_id, :prefecture_id, :shipping_date_id, :price)
  end

end
