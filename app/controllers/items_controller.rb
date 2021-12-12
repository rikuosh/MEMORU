class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to items_path
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
     @item = Item.find(params[:id])
     @genres = Genre.all
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_path
  end
  
  def destroy
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :price, :store, :information, :size, :purchase_date, :warranty_period, :genre_id, :item_image )
  
  end
  
end
