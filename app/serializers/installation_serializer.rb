class InstallationSerializer < ActiveModel::Serializer
  attributes :id, :configuration_name, :tilt_angle, :orientation_angle
  has_many :points
end
