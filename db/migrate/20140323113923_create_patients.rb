class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|    
      t.string :name
      t.string :skype
      t.integer :tel
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
