class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :Full_Name
      t.integer :Age
      t.string :Sex
      t.string :Address
      t.string :PPS
      t.string :Medical_Card
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
