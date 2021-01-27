class ItemsController < ApplicationController
  def index
  end

  def new
    if user_signed_in? != true
      redirect_to user_session_path
    else
      @item = Item.new
      render :new
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
    params.require(:item).permit(:name, :price, :text, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :ship_day_id, :image).merge(user_id: current_user.id)
  end

end
