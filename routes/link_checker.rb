require 'json'

class BookmarkManager < Sinatra::Application

	get '/link_checker' do
		content_type :json

		link_to_check = params["value"]
		link = Link.first(title: link_to_check)
		link ? name_exists = true : name_exists = false

		return { name_exists: name_exists }.to_json
	end

end