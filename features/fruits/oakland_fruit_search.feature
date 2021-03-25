Feature: Oakland Fruit Search

  Scenario: verify the user can search for the fruits
    Given user is on fruits search page
    When user search for the fruits Rose
    Then user should see the results related to Rose
    And verify the search results count is not more than 10

  Scenario Outline: verify the user can search for the different fruits
    Given user is on fruits search page
    When user search for the fruits <fruits_name>
    Then user should see the results related to <fruits_name>
    And verify the search results count is not more than <no_of_results>
    And verify the header details of the fruits
    Examples:
      | fruits_name | no_of_results |
      | Rose       | 10            |
      | Sunflower  | 10            |

  Scenario Outline: verify the user can search for the different fruits with details
    Given user is on fruits search page
    When user search for the fruits <fruits_name>
    Then user should see the results related to <fruits_name>
    And verify the search results count is not more than <no_of_results>
    And verify the header details of the fruits
      | fruits_details |
      | fruits Type    |
      | fruits Height  |
      | Flower Height |
      | Spread        |
      | Sunlight      |
    Examples:
      | fruits_name | no_of_results |
      | Rose       | 10            |
      | Sunflower  | 10            |

  Scenario: verify user can add the fruitss to wish list
    Given user is on fruits search page
    When user search for the fruits Rose
    And user add the first result to the wish list
    Then verify the added fruits is showing under wish list page
    #Then verify the Chater's Double Rose Pink Hollyhock fruits is showing under wish list page

#  Scenario: verify user can add the fruitss to wish list
#    Given user is on fruits search page
#    When user search for the fruits Rose
#    And user add the first result to the wish list
#    Then verify the Rose fruits is showing under wish list page

  Scenario: verify user can modify the item quantity in the wish list
    Given user is on fruits search page
    When user search for the fruits Rose
    And user add the first result to the wish list
    And user modified the quantity of the wish list item
    Then verify user can see the updated quantity

#Imperative style
  Scenario: verify user can modify the item quantity in the wish list imperative style
    Given user is on fruits search page
    Then  user can modify the quantity in the wishlist

  Scenario: verify the user can empty the wish list
    Given user is on fruits search page
    When user adds the fruits Rose to the wish list
    And user empty the wish list
    Then user should see the confirmation message "Your Wish List is currently empty!"

#  Scenario: verify the search results on a page should not be more than 10
#    Given user is on fruits search page
#    When user search for the fruits Rose
#    Then user should see the results related to Rose
#    And verify the search results is not more than 10

  Scenario: verify the fruits search details - fruits Type, fruits Height, Flower Height, Spreed and sunlight
    Given user is on fruits search page
    When user search for the fruits Rose
    Then user should see the results related to Rose
    And get the details of the fruits

  Scenario: verify the fruits search details - fruits Type, fruits Height, Flower Height, Spreed and sunlight are correct
    Given user is on fruits search page
    When user search for the fruits Rose
    Then user should see the results related to Rose
    And verify the details of the fruits
      | fruits_details | fruits_value |
      | fruits Type    | perennial   |
      | fruits Height  | 4 feet      |
      | Flower Height | 6 feet      |
      | Spread        | 24 inches   |
      | Sunlight      | full sun    |



