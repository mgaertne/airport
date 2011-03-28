Feature: Short-Term Parking feature
  The parking lot calculator can calculate costs for Short-Term Parking.

  Scenario Outline: Calculate Short-Term Parking Cost
    When I park my car in the Short-Term Parking Lot for <parking duration>
    Then I will have to pay <parking costs>

  Examples:
  | parking duration   | parking costs |
  | 30 minutes         | $ 2.00        |
  | 1 hour             | $ 2.00        |
  | 3 hours 30 minutes | $ 7.00        |
  | 12 hours 30 minutes| $ 24.00       |
  | 1 day 30 minutes   | $ 25.00       |
  | 1 day 1 hour       | $ 26.00       |
