class MainController < ApplicationController
  def index
    flash[:notice] = "Logged in successully"
    flash[:alert] = "Invalid email or password"
  end