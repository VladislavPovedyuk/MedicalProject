class DoctorsController < ApplicationController
  before_filter :authenticate_doctor!
  before_action :doctor_find_by_id, only: [:edit, :update, :show, :destroy, :calendar ]

  def index
    @doctors = Doctor.sorted_descending.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      flash[:notice] = t('new_doctor_added', doctor: "#{@doctor.name}")
      redirect_to doctors_path
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      flash[:notice] = t('doctor_edited', doctor: "#{@doctor.name}")
        redirect_to edit_doctor_path
    else
      flash[:notice] = t('doctor_edit_fail')
        render action: 'edit'
    end
  end

  def show
  end

  def calendar
    @meetings = Meeting.where(:doctor_id => params[:id])
  end

  def destroy
    if @doctor.destroy
      flash[:notice] = t('doctor_deleted', doctor: "#{@doctor.name}")
    else
      flash[:notice] = t('doctor_delete_fail', doctor: "#{@doctor.name}")
    end
    redirect_to doctors_path
  end

  private
    def doctor_params
      params[:doctor].permit(:name, :email, :password, :password_confirmation)
    end

    def doctor_find_by_id
      @doctor = Doctor.find(params[:id])
    end
end
