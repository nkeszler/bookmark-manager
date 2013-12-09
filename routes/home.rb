class BookmarkManager < Sinatra::Application

	get '/' do 
		@links = Link.all
		erb :home
	end
	
end