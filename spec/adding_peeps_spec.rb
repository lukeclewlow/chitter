require 'spec_helper'
require_relative '../helpers/session'

include SessionHelpers

feature "user adds a new peep" do
	scenario "when browsing the homepage do" do
		expect(Peeps.count).to eq(0)
		visit '/'
		add_peep("blah blah blah blah blah")
		expect(Peeps.count).to eq(1)
		peep = Peeps.first
		expect(peep.text).to eq("blah blah blah blah blah")
	end


end