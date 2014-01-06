class StudentsController < ApplicationController
  def all 
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    redirect_to :action => 'all'
  end

   private

    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end
end