class PropertySearchService
  SEARCH_URL = "https://search.onboard-apis.com/propertyapi/v1.0.0"
  def initialize(params)
    @params = params
    @properties = []
  end

  def call
    get_properties
    return @properties
  end

  private
  def get_properties
    request unless @params.blank?
  end

  def request
    #/property/address endpoint for quering properties by address information
    property_results = [] #initialize the json results hash need when checking
    begin
      conn = Faraday.new(:url => SEARCH_URL)
      response = conn.get 'property/address' do |req|
        req.headers['apikey'] = ENV["ONBOARD_API_KEY"] #make sure you have a .env file at the root of this project with that key
        req.headers["Accept"] = 'application/json'
        req.params = @params.merge({radius: 20, page: 1, pagesize: 100}) #the params passed in should be as followed and the root hash should be query, merged default values in this should ideally be edited by the user.
        ##example query: {
        ##                  address1: "SOME ADDRESS",
        ##                  address2: "CITY, STATE, ZIP"
        ##
        ##}
        ##refer to this link for the documentation https://developer.onboard-apis.com/docs
      end
      json_result = JSON.parse(response.body) #It will break here if the response body comes back as not a JSON object
      property_results =  json_result["property"]
    rescue Exception => e
      puts "==============================================================".red
      puts "An error occured when querying the property search api...".red
      puts "Reason: #{e}".red
      puts "==============================================================".red
    end
    unless property_results.blank?
      parse_and_build_results(property_results)
    end
  end

  def parse_and_build_results(results)
    results.each do |result|
      prop = build(result)
      if prop.present?
        #if the property didn't fail to build add it to the result array
        @properties << prop
      end
    end
  end
  #We are parsing the following the current result hash in the loop
  #### {"identifier": {"obPropId": [value of the property model's id] }}
  #### {"address": {"oneLine": [full address of property stored as the full_address value on the property]}}
  #### {"location": {"latitude": [value of the property model's latitude attribute], "longitude": [value of the property model's longitude attribute]}}
  def build(result)
    #wrapping in begin rescue just in case.
    begin
      Property.new(id: result["identifier"]["obPropId"],
                   full_address: result["address"]["oneLine"],
                   latitude: result["location"]["latitude"],
                   longitude: result["location"]["longitude"])
    rescue
      nil
    end
  end
end
