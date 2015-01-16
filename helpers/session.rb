module SessionHelpers

	def add_peep(text)
		within('#new-peep') do
			fill_in 'peep', :with => text
			click_button 'Add Peep'
		end
	end

	def sign_up(email = "bob@bob.com",
							password = "12345",
							password_confirmation = "12345")
	visit '/users/new'
	expect(page.status_code).to eq(200)
	fill_in :email, 								:with => email
	fill_in :password, 							:with => password
	fill_in :password_confirmation, :with => password_confirmation
	click_button "Sign Up"
	end

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end

end