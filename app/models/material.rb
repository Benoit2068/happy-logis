class Material < ApplicationRecord
  has_many :loadingmaterials, dependent: :destroy
end
