class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user          #defined in sessions_helper.rb
      redirect_to user
    end
  end
  
  def destroy
    sign_out                #defined in sessions_helper.rb
    redirect_to root_path
  end
end
