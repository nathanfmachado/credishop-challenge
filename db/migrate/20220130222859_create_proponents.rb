class CreateProponents < ActiveRecord::Migration[5.2]
  def change
    create_table :proponents do |t|
      t.string :name
      t.string :cpf
      t.date :birth_date
      t.float :salary
      t.float :inss_discount

      t.timestamps
    end
  end
end
