class Loading < ApplicationRecord
  has_many :loadingmaterials, dependent: :destroy
  has_many :materials, through: :loadingmaterials

  belongs_to :delivery

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  after_update :update_delivery_finished

  private

  def update_delivery_finished
    delivery = self.delivery
    loading_done = delivery.loadings.map do |loading|
      loading.done
    end
    delivery.finished = loading_done.reduce(:&)
    delivery.save
  end

end
