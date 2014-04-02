class Patient < ActiveRecord::Base
	has_many :meetings
	has_many :doctors, :through => :meetings

  validates :name, presence: true, length: { in: 2...15 }
  validates :skype, presence: true, length: { in: 2...15 }

  validates :tel, format: { with: /\A[0-9\+]{1}[0-9\-]{3,15}\z/,
                            message: 'Only allows numbers and +,-. Minimum length for tel - 5 characters '}, length: { in: 5...20 }
  validates :age, numericality: { only_integer: true }
  validates :gender, inclusion: { in: %w(М Ж),
                                  message: "%{value} is not a valid gender" }

end
