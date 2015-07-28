module FlowerShop

  class BundleStore

    attr_accessor :storage

    def initialize
      @storage = []
    end

    def store_bundles(order_bundle)
      @storage << order_bundle
    end

    def last_bundle
      @storage.last
    end

    def remove_bundle(bundle)
      @storage.delete(bundle)
    end

  end


end