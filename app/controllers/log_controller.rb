class LogController < ApplicationController
  before_action :set_params, only: [:sign_in, :log]
  def sign_in
    if User.find_by(email: @email).nil?
      @msg  << 'This email is not registered'
      return
    end
    user = User.find_by(email: @email)
    if user.nil? && user.authenticate(@password)
      @msg << 'Incorrect password!'
    else
      session[:current_user_id] = user.id
      redirect_to root_path
    end
  end

  def sign_out
  end

  def log
    if @commit == 'Log In'
      sign_in
    else
      session[:current_user_id] = nil
    end
    root_path
  end

  private

  def set_params
    @email = params[:email]
    @password = params[:password]
    @commit = params[:commit]
    @msg= []
  end
end
