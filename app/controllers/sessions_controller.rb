class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or(root_path)
    else
      # error and signin form
      render 'new'
    end
  end

  def destroy
  end
end