class Api::V1::ItemsController < ApiController

  def index
    respond_with Item.all
  end

end
