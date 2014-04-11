class PatientsController < ApplicationController
  def index
  end

  def new
    @patient = Patient.new
    @doctors = @patient.doctors.build
    @doctors_names_list = Doctor.all
  end

  def create
    @patient = Patient.new(params[:patient].permit(:name, :skype, :tel, :age, :gender))
    @doctor = Doctor.find(params[:doctors][:id])
    if @patient.save
      @meeting = Meeting.new(:doctor_id => @doctor.id, :patient_id => @patient.id)
      if @meeting.save
        flash[:notice] = t('meeting_creation_success')
        redirect_to new_patient_path
      else
        render action: 'new'
      end
    else
      render action: 'new'
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end
end
