task :add_lat_long => :environment do
  lo = Locator.all
  for location in lo
    addr = Geocoder.search(location.address)
    if addr.nil?
      puts location.address
    else
      location.update_attributes(latitude:addr[0].latitude,longitude:addr[0].longitude)
    end
  end
  puts "Added the latitude and longitude to database"
end
