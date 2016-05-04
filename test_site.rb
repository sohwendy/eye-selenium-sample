require 'eyes_selenium'

eyes =  Applitools::Eyes.new
eyes.api_key = ENV['APPLITOOLS_KEY']
web_driver = Selenium::WebDriver.for :firefox

begin
  eyes.test(app_name: 'applitools',
            test_name: 'applitools-ruby demo test',
            viewport_size: { width: 1024, height: 698 },
            driver: web_driver) do |driver|
    driver.get 'https://applitools.com'
    eyes.check_window('Page')

    driver.find_element(:link_text, 'Pricing').click
    eyes.check_window('News')
  end
ensure
  web_driver.quit
end
