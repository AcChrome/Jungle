require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
  
  scenario "They see product details" do
    # ACT
    visit root_path

    # Click into html for product
    first('h4').click

    # VERIFY
    expect(page).to have_css '.product-detail'
    
    # DEBUG
    save_screenshot
  end
end
