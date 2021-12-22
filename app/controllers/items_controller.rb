class ItemsController < ApplicationController

  def index
    @genres = current_user.genres.order(created_at: :desc)
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      all_items = @genre.items
    else
      all_items = Item.includes(:genre)
    end
    @items = current_user.items.page(params[:page])
     respond_to do |format|
      format.html
       format.pdf do
        render pdf: "Items: #{@items.count}", template: "items/index_pdf.html.erb", encoding: 'UTF-8', layout: "pdf"
       end
    end
  end

  def new
    @item = Item.new
    @genres = current_user.genres
  end

  def create
    @genres = current_user.genres
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
     redirect_to items_path
    else
      render:new
    end
  end

  def show
    @item = Item.find(params[:id])
    respond_to do |format|
      format.html
       format.pdf do
        render pdf: "Item id: #{@item.id}", template: "items/show_pdf.html.erb", encoding: 'UTF-8'
       end
    end
  end

  def edit
     @item = Item.find(params[:id])
     @genres = Genre.all
  end

  def update
    @genres = Genre.all
    @item = Item.find(params[:id])
    if @item.update(item_params)
     redirect_to items_path
    else
      render:edit
    end
  end

  def dispose
    @items = Item.all
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :store, :information, :size, :purchase_date, :warranty_period, :genre_id, :item_image, :status )

  end

end
