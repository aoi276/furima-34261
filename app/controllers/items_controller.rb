class ItemsController < ApplicationController
 before_action :authenticate_user!, only:[:new, :create, :edit, :destroy]
 before_action :set_item, only: [:show, :edit, :update, :destroy]
 before_action :sold_out_item, only: [:edit, :update, :destroy]

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
    @item.update(item_params)
    if @item.save
      redirect_to item_params
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit({images: []}, :item_name, :text, :category_id, :state_id, :burden_id, :locality_id, :delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out_item
    if @item.buyer.present? || current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end
