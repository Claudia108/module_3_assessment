class Api::V1::ItemsController < Api::V1::ApiController

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    respond_with item.delete
  end

  # def create
  #   respond_with Item.create(params)
  # end


  private

  def item_params
    params.require(:items).permit(:id, :name, :description, :image_url)
  end

  # def create_item(params)
  #   params[:name, :description, :image_url]
  #
  # end
end
