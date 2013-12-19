class BookmarkManager < Sinatra::Application

	get '/' do 
		@links = Link.all
		haml :home, layout: !request.xhr?
	end
	
end