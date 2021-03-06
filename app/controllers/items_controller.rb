class ItemsController < ApplicationController
  

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
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
    redirect_to root_path unless current_user.id == @item.user_id
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
    @item.destroy
    end
    redirect_to root_path
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :item_category_id, :item_condition_id, :price, :prefecture_id, :shipping_cost_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  
  
end
