# Dataset

Source: [Hotel Booking Demand Dataset](https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand)

The dataset contains 119,390 hotel bookings from City Hotel and Resort Hotel, covering bookings from 2015 to 2017.

## License

[Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)

## Relevant Columns

| Column | Description |
|---|---|
| `hotel` | Type of hotel |
| `is_canceled` | Cancellation status (1 = canceled, 0 = not canceled) |
| `lead_time` | Number of days between booking and arrival |
| `arrival_date_month` | Month of arrival |
| `country` | Country of the guest |
| `market_segment` | Market segment of the booking |
| `deposit_type` | Type of deposit made for the booking |
| `is_repeated_guest` | Whether the guest is a repeated guest |
| `stays_in_weekend_nights` | Number of weekend nights |
| `stays_in_week_nights` | Number of week nights |

## Data Processing

* Two bookings with an `Undefined` market segment were excluded from the market segment analysis.
* Country-level analysis was limited to the ten countries with the highest booking volumes.
* Length-of-stay analysis was limited to stay lengths with at least 100 bookings.
* July and August include three arrival years (2015 to 2017); all other months include two.
* No predictive modeling or imputation was applied.
