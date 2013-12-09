require "data_mapper"
require 'sinatra'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "sqlite:#{Dir.pwd}/data/bookmark_manager_#{env}")

require './lib/init'
require './app'

DataMapper.finalize
DataMapper.auto_upgrade!

helpers do 

	def current_user
		@current_user ||= User.get(session[:user_id]) if session[:user_id]
	end

end