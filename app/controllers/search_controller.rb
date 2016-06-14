class SearchController < ApplicationController

  def index
    @stores = Store.all
  end
end
