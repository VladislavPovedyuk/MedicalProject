class Meeting < ActiveRecord::Base



	belongs_to :doctor
	belongs_to :patient


  validates :doctor_id, numericality: { only_integer: true }
  validates :patient_id, numericality: { only_integer: true }


end
