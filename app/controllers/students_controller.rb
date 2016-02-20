class StudentsController < ApplicationController
  def index
    session[:my_role] = "student"
    @role = session[:my_role]
  end

  def show
  end
end
