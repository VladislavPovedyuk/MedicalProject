class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable

	has_many :meetings
	has_many :patients, :through => :meetings

  validates :name, presence: true, length: { in: 2...15 }
  validates :login, format: { with: /\A[a-zA-Z0-9]{4;}\z/,
                              message: 'Only allows letters, numbers. Minimum length for login - 4 characters '}
  validates :password, format: { with: /\A[a-zA-Z0-9]{6;}\z/,
                                 message: 'Only allows letters, numbers. Minimum length for password - 6 characters '}

end
