class Store < OpenStruct

  def self.service
    BestbuyService.new
  end

  def self.stores_by_location(zip)
    stores = service.stores(zip)
  end

  def self.find_by(zip)
    stores = stores_by_location(zip)[:stores]
    stores.map { |store| Store.new(store) }
  end

  def self.total_store(zip)
    stores_by_location(zip)[:total]
  end

  def self.find_one(id)
    store = service.store(id)[:stores][0]
    Store.new(store)
  end
end
