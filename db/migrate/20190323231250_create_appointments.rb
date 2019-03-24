class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.text :notes
      t.datetime :date
      t.references :user, foreign_key: true
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
