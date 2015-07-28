require_relative '../spec_helper'

describe FlowerShop::OrderBundle do

  describe 'decrease_count' do

    context 'it decreases the number of count' do

      let(:order_bundle) {FlowerShop::OrderBundle.new(2, FlowerShop::Bundle.new(:quantity => 4, :price => 5))}

      it 'decrease the count' do
        order_bundle.decrease_count
        expect(order_bundle.count).to eq(1)
      end



    end

  end


end