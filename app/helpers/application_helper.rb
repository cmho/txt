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

  def current_user_likes_post?(id)
    if is_logged_in?
      @user = User.find(session[:user])
      @liked_posts = @user.likes.collect {|x| x.post_id }
      if @liked_posts.include?(id)
        true
      else
        false
      end
    else
      false
    end
  end
end
