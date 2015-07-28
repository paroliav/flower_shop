module FlowerShop

  class Bundle

    attr_accessor :quantity, :price

    def initialize(attr={})
      @quantity = attr[:quantity]
      @price = attr[:price]
    end

  end

end