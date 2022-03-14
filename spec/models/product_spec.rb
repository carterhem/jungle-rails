require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'given all 4 validation fields' do
      it 'should save successfully' do
        @category = Category.new
       @product = Product.new(name: "First", price: 10, quantity: 2, category: @category)
        expect(@product.name).to be_present
        expect(@product.price).to be_present
        expect(@product.quantity).to be_present
        expect(@product.category).to be_present
        @product.save 
        expect(@product.errors.full_messages).to eql([])
      end
    end
    
    context 'if the name field is missing' do
      it 'should not save' do
      @category = Category.new
      @product = Product.new(price: 10, quantity: 2, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
      end

    end
    
   
    context 'if the price field is missing' do
      it 'should not save' do
      @category = Category.new
      @product = Product.new(name: "first", quantity: 2, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
      end

    end


    context 'if the quantity field is missing' do
      it 'should not save' do
      @category = Category.new
      @product = Product.new(name: "first", price: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end

    end


    context 'if the category field is missing' do
      it 'should not save' do
      @category = Category.new
      @product = Product.new(name: "first", price: 10, quantity: 2)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
      end

    end
  end



end
