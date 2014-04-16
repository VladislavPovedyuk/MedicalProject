class MeetingsController < ApplicationController
  before_action :meeting_find_by_id, only: [:edit, :update ]

  def edit
    @doctor_name = Doctor.find(@meeting.doctor_id).name
    @patient_name = Patient.find(@meeting.patient_id).name
  end

  def update


    if  @meeting.update(meeting_params)
      flash[:notice] = t('time_set_success')
      redirect_to edit_meeting_path
    else
      flash[:notice] = t('time_set_fail')
      render action: 'edit'
    end
  end

  private
    def meeting_params
      params[:meeting].permit(:doctors_id, :patients_id, :time_start, :time_end)
    end

    def meeting_find_by_id
      @meeting = Meeting.find(params[:id])
    end
end
