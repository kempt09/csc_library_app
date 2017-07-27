class StudentsController < ApplicationController
  before_action :validate_user, :is_staff?
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /students
  def index
    @students = Student.all.paginate(page: page, per_page: per_page)

    render json: @students, include: ['user']
  end

  # GET /students/1
  def show
    render json: @student, include: ['user']
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:data).permit({attributes: [:class, :major, :minor, :user_id_id, :created_at, :updated_at]})
    end
end
