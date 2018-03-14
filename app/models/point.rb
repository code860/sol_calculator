class Point < ApplicationRecord
  belongs_to :installation, inverse_of: :points
  validates :installation, presence: true
end
