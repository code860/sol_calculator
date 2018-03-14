class PropertySerializer < ActiveModel::Serializer
  attributes :id, :full_address, :latitude, :longitude
end
