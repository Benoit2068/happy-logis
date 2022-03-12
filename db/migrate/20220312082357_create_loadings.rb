class CreateLoadings < ActiveRecord::Migration[6.1]
  def change
    create_table :loadings do |t|
      t.string :adress
      t.boolean :done
      t.date :date

      t.timestamps
    end
  end
end
