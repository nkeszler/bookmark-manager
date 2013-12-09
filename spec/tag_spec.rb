require 'spec_helper'
#require_relative '../lib/link'

describe Tag do 
	it "should be able to be retrieved from link in db" do
		tags = ["education","ruby"].map {|tag| Tag.first_or_create(text: tag)}
		Link.create(title: "Makers Academy",
					url: "http://www.makersacademy.com/",
					tags: tags)
		link = Link.first
		expect(link.tags.map(&:text)).to include("ruby")
		expect(link.tags.map(&:text)).to include("education")
	end
end