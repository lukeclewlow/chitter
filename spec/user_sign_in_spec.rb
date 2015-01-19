require 'spec_helper'
require_relative '../helpers/session'

include SessionHelpers

feature "User signs in" do
		
		before(:each) do
    User.create(:username => "test",
                :email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  								end

	scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, test")
    sign_in('test@test.com', 'test')
    expect(page).to have_content("Welcome, test")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, test")
    sign_in('test@test.com', 'wrong')
    expect(page).not_to have_content("Welcome, test")
  end

end