require 'rails_helper'

RSpec.feature "User can navigate from home page to product detail page by clicking on a product", type: :feature, js: true do
  
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
    click_on 'Details'

    # DEBUG / VERIFY
    save_screenshot
    # expect(page).to have_css 'article.product', count: 10
  end



end
