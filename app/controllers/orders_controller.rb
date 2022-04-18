class OrdersController < ApplicationController
  def index
    @deliver_address = DeliverAddress.new
  end

  def create
    @deliver_address = DeliverAddress.new(order_params)
  end

  private

  def order_params
    params.require(:deliver_address).permit(:post_code, :prefecture, :city, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
