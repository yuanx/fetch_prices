module LocatorsHelper
  def get_cord(address)
    result = Geocoder.search(address)
    return [result[0].data["geometry"]["location"]["lat"],result[0].data["geometry"]["location"]["lng"]]
  end
end
