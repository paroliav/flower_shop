module FlowerShop

  class Receipt

    def self.create(code, order_quantity, bundle_store)
      puts "#{order_quantity} #{code} $#{'%.02f' % total_cost(bundle_store)}"
      bundle_store.storage.each do |bundle|
        puts "\t#{bundle.count} X #{bundle.quantity} $#{'%.02f' % bundle.price}"
      end

    end

    private

    def self.total_cost(bundle_store)
      prices = bundle_store.storage.collect do |bundle|
        bundle.count * bundle.price
      end
      prices.reduce(:+)
    end

  end

end