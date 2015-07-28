class Order

  def self.read_order(filename)
    orders_file = File.open("../test/orders/#{filename}", "r")
    orders_file.each_line do |order|
      values = order.split(' ')
      build_order(values)
    end
    @order_details
  end

  def self.build_order(details)
    order_details = @order_details || {}
    order_details[details[1]] = details[0]
    @order_details = order_details
  end

end