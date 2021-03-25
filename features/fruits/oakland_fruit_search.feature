Feature: Oakland Plant Search

  Scenario: verify the user can search for the plant
    Given user is on plant search page
    When user search for the plant Rose
    Then user should see the results related to Rose
    And verify the search results count is not more than 10

  Scenario Outline: verify the user can search for the different plant
    Given user is on plant search page
    When user search for the plant <plant_name>
    Then user should see the results related to <plant_name>
    And verify the search results count is not more than <no_of_results>
    And verify the header details of the plant
    Examples:
      | plant_name | no_of_results |
      | Rose       | 10            |
      | Sunflower  | 10            |

  Scenario Outline: verify the user can search for the different plant with details
    Given user is on plant search page
    When user search for the plant <plant_name>
    Then user should see the results related to <plant_name>
    And verify the search results count is not more than <no_of_results>
    And verify the header details of the plant
      | plant_details |
      | Plant Type    |
      | Plant Height  |
      | Flower Height |
      | Spread        |
      | Sunlight      |
    Examples:
      | plant_name | no_of_results |
      | Rose       | 10            |
      | Sunflower  | 10            |

  Scenario: verify user can add the plants to wish list
    Given user is on plant search page
    When user search for the plant Rose
    And user add the first result to the wish list
    Then verify the added plant is showing under wish list page
    #Then verify the Chater's Double Rose Pink Hollyhock plant is showing under wish list page

#  Scenario: verify user can add the plants to wish list
#    Given user is on plant search page
#    When user search for the plant Rose
#    And user add the first result to the wish list
#    Then verify the Rose plant is showing under wish list page

  Scenario: verify user can modify the item quantity in the wish list
    Given user is on plant search page
    When user search for the plant Rose
    And user add the first result to the wish list
    And user modified the quantity of the wish list item
    Then verify user can see the updated quantity

#Imperative style
  Scenario: verify user can modify the item quantity in the wish list imperative style
    Given user is on plant search page
    Then  user can modify the quantity in the wishlist

  Scenario: verify the user can empty the wish list
    Given user is on plant search page
    When user adds the plant Rose to the wish list
    And user empty the wish list
    Then user should see the confirmation message "Your Wish List is currently empty!"

#  Scenario: verify the search results on a page should not be more than 10
#    Given user is on plant search page
#    When user search for the plant Rose
#    Then user should see the results related to Rose
#    And verify the search results is not more than 10

  Scenario: verify the plant search details - Plant Type, Plant Height, Flower Height, Spreed and sunlight
    Given user is on plant search page
    When user search for the plant Rose
    Then user should see the results related to Rose
    And get the details of the plant

  Scenario: verify the plant search details - Plant Type, Plant Height, Flower Height, Spreed and sunlight are correct
    Given user is on plant search page
    When user search for the plant Rose
    Then user should see the results related to Rose
    And verify the details of the plant
      | plant_details | plant_value |
      | Plant Type    | perennial   |
      | Plant Height  | 4 feet      |
      | Flower Height | 6 feet      |
      | Spread        | 24 inches   |
      | Sunlight      | full sun    |



