class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :proponent, foreign_key: true
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.references :state, foreign_key: true
      t.string :cep

      t.timestamps
    end
  end
end
