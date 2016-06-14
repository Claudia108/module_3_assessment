class Api::V1::ItemsController < Api::V1::ApiController

  def index
    respond_with Item.all
  end

end
