class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new(params[:doctor].permit(:name, :encrypted_password, :email))
  end

  def create
    @doctor = Doctor.new(params[:doctor].permit(:name, :encrypted_password, :email))
    if @doctor.save
      redirect_to new_doctor_path
    else
      render 'new'
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(params[:doctor].permit(:name, :encrypted_password, :email))
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    redirect_to doctors_destroy_path
  end
end
