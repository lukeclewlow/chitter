require 'data_mapper'
require 'sinatra/base'
require './lib/peeps.rb'
require './lib/user.rb'
require_relative './helpers/session'

class Chitter < Sinatra::Base

	# MIGHT NEED SOME OF THESE ONCE START FIDDLING WITH FILE STRUCTURE

	# set :views, Proc.new { File.join(root, '..',"views") }
	# set :public_dir, Proc.new{File.join(root, '..', "public")}
  # set :public_folder, '/public'

 env = ENV['RACK_ENV'] || 'development'

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
	DataMapper::Logger.new($stdout, :debug)
	DataMapper.finalize
	DataMapper.auto_upgrade!

	enable :sessions
	set :session_secret, 'super secret'


		get '/' do
			@peeps = Peeps.all
			erb :index
		end

		post '/peeps' do
			peep = params["peep"]
			Peeps.create(:text => peep)
			redirect to '/'
		end

		get '/users/new' do
			erb :"users/new"
		end

		post '/users' do
			user = User.create(:email => params[:email],
													:password => params[:password],
													:password_confirmation => params[:password_confirmation])
			session[:user_id] = user.id
			redirect to '/'
		end

	helpers do

		def current_user
			@current_user ||=User.get(session[:user_id]) if session[:user_id]
		end

	end

end