class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

	has_many :meetings
	has_many :patients, :through => :meetings

  validates :name, presence: true, length: { in: 2...15 }
  validates :email, format: { with: Devise.email_regexp,
                              message: 'Bad E-mail '}
  validates :password, confirmation: true
  validates :password_confirmation,
            format: { with: /\A[a-zA-Z0-9_]+\z/,
            message: 'Only allows letters, numbers. Minimum length for password - 8 characters '}

  scope :sorted_descending, order("created_at DESC")

end
