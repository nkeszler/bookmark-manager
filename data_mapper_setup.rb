env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "sqlite:#{Dir.pwd}/data/bookmark_manager_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!