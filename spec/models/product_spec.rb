require 'rails_helper'

RSpec.describe Product, type: :model do
  cat1 = Category.find_or_create_by! name: 'Apparel'

  describe 'Validations' do
    # validation tests/examples here
    it "should save sucessfully" do
    product = cat1.products.create!({
      name:  'Frog',
      description: Faker::Hipster.paragraph(4),
      image: 'apparel1.jpg',
      quantity: 1,
      price: 649.99
      })
      expect(product).to be_valid
    end

    it "should not be valid, missing name" do
    product = cat1.products.create({
      name:  nil,
      description: Faker::Hipster.paragraph(4),
      image: 'apparel1.jpg',
      quantity: 1,
      price: 649.99
      })
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not be valid, missing price" do
    product = cat1.products.create({
      name:  'Frog',
      description: Faker::Hipster.paragraph(4),
      image: 'apparel1.jpg',
      quantity: 1,
      price: nil
      })
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "should not be valid, missing quantity" do
    product = cat1.products.create({
      name:  'Frog',
      description: Faker::Hipster.paragraph(4),
      image: '',
      quantity: nil,
      price: 649.99
      })
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not be valid, missing category" do
      product = Product.create({
        name:  'Frog',
        description: Faker::Hipster.paragraph(4),
        image: 'apparel1.jpg',
        quantity: 1,
        price: 649.99
        })
        expect(product).to_not be_valid
      end
  end


end
