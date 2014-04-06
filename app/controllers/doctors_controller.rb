class DoctorsController < ApplicationController
  #before_filter :authenticate_doctor!

  def index
    @doctors = Doctor.sorted_descending.all
  end

  def new
    @doctor = Doctor.new
  end
  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      flash[:notice] = "Добавлен новый доктор #{@doctor.name}"
        redirect_to doctors_path
    else
      render action: 'new'
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      flash[:notice] = "Успешное редактирование данных доктора #{@doctor.name}"
        redirect_to edit_doctor_path
    else
      flash[:notice] = 'Во время редактирования врача произошла ошибка'
        render action: 'edit'
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

  private
    def doctor_params
      params[:doctor].permit(:name, :email, :password, :password_confirmation)
    end
end
