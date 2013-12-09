require "data_mapper"
require 'sinatra'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "sqlite:#{Dir.pwd}/data/bookmark_manager_#{env}")

require './lib/link'
require './lib/tag'
require './app'

DataMapper.finalize
DataMapper.auto_upgrade!