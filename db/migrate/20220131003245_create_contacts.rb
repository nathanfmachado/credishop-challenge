class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :proponent, foreign_key: true
      t.string :phone
      t.integer :phone_type

      t.timestamps
    end
  end
end
