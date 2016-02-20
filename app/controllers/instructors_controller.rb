class InstructorsController < ApplicationController
  def index
    session[:my_role] = "instructor"
    @role = session[:my_role]
  end

  def show
  end
end
