require 'spec_helper'

feature "user signs up" do
	
	scenario "when being logged out" do
		lambda {sign_up}.should change(User, :count).by(1)
		expect(page).to have_content("Welcome, nicki@example.com")
		expect(User.first.email).to eq("nicki@example.com")
	end

	scenario "with a password that doesn't match" do 
		lambda {sign_up('a@a.com','pass','wrong')}.should change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, your passwords don't match")
	end

	scenario "with an email that is already registered" do 
		lambda{sign_up}.should change(User, :count).by(1)
		lambda{sign_up}.should change(User, :count).by(0)
	end

	def sign_up(email = "nicki@example.com",
				password = "oranges!",
				password_confirmation = "oranges!")
		visit '/users/new'
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button "Sign up"
	end
end

feature "User signs in" do 

	before(:each) do 
		User.create(email: "test@test.com",
					password: "test",
					password_confirmation: "test")
	end

	scenario "with correct credentials" do 
		visit '/'
		expect(page).to_not have_content("Welcome")
		sign_in("test@test.com","test")
		expect(page).to have_content("Welcome")
	end

	scenario "with incorrect credentials" do 
		visit '/'
		expect(page).not_to have_content("Welcome")
		sign_in("test@test.com","wrong")
		expect(page).not_to have_content("Welcome")
	end

	def sign_in(email,password)
		visit '/sessions/new'
		fill_in :email, :with => email
		fill_in :password, :with => password
		click_button "Sign-in-button"
	end
end

feature "user signs out" do 

	before(:each) do 
		User.create(email: "test@test.com",
					password: "test",
					password_confirmation: "test")
	end

	def sign_in(email,password)
		visit '/sessions/new'
		fill_in :email, :with => email
		fill_in :password, :with => password
		click_button "Sign-in-button"
	end

	scenario "while being signed in" do 
		visit '/'
		sign_in('test@test.com','test')
		click_button "Sign out"
		expect(page).to have_content("Goodbye")
		expect(page).not_to have_content("Welcome")
	end




end