class BestbuyService

  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com")
    # @conn.headers["Authorization"] = ENV['api_key']
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def raw_stores(location)
    parse(@conn.get "/v1/stores(area(#{location},25))?format=json?pageSize=15?apiKey=#{ENV['api_key']}")
  end

end
