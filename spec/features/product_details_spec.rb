require 'rails_helper'

RSpec.feature "User clicks on a product", type: :feature, js: true do
  
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

  scenario "They land on the product detail page" do
    # ACT
    visit root_path
    #loading the original page to run test from
    find(".product-link", match: :first).click
    #locating product-link class, first match of, then clicking on it

    sleep 5
    #this command is for visual screenshot matching ONLY - sleep syntax is not necessary for this test and could be removed as expect will wait until page is properly loaded regardless. Remember, the image being loaded vs the container is a separate call.
   
  
    # DEBUG / VERIFY
    expect(page).to have_css '.main-img'
    #if image is loaded - continue
    save_screenshot
    expect(page).to have_css 'article.product-detail', count: 1
  end



end
