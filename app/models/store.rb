class Store < OpenStruct

  def self.service
    BestbuyService.new
  end

  def self.find_by(location)
    stores = service.raw_stores(location)[:stores]
    stores.map do |store|
      Store.new(store)
    end
  end

end
