class BusOperatorCalification < ApplicationRecord
  belongs_to :bus_operator

  validates :rating, presence: true
end
