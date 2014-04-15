class PatientsController < ApplicationController
  before_action :authenticate_doctor!, only: [:show]

  def index
  end

  def new
    @patient = Patient.new
    @doctors = @patient.doctors.build
    @doctors_names_list = Doctor.all
  end

  def create

    @patient = Patient.new(patient_params)
    @doctors_names_list = Doctor.all

    if @patient.valid? && params[:doctors][:id] != ''
      @patient.save

      @meeting = Meeting.new(:doctor_id => params[:doctors][:id], :patient_id => @patient.id)
      if @meeting.save
        flash[:notice] = t('meeting_creation_success')
        redirect_to new_patient_path
      else
        render action: 'new'
      end
    elsif (@patient.valid? && params[:doctors][:id] == '')
      flash[:alert] = t('doctor_blank')
      render action: 'new'
    else
      render action: 'new'
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  private
    def patient_params
      params[:patient].permit(:name, :skype, :tel, :age, :gender, :doctors_id)
    end
end
