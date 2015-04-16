Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, extensions: [])
end
Capybara.default_driver = :poltergeist
