require 'rails_helper'

RSpec.feature "Geolocation" do
  scenario "Happy path", :geolocation do
    visit root_path

    within '.location' do
      expect(page).to have_content("41.881539800000006")
      expect(page).to have_content("12.501875199999999")
	  end
  end
end
