class Loading < ApplicationRecord
  has_many :loadingmaterials

  has many :materials, through: :loadingmaterials
end
