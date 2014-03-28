class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(params[:doctor].permit(:name, :email, :password))
    if @doctor.save
      flash[:notice] = "Добавлен новый доктор #{@doctor.name}"
        redirect_to doctors_path
    else
      flash[:notice] = 'Во время добавления врача произошла ошибка'
        render 'new'
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(params[:doctor].permit(:name, :email, :password))
      flash[:notice] = "Успешное редактирование данных доктора #{@doctor.name}"
        redirect_to edit_doctor_path
    else
      flash[:notice] = 'Во время редактирования врача произошла ошибка'
        render 'edit'
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    flash[:notice] = "Доктор #{@doctor.name} успешно удален"
      redirect_to doctors_path
  end
end
