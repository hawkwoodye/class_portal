class AdminsController < ApplicationController
  def index
    session[:my_role] = "admin"
    @role = session[:my_role]
  end

  def show
  end

  def resource
  end
end
