class SessionsController < ApplicationController
  def show
    logged_in? ? nil : (redirect_to login_path)
  end

  def create
    if params[:name].nil? || params[:name].empty?
      redirect_to root_path
    else
      session[:name] = params[:name]
      redirect_to secrets_path
    end
  end

  def destroy
    logged_in? ? (session.delete :name) : nil
    redirect_to root_path
  end

  private
  def logged_in?
    session.include? :name
  end
end
