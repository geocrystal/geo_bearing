module Geo
  module Bearing
    VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

    # The formula used for calculating the initial bearing between two points on the Earth's surfaceis
    # is derived from the broader concepts of great-circle distance and navigation on a spherical Earth model.
    # https://en.wikipedia.org/wiki/Great-circle_distance
    #
    # https://github.com/Turfjs/turf/blob/master/packages/turf-bearing/index.ts
    def self.bearing(from_lat : Number, from_lng : Number, to_lat : Number, to_lng : Number, final = false) : Float64
      if final
        # Calculate the bearing from the destination point back to the original point
        reverse_bearing = calculate_bearing(to_lat, to_lng, from_lat, from_lng)

        # Adjust by 180 degrees to get the final bearing in the correct direction
        (reverse_bearing + 180) % 360
      else
        calculate_bearing(from_lat, from_lng, to_lat, to_lng)
      end
    end

    private def self.calculate_bearing(lat1, lng1, lat2, lng2) : Float64
      rad_lat1 = degrees_to_radians(lat1)
      rad_lng1 = degrees_to_radians(lng1)
      rad_lat2 = degrees_to_radians(lat2)
      rad_lng2 = degrees_to_radians(lng2)

      delta_lng = rad_lng2 - rad_lng1

      a = Math.sin(delta_lng) * Math.cos(rad_lat2)
      b = Math.cos(rad_lat1) * Math.sin(rad_lat2) -
          Math.sin(rad_lat1) * Math.cos(rad_lat2) * Math.cos(delta_lng)

      radians_to_degrees(Math.atan2(a, b)) % 360
    end

    def self.degrees_to_radians(degrees : Number) : Float64
      degrees * Math::PI / 180.0
    end

    def self.radians_to_degrees(radians : Number) : Float64
      radians * 180.0 / Math::PI
    end
  end
end
