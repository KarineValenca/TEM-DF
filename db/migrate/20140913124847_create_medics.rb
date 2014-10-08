class CreateMedics < ActiveRecord::Migration
  def change
    create_table :medics do |t|
      t.string :name
      t.integer :registry
      t.string :speciality
      t.string :department

      t.timestamps
    end
  end
end