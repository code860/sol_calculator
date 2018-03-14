class Property < ActiveModelSerializers::Model #Inherits from this since it is being pulled in from another rest service but we want it to serialize to JSONAPI format
  attributes :id, :full_address, :latitude, :longitude
  #called in the index metod in the properties controller returns a blank array or a list of property objects
  def self.index(params=nil)
    PropertySearchService.new(params).call
  end
end
