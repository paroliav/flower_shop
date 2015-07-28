module FlowerShop
  class Product

    attr_accessor :name, :code, :bundles

    def initialize(attr={})
      @name = attr[:name]
      @code = attr[:code]
      @bundles = attr[:bundles]
    end



  end
end