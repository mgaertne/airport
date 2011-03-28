When /^I park my car in the (.*) Lot for (.*)$/ do | parking_lot, duration |
  $parkcalc.select(parking_lot)
  $parkcalc.enter_parking_duration(duration)
end

Then /^I will have to pay (.*)$/ do | price |
  $parkcalc.parking_costs.should == price
end
