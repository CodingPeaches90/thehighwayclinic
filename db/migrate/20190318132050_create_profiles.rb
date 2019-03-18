class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :pps_number
      t.integer :dental_license
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
