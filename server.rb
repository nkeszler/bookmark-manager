require 'data_mapper'
require 'sinatra'
require './lib/init'
require './app'
require 'Haml'

helpers do 

	def current_user
		@current_user ||= User.get(session[:user_id]) if session[:user_id]
	end

end