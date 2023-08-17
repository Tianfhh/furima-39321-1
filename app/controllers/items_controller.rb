class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.new
    @user = User.find(params[:user_id])
    @items = @user.items.includes(:user)
  end

  
  def new
    @item = Item.new
  end

  def create
    
    @user = User.find(params[:user_id])
    @item = @user.item.new(item_params)
  
    if @item.save

      redirect_to user_items_path(@user)
    else
      @items = @user.items.includes(:user)
      render :new
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:content).merge(user_id: current_user.id)
  end

end
