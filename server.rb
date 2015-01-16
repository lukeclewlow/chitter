require 'data_mapper'
require 'sinatra/base'

class Chitter < Sinatra::Base

	# MIGHT NEED SOME OF THESE ONCE START FIDDLING WITH FILE STRUCTURE

	# set :views, Proc.new { File.join(root, '..',"views") }
	# set :public_dir, Proc.new{File.join(root, '..', "public")}
  # set :public_folder, '/public'

 env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/peeps.rb'

DataMapper.finalize
DataMapper.auto_upgrade!

	get '/' do
		@peeps = Peeps.all
		erb :index
	end

	post '/peeps' do
		peep = params["peep"]
		Peeps.create(:text => peep)
		redirect to '/'
	end




end