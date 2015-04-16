require 'rails_helper'

RSpec.feature "Geolocalization" do
  scenario "Happy path", js: true do
    visit root_path
    
    #page.document.synchronize do
      within '.location' do
        expect(page).to have_content("41.881539800000006")
        expect(page).to have_content("12.501875199999999")
	 end
    #end
  end
end
