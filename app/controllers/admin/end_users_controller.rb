class Admin::EndUsersController < ApplicationController
	def index
	@end_users = EndUser.all
	 @end_user = EndUser.new
	end

	def show
	end

	def edit
	end

	def update
	end
end
