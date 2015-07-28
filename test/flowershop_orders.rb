require '../lib/shop'
require '../lib/flower_shop/shop_setup'
require '../lib/flower_shop/bundle'
require '../lib/flower_shop/product'
require '../lib/order'

class FlowershopOrders

  def self.process_flower_shop_orders

    flower_shop = FlowerShop::ShopSetup.stock_shop
    orders = Order.read_order('order1.txt')

    flower_shop.process_order(orders)

  end

  FlowershopOrders.process_flower_shop_orders


end

