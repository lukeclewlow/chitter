require 'spec_helper'

feature "User browses all peeps" do
	
	before(:each) {
		Peeps.create(:text => "blah blah blah blah blah")
	}

	scenario "when opening the home page" do
		visit '/'
		expect(page).to have_content("blah blah blah blah blah"	)
	end

end
