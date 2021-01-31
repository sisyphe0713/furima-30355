class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address_number, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end