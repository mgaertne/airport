Feature: Economy Parking feature
  The parking lot calculator can calculate costs for Economy parking.

  Scenario Outline: Calculate Economy Parking Cost
    When I park my car in the Economy Parking Lot for <parking duration>
    Then I will have to pay <parking costs>

  Examples:
  | parking duration    | parking costs |
  | 30 minutes          | $ 2.00        |
  | 1 hour              | $ 2.00        |
  | 4 hours             | $ 8.00        |
  | 5 hours             | $ 9.00        |
  | 6 hours             | $ 9.00        |
  | 24 hours            | $ 9.00        |
  | one day, one hour   | $ 11.00       |
  | one day, three hours| $ 15.00       |
  | one day, five hours | $ 18.00       |
  | six days            | $ 54.00       |
  | six days, one hour  | $ 54.00       |
  | seven days          | $ 54.00       |
  | one week, two days  | $ 72.00       |
  | three weeks         | $ 162.00      |
