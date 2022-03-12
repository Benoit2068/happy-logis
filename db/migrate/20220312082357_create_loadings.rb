class CreateLoadings < ActiveRecord::Migration[6.1]
  def change
    create_table :loadings do |t|
      t.string :name
      t.string :address
      t.boolean :done
      t.date :date
      t.references :delivery, foreign_key: true

      t.timestamps
    end
  end
end
