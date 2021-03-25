class OakWishListPage < OakPlantSearchPage
  include PageObject

  text_field(:quantity, id: 'QtymP1')
  link(:update_wish_list,text: 'Update My Wish List')

  def update_wishlist_quantity new_quantity
    self.quantity = new_quantity
    #@browser.text_field(id: 'QtymP1').set new_quantity
  end

  def verify_wishlist_quantity_has_updated exp_quantity
    new_quantity = quantity_element.value
    fail "#{exp_quantity} is Not same as #{new_quantity.to_i}" unless exp_quantity.eql? new_quantity.to_i
  end

  def empty_wishlist
    choose_first_result_element.click if choose_first_result_element.checked?
    update_wish_list_element.click
    sleep 2
  end



end