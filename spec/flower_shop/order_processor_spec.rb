require_relative '../spec_helper'

describe FlowerShop::OrderProcessor do

  describe 'process' do

    context 'returns multiples of exact match' do

      let(:bundles) {[
          FlowerShop::Bundle.new(:quantity => 10, :price => 10),
          FlowerShop::Bundle.new(:quantity => 5, :price => 5),
      ]}


      it 'process' do
        store = FlowerShop::OrderProcessor.process(20, bundles)

        expect(store.last_bundle.count).to eq(2)
        expect(store.last_bundle.quantity).to eq(10)
        expect(store.last_bundle.price).to eq(10)
      end



    end

    context 'returns multiples bundles from the bundles at shop' do

      let(:bundles) {[
          FlowerShop::Bundle.new(:quantity => 9, :price => 9),
          FlowerShop::Bundle.new(:quantity => 5, :price => 5),
          FlowerShop::Bundle.new(:quantity => 3, :price => 3),
      ]}


      it 'process' do
        store = FlowerShop::OrderProcessor.process(42, bundles)

        expect(store.storage[0].count).to eq(4)
        expect(store.storage[0].quantity).to eq(9)
        expect(store.storage[0].price).to eq(9)

        expect(store.storage[1].count).to eq(2)
        expect(store.storage[1].quantity).to eq(3)
        expect(store.storage[1].price).to eq(3)
      end



    end

  end


end