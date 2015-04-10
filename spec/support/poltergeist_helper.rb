Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    extensions: [File.expand_path("./phantomjs_ext/geolocation.js", __dir__)]
  )
end
Capybara.default_driver = :poltergeist
