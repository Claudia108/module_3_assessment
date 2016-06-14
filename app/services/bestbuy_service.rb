class BestbuyService

  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1")
    @conn.headers["Authorization"] = ENV['api_key']
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def raw_stores
    parse(@conn.get "stores(postalCode=80202)?format=json&&apiKey=#{ENV['api_key']}")
  end

end
