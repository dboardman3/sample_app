module SessionsHelper
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user     #realize that this is assigning current_user
  end
  
  def sign_out                          # used in destroy....in sessions_controller
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def current_user=(user)               #defines a method current_user=
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?        #user is signed in IF current_user IS NOT nil
  end
  
  private #-----------------------------------------------------------------------------------------
  
  def user_from_remember_token
    User.authenticate_with_salt(*remember_token)        #authentications are defined in models/user.rb
  end
  
  def remember_token
    cookies.signed[:remember_token] || [nil, nil]
  end
end
