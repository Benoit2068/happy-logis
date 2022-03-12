class AddReferenceDeliveryIdToLoading < ActiveRecord::Migration[6.1]
  def change
    add_reference(:loadings, :delivery, foreign_key: true)
  end
end
