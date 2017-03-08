class Restaurant < ApplicationRecord
  has_many  :reviews, dependent: :destroy
  # Validations
  validates :stars, inclusion: { in: [1,2,3], allow_nil: false }
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
