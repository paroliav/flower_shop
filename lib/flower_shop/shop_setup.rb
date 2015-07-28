module FlowerShop
  class ShopSetup

    def self.stock_shop()

      rose_bundles = [
          Bundle.new({:quantity => 5, :price => 6.99}),
          Bundle.new({:quantity => 10, :price => 12.99})
      ]
      roses = Product.new({:name => 'Roses', :code => 'R12', :bundles => rose_bundles })

      lily_bundles = [
          Bundle.new({:quantity => 3, :price => 9.95}),
          Bundle.new({:quantity => 6, :price => 16.95}),
          Bundle.new({:quantity => 9, :price => 24.95})
      ]
      lilies = Product.new({:name => 'Lilies', :code => 'L09', :bundles => lily_bundles})

      tulip_bundles = [
          Bundle.new({:quantity => 3, :price => 5.95}),
          Bundle.new({:quantity => 5, :price => 9.95}),
          Bundle.new({:quantity => 9, :price => 16.99})
      ]
      tulips = Product.new({:name => 'Tulips', :code => 'T58', :bundles => tulip_bundles})

      Shop.new([roses, lilies, tulips])
    end

  end
end