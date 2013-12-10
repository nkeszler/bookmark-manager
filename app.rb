require 'sinatra'
require 'rack-flash'

class BookmarkManager < Sinatra::Application
	enable :sessions
	set :session_secret, 'super_secret'
	use Rack::Flash 
end

require_relative './server'
require_relative 'routes/init'
require_relative 'lib/init'
require_relative './data_mapper_setup'
