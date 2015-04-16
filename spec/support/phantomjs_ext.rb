RSpec.configure do |config|
  
  config.before(:each) do
    page.driver.browser.extensions = [File.expand_path("../phantomjs_ext/geolocation.js", __FILE__)]
  end
end
