class Loading < ApplicationRecord
  has_many :loadingmaterials, dependent: :destroy

  has_many :materials, through: :loadingmaterials
end
