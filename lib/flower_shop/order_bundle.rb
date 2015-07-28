module FlowerShop

  class OrderBundle
    attr_accessor :count, :quantity, :price

    def initialize(count, bundle)
      @count = count
      @quantity = bundle.quantity
      @price = bundle.price
    end

    def decrease_count
      raise SlicingError if @count == 1
      @count -= 1
    end

  end

end