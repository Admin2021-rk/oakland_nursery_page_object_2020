Given(/^user is on plant search page$/) do
  visit OakPlantSearchPage
end

When(/^user search for the plant (.+)$/) do |plant_name|
  #----used the regular expression
  on(OakPlantSearchPage).search_plant plant_name
end

Then(/^user should see the results related to (.+)$/) do |plant_name|
  on(OakPlantSearchPage).verify_plant_search_is_correct plant_name
end

And(/^verify the search results count is not more than (\d+)$/) do |max_result|
  on(OakPlantSearchPage).verify_no_of_plant_search_results max_result
end

And(/^user add the first result to the wish list$/) do
  @first_plant_name = on(OakPlantSearchPage).get_all_plant_names.first
  on(OakPlantSearchPage).add_plant_to_wishlist
end

Then(/^verify the added plant is showing under wish list page$/) do
  on(OakPlantSearchPage).verify_wishlist_has_plant @first_plant_name
end

And(/^user modified the quantity of the wish list item$/) do
  on(OakWishListPage).update_wishlist_quantity 2
end

Then(/^verify user can see the updated quantity$/) do
  on(OakWishListPage).verify_wishlist_quantity_has_updated 2
end

When(/^user adds the plant (.*) to the wish list$/) do |plant_name|
  on(OakPlantSearchPage).search_plant 'Rose'
  @first_plant_name = on(OakPlantSearchPage).get_all_plant_names.first
  on(OakPlantSearchPage).add_plant_to_wishlist
  on(OakPlantSearchPage).verify_wishlist_has_plant @first_plant_name
end

And(/^user empty the wish list$/) do
  on(OakWishListPage).empty_wishlist
end

Then(/^user should see the confirmation message "([^"]*)"$/) do |message|
  on(OakErrorPage).verify_wishlist_empty_message_dispalyed message
end

And(/^get the details of the plant$/) do
  p on(OakPlantSearchPage).get_plant_info
end

And(/^verify the details of the plant$/) do |table|
  # table is a table.hashes.keys # => [:plant_details, :plant_value]
  # wait_until { search_result_element.present? }
  actual_plant_details = on(OakPlantSearchPage).get_plant_info
  expected_plant_details = {}
  table.hashes.each do |plant|
    expected_plant_details[plant['plant_details']] = plant['plant_value']
  end
  p expected_plant_details
  p actual_plant_details
  # fail "#{expected_plant_details} is Not same as #{actual_plant_details}" unless expected_plant_details == actual_plant_details
  expect(expected_plant_details.sort).should eql? actual_plant_details.sort
end

And(/^verify the header details of the plant$/) do |table|
  # table is a table.hashes.keys # => [:plant_details]
  actual_plant_details = on(OakPlantSearchPage).get_plant_info
  expected_plant_details = {}
  table.hashes.each do |plant|
    header_found = false
    actual_plant_details.each_key do |each_header|
      if each_header.include? plant['plant_details']
        header_found = true
        break
      end
    end
    if header_found != true
      fail "The header #{plant['plant_details']} NOT found"

    end
  end
end

# Different ways to reuse the steps

Then(/^user can modify the quantity in the wishlist$/) do
  # visit OakPlantSearchPage
  # on(OakPlantSearchPage) do |page|
  #   page.search_plant 'Rose'
  #   @first_plant_name = page.get_all_plant_names.first
  #   page.add_plant_to_wishlist
  # end
  # on(OakWishListPage) do |page|
  #   page.update_wishlist_quantity 2
  #   page.verify_wishlist_quantity_has_updated 2
  # end
  # plant_name = 'Rose'
  # step 'user is on plant search page'
  # step "user search for the plant #{plant_name}"
  # step 'user add the first result to the wish list'
  # step 'user modified the quantity of the wish list item'
  # step 'verify user can see the updated quantity'

  steps %Q{
  Given user is on plant search page
    When user search for the plant Rose
    And user add the first result to the wish list
    And user modified the quantity of the wish list item
    Then verify user can see the updated quantity

        }
end