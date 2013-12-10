class BookmarkManager < Sinatra::Application

	get '/sessions/new' do 
		erb :"/sessions/new"
	end

	post '/sessions' do 
		email, password = params[:email], params[:password]
		user = User.authenticate(email,password)
		if user
			session[:user_id] = user.id
			redirect to('/')
		else
			flash[:errors] = ["Email or Password incorrect"]
			erb :"/sessions/new"
		end
	end

	delete '/sessions' do 
		session[:user_id] = nil
		flash[:notice] = "Goodbye"
		redirect to('/')
	end

end