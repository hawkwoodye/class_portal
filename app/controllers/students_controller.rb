class StudentsController < ApplicationController
  def index
    session[:my_role] = "student"
    @role = session[:my_role]
  end

  def show
    student_id = params[:id]
    @student = Student.find(student_id)
  end

  def login
    @student = Student.where(email: params[:student][:email]).first
#    binding.pry
#    puts @student.email
    if @student.nil?
	flash[:notice] = 'Wrong email or password!'
	#redirect_to action: :profile, id: @student.id
	redirect_to action: :index
    else
	redirect_to action: :show, id: @student.id
    end
  end


  def profile
    student_id = params[:id]
    @student = Student.find(student_id)
  end

  def new 
    @student = Student.new
    #redirect_to action: :signup
  end

end
