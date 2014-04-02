class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient].permit(:name, :skype, :tel, :age, :gender))
    if @patient.save
      flash[:notice] = 'Запись прошла успешно. Доктор с вами свяжется. Всего доброго!'
        redirect_to new_patient_path
    else
      render action: 'new'
    end
  end
end
