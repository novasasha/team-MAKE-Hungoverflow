helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !!current_user
    # session[:user_id] != null
  end

  def ensure_login
    if logged_in?
      return true
    else
      halt(404, "<h2>Access denied to you!!</h2>")
    end
  end
end
