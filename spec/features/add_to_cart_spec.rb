require "rails_helper"
#To test for the Cart being updated, you should keep it simple and check the text rendered in the top nav (by the _top_nav.html.erb partial) changes from "My Cart (0)" to to "My Cart (1)".
RSpec.feature "AddToCarts", type: :feature do
  before :each do
    @category = Category.create! name: "Apparel"

    1.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario "add item to cart" do
    visit root_path
    #click_on "btn btn-default pull-right"
    find_button("Add").click
    # commented out b/c it's for debugging only

    #save_and_open_screenshot

    expect(page.find_link("My Cart (1)"))
  end
end
