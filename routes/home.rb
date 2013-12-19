class BookmarkManager < Sinatra::Application

	get '/' do 
		@links = Link.all
		haml :home
	end
	
end