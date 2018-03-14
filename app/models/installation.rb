class Installation < ApplicationRecord
  #Parent object of the points, after the user selects a property they can click a start a new configuration button upon giving it a name they will be prompted to draw mulitple points.  Once they draw a valid object the points will be mapped to this object as children and can be looked up later.
  has_many :points, inverse_of: :installation, dependent: :destroy
end
