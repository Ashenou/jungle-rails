require "rails_helper"

# Write a new feature spec that will test that users can navigate from the home page to the product detail page by clicking on a product.

RSpec.feature "ProductDetails", type: :feature, js: true do

  #pending "add some scenarios (or delete) #{__FILE__}"
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end
  scenario "view product detail page" do
    visit root_path
    #click_on "btn btn-default pull-right"
    #visit product_path(10)
    visit "/products/10"

    # commented out b/c it's for debugging only
    puts page.html
    save_and_open_screenshot
    expect(page).to have_css ".product-detail", count: 1
  end
end
