require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do


  # SETUP for products
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path
    #check cart is zero - expect
    #click the button
    #expect that cart is 1
   click_on("Add", match: :first)
   sleep 5
    # DEBUG / VERIFY
    save_screenshot
  end



  
end
