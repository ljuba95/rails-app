class ApiController < ApplicationController


	def index
		
	end

	def showall
		@users = User.select("id,name,email,created_at,updated_at,admin,activated,activated_at,reset_sent_at").all
		render json: pretty(@users)
	end

	def show
		@user = User.select("id,name,email,created_at,updated_at,admin,activated,activated_at,reset_sent_at").find(params[:id])
		render json: pretty(@user)
	end

	def posts
		@posts = User.find(params[:id]).microposts
		render json: pretty(@posts)
	end

	def followers
		@followers = User.find(params[:id]).followers
		@followers = @followers.map{ |follower| follower.as_json(:only => :id, :methods => :name)}
		render json: pretty(@followers)
	end

	def following
		@followers = User.find(params[:id]).following
		@followers = @followers.map{ |follower| follower.as_json(:only => :id, :methods => :name)}
		render json: pretty(@followers)
	end

	private
		def pretty(string)
			JSON.pretty_generate(JSON.parse(string.to_json))
		end
	
end
