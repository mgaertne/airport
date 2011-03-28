Feature: Long-Term Surface Parking feature
  The parking lot calculator can calculate costs for Long-Term Surface parking.

  Scenario Outline: Calculate Long-Term Surface Parking Cost
    When I park my car in the Long-Term Surface Parking Lot for <parking duration>
    Then I will have to pay <parking costs>

  Examples:
  | parking duration    | parking costs |
  | 30 minutes          | $ 2.00        |
  | 1 hour              | $ 2.00        |
  | 5 hours             | $ 10.00       |
  | 6 hours             | $ 10.00       |
  | 24 hours            | $ 10.00       |
  | one day, one hour   | $ 12.00       |
  | one day, three hours| $ 16.00       |
  | one day, six hours  | $ 20.00       |
  | six days            | $ 60.00       |
  | six days, one hour  | $ 60.00       |
  | seven days          | $ 60.00       |
  | one week, two days  | $ 80.00       |
  | three weeks         | $ 180.00      |
