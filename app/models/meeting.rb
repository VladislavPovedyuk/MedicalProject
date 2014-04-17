class Meeting < ActiveRecord::Base

  belongs_to :doctor
	belongs_to :patient

  validates :doctor_id, numericality: { only_integer: true }
  validates :patient_id, numericality: { only_integer: true }

  validate :time_end_cannot_be_higher_time_start

  def time_end_cannot_be_higher_time_start
    if time_end.present? && time_start.present? && time_end <= time_start
      errors.add(:time_end, :bad_time_start_and_end)
    end
  end

end
