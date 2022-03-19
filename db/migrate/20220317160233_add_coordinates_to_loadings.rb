class AddCoordinatesToLoadings < ActiveRecord::Migration[6.1]
  def change
    add_column :loadings, :latitude, :float
    add_column :loadings, :longitude, :float
  end
end
