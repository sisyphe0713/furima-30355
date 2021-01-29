class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    if user_signed_in? && current_user.id == Item.find(params[:id]).user_id
      @item = Item.find(params[:id])
    elsif user_signed_in?
      redirect_to root_path
    else
      redirect_to user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :ship_day_id, :image).merge(user_id: current_user.id)
  end

end
