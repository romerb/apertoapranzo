RSpec.configure do |config|
  config.before(:each, type: :feature) do
    page.driver.browser.extensions = [File.expand_path("../phantomjs_ext/disable_geolocation.js", __FILE__)]
  end

  config.before(:each, geolocation: true) do
    page.driver.browser.extensions = [File.expand_path("../phantomjs_ext/geolocation.js", __FILE__)]
  end
end
