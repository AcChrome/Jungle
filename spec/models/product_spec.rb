require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new({:name => "Dark Tech"})
    @product = Product.new({:name => "Invisibility Cloak", :price_cents => 10000000, :quantity => 2, :category_id => @category.id})
  end

  describe 'Validations' do
    it 'should save successfully with valid inputs' do
      @product.save
      expect(@product).to be_present
    end

    it 'should have a valid name' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a valid price' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should have a valid quanitiy' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'Should have a valid category' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end

