class BuyersController < ApplicationController

  def index
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.valid?
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

end
