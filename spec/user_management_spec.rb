require 'spec_helper'
require_relative '../helpers/session'

include SessionHelpers

feature "User signs up" do

	scenario "when being a new user visiting the site" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, bob@bob.com")
		expect(User.first.email).to eq("bob@bob.com")
	end

	scenario "with a password that doesn't match" do
		expect{ sign_up('hi@hi.com', 'password', 'wrong_password')}.to change(User, :count).by(0)
	end
	
end