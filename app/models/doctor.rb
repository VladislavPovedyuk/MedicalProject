class Doctor < ActiveRecord::Base
	has_many :meetings
	has_many :patients, :through => :meetings
	
end
