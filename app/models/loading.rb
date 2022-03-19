class Loading < ApplicationRecord
  has_many :loadingmaterials, dependent: :destroy

  has_many :materials, through: :loadingmaterials
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
