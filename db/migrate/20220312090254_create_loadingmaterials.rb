class CreateLoadingmaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :loadingmaterials do |t|
      t.references :material, foreign_key: true
      t.references :loading, foreign_key: true

      t.timestamps
    end
  end
end
