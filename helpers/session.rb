module SessionHelpers

	def add_peep(text)
		within('#new-peep') do
			fill_in 'peep', :with => text
			click_button 'Add Peep'
		end
	end

	def sign_up(email = "bob@bob.com",
							password = "12345")
	visit '/users/new'
	expect(page.status_code).to eq(200)
	fill_in :email, :with => email
	fill_in :password, :with => password
	click_button "Sign Up"
	end

end