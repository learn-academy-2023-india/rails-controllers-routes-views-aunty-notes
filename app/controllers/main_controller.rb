class MainController < ApplicationController
  def greeting
    @user_name = params[:user_name]
  end
  def square
    @number = params[:number].to_i * params[:number].to_i 
  end
end
