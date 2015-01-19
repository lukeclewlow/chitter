module SessionHelpers

	def add_peep(text)
		within('#new-peep') do
			fill_in 'peep', :with => text
			click_button 'Add Peep'
		end
	end

	def sign_up(username = "bob",
							email = "bob@bob.com",
							password = "12345",
							password_confirmation = "12345")
	visit '/users/new'
	expect(page.status_code).to eq(200)
	fill_in :username,							:with => username
	fill_in :email, 								:with => email
	fill_in :password, 							:with => password
	fill_in :password_confirmation, :with => password_confirmation
	click_button "Sign Up"
	end

	 def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end


end