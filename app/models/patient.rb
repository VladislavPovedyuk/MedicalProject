class Patient < ActiveRecord::Base
	has_many :meetings
	has_many :doctors, :through => :meetings

  validates :name, presence: true, length: { in: 2...15 }
  validates :skype, presence: true, length: { in: 2...15 }

  validates :tel, format: { with: /\A[+-0-9]{5;}\z/,
                            message: 'Only allows numbers and +,-. Minimum length for tel - 5 characters '}
  validates :age, numericality: { only_integer: true }
  validates :gender, inclusion: { in: %w(m f),
                                  message: "%{value} is not a valid gender" }

end
