class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
    	t.belongs_to :doctor
    	t.belongs_to :patient
    	
      t.time :time_start
      t.time :time_end

      t.timestamps
    end
  end
end
