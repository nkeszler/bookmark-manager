require 'spec_helper'

describe User do 

	it "should have an email property" do
		expect(User.count).to eq(0)
		User.create(email: "nicki@example.com")
		expect(User.count).to eq(1)
		user = User.first
		expect(user.email).to eq("nicki@example.com")
	end

end