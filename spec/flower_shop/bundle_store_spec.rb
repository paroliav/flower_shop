require_relative '../spec_helper'

describe FlowerShop::BundleStore do

  let(:bundle_store) {FlowerShop::BundleStore.new}
  let(:bundle) {double "Bundle"}

  describe 'store_bundles' do

    it 'adds a bundle to the store' do
      expect(bundle_store.storage).to be_empty
      bundle_store.store_bundles(bundle)
      expect(bundle_store.storage).to include(bundle)
    end

  end

  describe 'last_bundle' do

    before do
      bundle_store.store_bundles(bundle)
    end

    it 'returns the last added bundle to the storage' do
      expect(bundle_store.last_bundle).to eq(bundle)
    end

  end

  describe 'remove_bundle' do

    before do
      bundle_store.store_bundles(bundle)
    end

    it 'returns the last added bundle to the storage' do
      bundle_store.remove_bundle(bundle)
      expect(bundle_store.storage).to be_empty
    end

  end

end