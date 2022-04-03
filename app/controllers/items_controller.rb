class ItemsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
    @item = Item.new
  end
  
  private

  def items_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
