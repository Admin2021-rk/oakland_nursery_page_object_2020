class OakPlantSearchPage
  include PageObject

  page_url 'https://plants.oaklandnursery.com/12130001'
  page_url $app_url

  text_field(:search_plant_edit_box, id: 'NetPS-KeywordInput')
  button(:submit, id: 'NetPSSubmit')
  links(:plant_names, class: '/NetPS-ResultsP(2|)Link$/')
  checkbox(:choose_first_result, id: 'CheckmP1')
  link(:select_wish_list, text: 'View My Wish List')
  div(:wish_list_header, id: 'NetPS-mPTitle')
  div(:plant_details,class: 'NetPS-ResultsDataSub')

  def search_plant plant_name
    #@browser.text_field(id: 'NetPS-KeywordInput').set plant_name    #----thisi a for watir
    #self.search_plant_edit_box = plant_name                    #---this is for pageobject this will do same as above step
    #@browser.button(id: 'NetPSSubmit').click
    search_plant_edit_box_element.set plant_name #---this is for pageobject
    submit_element.click
  end

  def get_all_plant_names
    # all_results = []
    # plant_names_elements.each do |each_result|
    #   all_results << each_result.text
    # end
    # all_results
    plant_names_elements.map(&:text) #----we use this method instead of above all the lines
  end

  def verify_plant_search_is_correct plant_name
    get_all_plant_names.each do |each_name|
      #p "verify the plant - #{each_name} has correct value - #{plant_name}"
      fail "plant Name #{each_name} is not related to #{plant_name}" unless each_name.include? plant_name
    end
  end

  def verify_no_of_plant_search_results max_result
    fail "No of results are more than 10" unless plant_names_elements.count <= max_result
  end



def add_plant_to_wishlist
  #@browser.checkbox(id: 'CheckmP1').set
  unless choose_first_result_element.checked?
  choose_first_result_element.when_present(60).set
  end
  select_wish_list_element.click
  fail "You are not on the wish list page" unless wish_list_header_element.text.eql? "My Wish List"
end

def verify_wishlist_has_plant first_plant_name_from_search_page
  first_plant_name_from_wishlist_page = get_all_plant_names.first
  fail "wishlist doesnt has the correct plant" unless first_plant_name_from_search_page == first_plant_name_from_wishlist_page
end

  def get_plant_info
    #@browser.div(class: 'NetPS-ResultsDataSub').count  #----to check the count
    #@browser.div(class: 'NetPS-ResultsDataSub').text.split("\n")    #---split is to divide the text
    plant_info_hash = {}
    plant_details_element.text.split("\n").each do |plant_detail_info|
      #plant_deatil_info.split(": ")[0]
      plant_info_hash[plant_detail_info.split(": ")[0]] = plant_detail_info.split(": ")[1].strip
    end
    plant_info_hash
  end
end