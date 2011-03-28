Feature: Long-Term Garage Parking feature
  The parking lot calculator can calculate costs for Long-Term Garage parking.

  Scenario Outline: Calculate Long-Term Garage Parking Cost
    When I park my car in the Long-Term Garage Parking Lot for <parking duration>
    Then I will have to pay <parking costs>

  Examples:
  | parking duration    | parking costs |
  | 30 minutes          | $ 2.00        |
  | 1 hour              | $ 2.00        |
  | 3 hours             | $ 6.00        |
  | 6 hours             | $ 12.00       |
  | 7 hours             | $ 12.00       |
  | 24 hours            | $ 12.00       |
  | one day, one hour   | $ 14.00       |
  | one day, three hours| $ 18.00       |
  | one day, seven hours| $ 24.00       |
  | six days            | $ 72.00       |
  | six days, one hour  | $ 72.00       |
  | seven days          | $ 72.00       |
  | one week, two days  | $ 96.00       |
  | three weeks         | $ 216.00      |
