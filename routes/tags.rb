class BookmarkManager < Sinatra::Application

	get '/tags/:text' do 
		tag = Tag.first(text: params[:text])
		@links = tag ? tag.links : []
		erb :home
	end

end