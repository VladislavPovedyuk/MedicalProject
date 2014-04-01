class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  :password_confirmation
  devise :database_authenticatable, :validatable

	has_many :meetings
	has_many :patients, :through => :meetings

  validates :name, presence: true, length: { in: 2...15 }
  #validates :login, format: { with: /\A[a-z0-9_]+\z/,
  #        message: "%{value} Only allows letters, numbers. Minimum length for login - 4 characters "}
  validates :email, format: { with: /\A([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}\z/,
                              message: 'Bad E-mail '}
  validates :password ,
  #         confirmation: true
  #validates :password_confirmation,
            format: { with: /\A[a-zA-Z0-9_]+\z/,
            message: 'Only allows letters, numbers. Minimum length for password - 8 characters '}

end
