class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if current_user.is_a? Student
      @enrollment = Enrollment.new
    end
    if params[:search]
        @courses = Course.search(params[:search],params[:searchby])
         if !(@courses.is_a? Array)
           @courses.order("course_number ASC")
          else
          @courses.sort!{|a,b| a.course_number <=> b.course_number}
        end
    else
        @courses = Course.all.order('course_number ASC')
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        @enrollment = Enrollment.create(course_id: @course.id, user_id: params[:instructor], status:"Approved")
        flash[:success] = "Course was successfully created!"
        format.html { redirect_to @course}
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        flash[:success] = "Course was successfully updated!"
        format.html { redirect_to @course }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      flash[:success] = "Course was successfully destroyed!"
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_number, :title, :description, :start_date, :end_date, :status, :instructor)
    end
end
