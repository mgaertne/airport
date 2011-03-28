# -*- coding: utf-8 -*-
class ParkCalcPage
  attr :page

  def initialize(page_handle)
    @page = page_handle
    @page.open '/parkcalc'
  end

  def select(parking_lot)
  end

  def enter_parking_duration(duration)
  end

  def parking_costs
    return nil
  end

end
