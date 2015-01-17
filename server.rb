require 'data_mapper'
require 'sinatra/base'
require 'rack-flash'
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
	DataMapper.auto_migrate!

	use Rack::Flash
	use Rack::MethodOverride

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
			@user = User.new
			erb :"users/new"
		end

		post '/users' do
			@user = User.create(:email => params[:email],
													:password => params[:password],
													:password_confirmation => params[:password_confirmation])
			if @user.save 
				session[:user_id] = @user.id
				redirect to '/'
			else 
				flash.now[:errors] = @user.errors.full_messages
				erb :"users/new"
			end
		end

		get '/sessions/new' do
			erb :"sessions/new"
		end

		post '/sessions' do
		  email, password = params[:email], params[:password]
		  user = User.authenticate(email, password)
		  if user
		    session[:user_id] = user.id
		    redirect to('/')
		  else
		    flash[:errors] = ["The email or password is incorrect"]
		    erb :"sessions/new"
		  end
		end

		delete '/sessions' do
			flash[:notice] = "Good bye!"
			session[:user_id] = nil
			redirect '/'
		end

		helpers do
			
			def current_user
				@current_user ||=User.get(session[:user_id]) if session[:user_id]
			end

		end

end