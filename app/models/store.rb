class Store < OpenStruct

  def self.service
    BestbuyService.new
  end

  def self.all
    stores = service.raw_stores
    stores.map do |store|
      Store.new(store)
    end
  end

end
