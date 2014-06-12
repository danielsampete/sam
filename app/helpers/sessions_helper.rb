module SessionsHelper
  
  def sign_in(user)
  cookies.delete(:remember_token)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
   if signed_in?
      flash[:success] = (User.find_by_remember_token(cookies[:remember_token]))[:name]
    else
      flash[:success] = "error"
    end
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
end