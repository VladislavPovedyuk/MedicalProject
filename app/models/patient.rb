class Patient < ActiveRecord::Base
	has_many :meetings, foreign_key: :patient_id
	has_many :doctors, :through => :meetings

  accepts_nested_attributes_for :doctors

  validates :name, presence: true, length: { in: 2...15 }
  validates :skype, presence: true, length: { in: 2...15 }

  validates :tel, format: { with: /\A[0-9\+]{1}[0-9\-]{3,15}\z/,
                            message: :telephone_bad_format}, length: { in: 5...20 }
  validates :age, numericality: { only_integer: true }, :inclusion => 18..50
  validates :gender, inclusion: { in: %w(М Ж),
                                  message: :not_valid_gender }

end
