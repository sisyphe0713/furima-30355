class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_parameter, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    if current_user.id == @item.user_id
    elsif user_signed_in?
      redirect_to root_path
    else
      redirect_to user_session_path
    end
  end

  def update
    if current_user.id == @item.user_id
      @item.update(item_params)
      if @item.save
        redirect_to item_path
      else
        render :edit
      end
    end
  end

  def destroy
    if current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path
      else
        render :show
      end
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :ship_day_id, :image).merge(user_id: current_user.id)
  end

  def set_parameter
    @item = Item.find(params[:id])
  end
  
end
