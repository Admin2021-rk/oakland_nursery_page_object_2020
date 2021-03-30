require 'rspec'
require 'page-object'
require 'data_magic'

World(PageObject::PageFactory)

# Different environments
# oakland_test = 'www.oaklandtest.com'
# oakland_int = 'www.oaklandint.com'   #---integration Environments
# oakland_qa = 'www.oaklandqa.com'

#$env = ENV['environment']
if ENV['environment'] .nil?
  env = 'qa'
end

app_url = "https://plants.oaklandnursery#{env}.com/12130001"
$app_url = "https://plants.oaklandnursery.com/12130001"
