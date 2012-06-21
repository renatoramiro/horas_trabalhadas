class ApplicationController < ActionController::Base
	before_filter :login_required
	before_filter :setup_current_user
  protect_from_forgery

private

	def setup_current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
		true
	end

	def authorized?
		session[:user_id] || controller_name == "sessions"
	end

	def login_required
		authorized? || access_denied
	end

	def access_denied
		respond_to do |format|
			format.html do
				session[:return_to] = url_for(:only_path => false)
				redirect_to new_session_path
			end
		end
	end
end
