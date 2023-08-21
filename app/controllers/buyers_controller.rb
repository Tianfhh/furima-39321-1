class BuyersController < ApplicationController
  before_action :authenticate_user!
  
  
  def new
    @buyer = Buyer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: buyer_params[:price],
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

end
