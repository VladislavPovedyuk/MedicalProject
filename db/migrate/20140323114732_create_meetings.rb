class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.belongs_to :doctor
      t.belongs_to :patient

      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
