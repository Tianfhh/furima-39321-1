class BuyersController < ApplicationController
  before_action :authenticate_user!
  
  
  def new
    @buyer_shipping_address = BuyerShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @buyer_shipping_address = BuyerShippingAddress.new(buyer_params)
    if @buyer_shipping_address.valid?
      pay_item
      @buyer_shipping_address.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def buyer_params
    params.require(:buyer_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: @buyer_shipping_address.token,
      currency: 'jpy'
    )
  end

end
