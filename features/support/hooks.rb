require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :chrome
end


After do
  @browser.close
end

After do |scenario|
  SCREENSHOTS_DIRECTORY = "html-report"
  if scenario.failed?
    screenshot = "#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(File.join(SCREENSHOTS_DIRECTORY, screenshot))
    embed(File.join(SCREENSHOTS_DIRECTORY, screenshot), "image/png", "SCREENSHOT")
  end
end