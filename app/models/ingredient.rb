class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum:160}
  validates :expiry, presence: true
  validates :number, presence: true
end
