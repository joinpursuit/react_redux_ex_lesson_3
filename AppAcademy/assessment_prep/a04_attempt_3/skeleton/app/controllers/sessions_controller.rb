class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
      return
    else
      log_in_user!(user)
      redirect_to links_url
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end
end
