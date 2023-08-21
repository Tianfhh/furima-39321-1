class BuyersController < ApplicationController
  before_action :authenticate_user!
  
  
  def new
    @buyer = Buyer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer = Buyer.create(buyer_params)
    ShippingAddress.create(shipping_address_params)
    redirect_to root_path
    
  end

  private

  def buyer_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def shipping_address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(buyer_id: @buyer.id)
  end
end
