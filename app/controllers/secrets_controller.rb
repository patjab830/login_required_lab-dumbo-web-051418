class SecretsController < ApplicationController
  def show
    if !session.include? :name
      redirect_to root_path
    end
  end


end
