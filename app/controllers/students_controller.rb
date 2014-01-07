class StudentsController < ApplicationController
  def all 
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find_name(params[:name])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to "/students/#{@student.id}"
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id]) 
    if @student.update(student_params)
      redirect_to 
    else
      render 'edit'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def destroy
    Student.find(params[:id]).delete
    redirect_to :action => 'all'
  end

   private

    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end
end