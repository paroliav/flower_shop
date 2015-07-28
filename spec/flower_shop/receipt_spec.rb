require_relative '../spec_helper'

describe FlowerShop::Receipt do

  describe 'create' do

    let(:code) {'R12'}
    let(:order_quantity) {42}
    let(:bundle_store) {FlowerShop::BundleStore.new}
    let(:order_bundle1) {FlowerShop::OrderBundle.new(4, FlowerShop::Bundle.new(:quantity => 9, :price => 9))}
    let(:order_bundle2) {FlowerShop::OrderBundle.new(2, FlowerShop::Bundle.new(:quantity => 3, :price => 3))}

    before do
      FlowerShop::Receipt.stub(:total_cost).and_return(42)
    end

    it 'creates a formatted receipt of the ordered bundles' do
      bundle_store.store_bundles(order_bundle1)
      bundle_store.store_bundles(order_bundle2)

      FlowerShop::Receipt.create(code, order_quantity, bundle_store)
      expect(FlowerShop::Receipt).to have_received(:total_cost)
    end

  end


end