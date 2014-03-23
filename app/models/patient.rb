class Patient < ActiveRecord::Base
	has_many :meetings
	has_many :doctors, :through => :meetings
end
