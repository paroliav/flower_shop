require_relative '../../lib/flower_shop/slicing_error'
require_relative '../../lib/flower_shop/order_bundle'
require_relative '../../lib/flower_shop/bundle_store'

module FlowerShop

  class OrderProcessor

      def self.process(order_quantity, bundles)
        begin
          @store = BundleStore.new
          slice_order_into_bundles(order_quantity.to_i, bundles)
          @store
        rescue SlicingError
          bundles.shift
          retry unless bundles.empty?
          raise SlicingError
        end
      end

      private

      def self.slice_order_into_bundles(order_quantity, bundles)
        reject_bundles!(order_quantity, bundles)
        bundle_to_try = @needed_bundles.first
        bundle_count = order_quantity / bundle_to_try.quantity
        order_bundle = OrderBundle.new(bundle_count, bundle_to_try)
        @store.store_bundles(order_bundle)
        return if order_quantity % bundle_to_try.quantity == 0
        slice_order_into_bundles(remaining(order_quantity, order_bundle), @needed_bundles)
      end

      def self.reject_bundles!(order_quantity, bundles)
        @needed_bundles = bundles.reject { |bundle| bundle.quantity > order_quantity }
        raise SlicingError if @needed_bundles.empty?
      end

      def self.remaining(order_quantity, order_bundle)
        remaining_order_quantity = order_quantity - order_bundle.count * order_bundle.quantity
        if remaining_order_quantity < @needed_bundles.last.quantity
          adjust_store_and_recount(order_quantity, order_bundle.quantity)
        else
          remaining_order_quantity
        end
      end

      def self.adjust_store_and_recount(order_quantity, bundle_quantity)
        raise SlicingError if @needed_bundles.size == 1
        begin
          @store.last_bundle.decrease_count
          last_bundle = @store.last_bundle
        rescue SlicingError
          @store.remove_bundle(@store.last_bundle)
          last_bundle = nil
        end
        @needed_bundles.shift
        order_quantity - (last_bundle.respond_to?(:count) ? last_bundle.count : 0) * bundle_quantity
      end

  end

end