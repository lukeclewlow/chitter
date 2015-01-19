require 'spec_helper'
require_relative '../helpers/session'

include SessionHelpers


feature "user adds a new peep" do

		before(:each) do
    User.create(:username => "test",
    						:email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  								end				

	scenario "when browsing the homepage do" do
		sign_in("test@test.com", "test")
		expect(Peeps.count).to eq(0)
		visit '/'
		add_peep("blah blah blah blah blah")
		expect(Peeps.count).to eq(1)
		peep = Peeps.first
		expect(peep.text).to eq("blah blah blah blah blah")
	end

end