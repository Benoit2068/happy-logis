class Delivery < ApplicationRecord
  belongs_to :user
  has_many :loadings, dependent: :destroy

  validates :startdate, presence: true
  validates :capacity, presence: true
  validates :finished, acceptance: false
end
