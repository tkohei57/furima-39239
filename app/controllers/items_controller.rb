class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :item_condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
