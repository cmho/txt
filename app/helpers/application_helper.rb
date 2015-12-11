module ApplicationHelper
  def current_user
  	if session[:user].present?
  		@user = User.find(session[:user])
  	else
  		nil
  	end
  end

  def is_logged_in?
  	if session[:user].present?
  		true
  	else
  		false
  	end
  end
end
