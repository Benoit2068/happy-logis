class AddQuantityToLoadingmaterials < ActiveRecord::Migration[6.1]
  def change
    add_column :loadingmaterials, :quantity, :integer
  end
end
