# How long it will take the train to reach their stop, rounding the time
# to the nearest half hour.

# For example, given a distance of 80 km and an average speed of 20 km/h:
# reachDestination(80, 20);
# 'The train will be there in 4 hours.'

require 'spec_helper'

def reach_destination(distance, speed)
  hours = distance / speed.to_f
  hours = (hours * 2).round / 2.0
  hours = hours.to_i if hours.to_i == hours
  "The train will be there in #{hours} hour#{'s' if hours != 1}."
end

RSpec.describe "reach_destination" do
  it "Example cases" do
    expect(reach_destination(5,10)).to eq('The train will be there in 0.5 hours.')
    expect(reach_destination(80,20)).to eq('The train will be there in 4 hours.')
    expect(reach_destination(80,80)).to eq('The train will be there in 1 hour.')
  end
end
