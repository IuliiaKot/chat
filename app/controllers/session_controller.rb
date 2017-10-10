class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      cookies.signed[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = ['Invalid']
      render 'new'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
