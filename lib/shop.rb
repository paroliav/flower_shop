require_relative '../lib/flower_shop/order_processor'
require_relative '../lib/flower_shop/slicing_error'
require_relative '../lib/flower_shop/receipt'

class Shop

  attr_accessor :catalogue

  def initialize(products)
    @catalogue = products
  end

  def process_order(orders)
    orders.each do |code, order_quantity|
      bundles = find_bundles(code, order_quantity)
      begin
        bundle_store = FlowerShop::OrderProcessor.process(order_quantity, bundles.dup)
        FlowerShop::Receipt.create(code, order_quantity, bundle_store)
      rescue FlowerShop::SlicingError
        puts "Can't create order with #{order_quantity} #{code} and available bundles sizes #{bundle_sizes(bundles)}"
      end
    end
  end

  private


  def bundle_sizes(bundles)
    p bundles
    bundles.collect do |bundle|
      bundle.quantity
    end
  end

  def find_bundles(code, order_quantity)
    bundles = catalogue_as_map[code]
    bundles.sort! { |a, b| a.quantity <=> b.quantity }
    bundles.reverse
  end

  def catalogue_as_map
    @catalogue.inject({}) do |map, product|
      map.merge!({product.code => product.bundles})
    end
  end


end
