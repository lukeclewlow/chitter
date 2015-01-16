module SessionHelpers

	def add_peep(text)
		within('#new-peep') do
			fill_in 'peep', :with => text
			click_button 'Add Peep'
		end
	end

end