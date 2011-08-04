# -*- coding: utf-8 -*-
class ParkCalcPage

  @@lotIdentifier = 'ParkingLot'
  @@startingPrefix = 'Starting'
  @@leavingPrefix = 'Leaving'
  @@dateTemplate = "%sDate"
  @@timeTemplate = "%sTime"
  @@amPMRadioButtonTemplate = "//input[@name='%sTimeAMPM' and @value='%s']"

  @@calculateButtonIdentifier = 'Submit'
  @@costElementLocation = "//tr[td/div[@class='SubHead'] = 'estimated Parking costs']/td/span/b"

  @@durationMap = {
    '30 minutes' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '12:30', 'AM'],
    '1 hour' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '01:00', 'AM'],
    '3 hours' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '03:00', 'AM'],
    '3 hours 30 minutes' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '03:30', 'AM'],
    '4 hours' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '04:00', 'AM'],
    '5 hours' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '05:00', 'AM'],
    '5 hours 1 minute' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '05:01', 'AM'],
    '6 hours' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '06:00', 'AM'],
    '7 hours' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '07:00', 'AM'],
    '12 hours' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '12:00', 'PM'],
    '12 hours 30 minutes' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '12:30', 'PM'],
    '24 hours' => ['05/04/2010', '12:00', 'AM', '05/05/2010', '12:00', 'AM'],
    '1 day 1 minute' => ['05/04/2010', '12:00', 'AM', '05/05/2010', '12:01', 'AM'],
    '1 day 30 minutes' => ['05/04/2010', '12:00', 'AM', '05/05/2010', '12:30', 'AM'],
    '1 day 1 hour' => ['05/04/2010', '12:00', 'AM', '05/05/2010', '01:00', 'AM'],
    'one day, one hour' => ['05/04/2010', '12:00', 'AM', '05/05/2010', '01:00', 'AM'],
    'one day, three hours' => ['05/04/2010', '12:00', 'AM', '05/05/2010', '03:00', 'AM'],
    'one day, five hours' => ['05/04/2010', '12:00', 'AM', '05/05/2010', '05:00', 'AM'],
    'one day, six hours' => ['05/04/2010', '12:00', 'AM', '05/05/2010', '06:00', 'AM'],
    'one day, seven hours' => ['05/04/2010', '12:00', 'AM', '05/05/2010', '07:00', 'AM'],
    '3 days' => ['05/04/2010', '12:00', 'AM', '05/07/2010', '12:00', 'AM'],
    'six days' => ['05/04/2010', '12:00', 'AM', '05/10/2010', '12:00', 'AM'],
    'six days, one hour' => ['05/04/2010', '12:00', 'AM', '05/10/2010', '01:00', 'AM'],
    '1 week' => ['05/04/2010', '12:00', 'AM', '05/11/2010', '12:00', 'AM'],
    'seven days' => ['05/04/2010', '12:00', 'AM', '05/11/2010', '12:00', 'AM'],
    'one week, two days' => ['05/04/2010', '12:00', 'AM', '05/13/2010', '12:00', 'AM'],
    'three weeks' => ['05/04/2010', '12:00', 'AM', '05/25/2010', '12:00', 'AM']
  }
  attr :page

  def initialize(page_handle)
    @page = page_handle
    @page.open '/parkcalc'
  end

  def select(parking_lot)
    @page.select @@lotIdentifier, parking_lot
  end

  def enter_parking_duration(duration)
    startingDate, startingTime, startingTimeAMPM, leavingDate, leavingTime, leavingTimeAMPM = @@durationMap[duration]
    fill_in_date_and_time_for @@startingPrefix, startingDate, startingTime, startingTimeAMPM
    fill_in_date_and_time_for @@leavingPrefix, leavingDate, leavingTime, leavingTimeAMPM
  end

  def fill_in_date_and_time_for(formPrefix, date, time, ampm)
    @page.type @@dateTemplate % formPrefix, date
    @page.type @@timeTemplate % formPrefix, time
    @page.click @@amPMRadioButtonTemplate % [ formPrefix, ampm ]
  end

  def parking_costs
    calculate_parking_costs
    get_parking_costs_from_page
  end

  def calculate_parking_costs
    @page.click @@calculateButtonIdentifier
    @page.wait_for_page_to_load 10000
  end

  def get_parking_costs_from_page
    @page.get_text @@costElementLocation
  end

end
