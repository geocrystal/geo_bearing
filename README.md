# geo_bearing

[![Crystal CI](https://github.com/geocrystal/geo_bearing/actions/workflows/crystal.yml/badge.svg)](https://github.com/geocrystal/geo_bearing/actions/workflows/crystal.yml)
[![GitHub release](https://img.shields.io/github/release/geocrystal/geo_bearing.svg)](https://github.com/mamgeocrystalantoha/geo_bearing/releases)
[![License](https://img.shields.io/github/license/geocrystal/geo_bearing.svg)](https://github.com/geocrystal/geo_bearing/blob/main/LICENSE)

Crystal implementation of calculating initial and final bearings between two points using great-circle distance formulas.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     geo_bearing:
       github: geocrystal/geo_bearing
   ```

2. Run `shards install`

## Usage

```crystal
require "geo_bearing"

lat1, lng1 = {48.8566, 2.3522}   # Paris
lat2, lng2 = {40.7128, -74.0060} # New York

Geo::Bearing.bearing(lat1, lng1, lat2, lng2)
# => 291.7938627483058

Geo::Bearing.bearing(lat1, lng1, lat2, lng2, true)
# => 233.70448129781204
```

![convex hull](/assets/readme_image.png)

## Contributing

1. Fork it (<https://github.com/geocrystal/geo_bearing/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
