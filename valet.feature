Feature: Valet Parking feature
  The parking lot calculator can calculate costs for Valet Parking.

Scenario: Calculate Valet Parking Cost for half an hour
  When I park my car in the Valet Parking Lot for 30 minutes
  Then I will have to pay $ 12.00

| parking duration | parking costs |
| 30 minutes       | $ 12.00       |
| 3 hours          | $ 12.00       |
| 5 hours          | $ 12.00       |
| 5 hours 1 minute | $ 18.00       |
| 12 hours         | $ 18.00       |
| 24 hours         | $ 18.00       |
| 1 day 1 minute   | $ 36.00       |
| 3 days           | $ 54.00       |
| 1 week           | $ 126.00      |
