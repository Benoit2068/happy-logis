class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.integer :capacity
      t.boolean :finished
      t.date :startdate

      t.timestamps
    end
  end
end
