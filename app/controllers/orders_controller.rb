class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @deliver_address = DeliverAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:deliver_address).permit(:post_code, :prefecture_id, :city, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  
end
