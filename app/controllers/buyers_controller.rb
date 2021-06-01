class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_address_params)
    if @buyer_address.valid?
      @buyer_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_address_params
    params.require(:buyer_address).permit(:postal_code, :locality_id, :municipality, :street, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
