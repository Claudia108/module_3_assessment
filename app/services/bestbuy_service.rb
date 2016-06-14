class BestbuyService

  def initialice
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1")
    @conn.headers["Authorizatin"] = ENV['api_key']
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def stores
    zip = params[:postal_code]
    @conn.get "stores/stores(postalCode=#{zip})?format=json&show=storeId,storeType,name,city,region&apiKey=#{ENV['api_key']}"
  end

end
