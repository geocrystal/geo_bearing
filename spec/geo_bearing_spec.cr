require "./spec_helper"

describe Geo::Bearing do
  lat1, lng1 = {48.8566, 2.3522}   # Paris
  lat2, lng2 = {40.7128, -74.0060} # New York

  context "version" do
    it { Geo::Bearing::VERSION.should be_a(String) }
  end

  context "bearing" do
    # Checked on https://www.movable-type.co.uk/scripts/latlong.html
    context "calculates initial bearing" do
      it { Geo::Bearing.bearing(lat1, lng1, lat2, lng2).should eq(291.7938627483058) }
    end

    context "calculates final bearing" do
      it { Geo::Bearing.bearing(lat1, lng1, lat2, lng2, true).should eq(233.70448129781204) }
    end
  end
end
