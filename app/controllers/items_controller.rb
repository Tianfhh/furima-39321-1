class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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

  def show
    @user = current_user if user_signed_in?
  end

  def edit
    
    if user_signed_in? && @item.user == current_user && !@item.sold_out?
     
    else
      redirect_to root_path
    end
    
  end

  def update
     
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    
    if @item.user == current_user
       @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  private

  def item_params
    params.require(:item).permit(:user_id, :item_name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end