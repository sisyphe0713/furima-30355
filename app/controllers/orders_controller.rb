class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if Order.find_by(item_id: params[:item_id]) == nil
      if current_user.id == Item.find(params[:item_id])[:user_id]
        redirect_to root_path
      else
        @order_address = OrderAddress.new
      end
    else
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address_number, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(order_params[:item_id])[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  
end
