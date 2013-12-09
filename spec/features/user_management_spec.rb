require 'spec_helper'

feature "user signs up" do
	
	scenario "when being logged out" do
		lambda {sign_up}.should change(User, :count).by(1)
		expect(page).to have_content("Welcome, nicki@example.com")
		expect(User.first.email).to eq("nicki@example.com")
	end

	def sign_up(email = "nicki@example.com",
				password = "oranges!")
		visit '/users/new'
		fill_in :email, :with => email
		fill_in :password, :with => password
		click_button "Sign up"
	end

end