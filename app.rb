require 'sinatra'

class BookmarkManager < Sinatra::Application
	enable :sessions
end

require_relative './server'
require_relative 'routes/init'
require_relative 'lib/init'
require_relative 'spec/spec_helper'