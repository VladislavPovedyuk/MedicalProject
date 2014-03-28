class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient].permit(:name, :skype, :tel, :age, :gender))
    if @patient.save
      #TODO:Specify a successful creation path
      redirect_to new_patient_path
    else
      render 'new'
    end
  end
end
