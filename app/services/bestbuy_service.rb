class BestbuyService

  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com")
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def stores(zip)
    parse(@conn.get "/v1/stores(area(#{zip},25))",
                  { format: 'json',
                    pageSize: 15,
                    apiKey: ENV['api_key']
                  })
  end

  def store(id)
    parse(@conn.get "/v1/stores(storeId=#{id})",
                  { format: 'json',
                    apiKey: ENV['api_key']
                  })
  end
end
