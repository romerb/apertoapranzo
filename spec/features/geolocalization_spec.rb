require 'rails_helper'

RSpec.feature "Geolocalization" do
  scenario "Happy path" do
    visit root_path

    within '.location' do
      expect(page).to have_content("41.881539800000006", wait: 5)
      expect(page).to have_content("12.501875199999999", wait: 5)
    end
  end
end
