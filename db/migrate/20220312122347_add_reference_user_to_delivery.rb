class AddReferenceUserToDelivery < ActiveRecord::Migration[6.1]
  def change
    add_reference(:deliveries, :user, foreign_key: true)
  end
end
