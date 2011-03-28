When /^I park my car in the Valet Parking Lot for (.*)$/ do | duration |
  $parkcalc.select('Valet Parking')
  $parkcalc.enter_parking_duration(duration)
end

Then /^I will have to pay (.*)$/ do | price |
  $parkcalc.parking_costs.should == price
end
