class SearchController < ApplicationController

  def index
    @stores = Store.find_by(params[:zip])
    @total = Store.total_store(params[:zip])
  end

  def show
    @store = Store.find_one(params[:store_id])
    @hours = @store.hoursAmPm.split("; ")
  end
end
