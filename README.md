# Hotel Booking Cancellation Analysis

An exploratory SQL analysis of 119,390 hotel bookings, identifying the strongest patterns associated with reservation cancellations and translating them into actionable insights.

## Overview

This project investigates which booking characteristics are associated with cancellations in a hotel reservation context. Rather than building a predictive model, the analysis follows a hypothesis-driven approach: each query tests a specific business question, and follow-up analysis is added when an initial result raises a further question.

## Dataset

* **Source:** [Hotel Booking Demand Dataset](https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand) (Kaggle, Jesse Mostipak)
* **Size:** 119,390 rows, 32 columns
* **Period:** Hotel bookings from 2015 to 2017
* **Target variable:** `is_canceled` (1 = canceled, 0 = not canceled)
* **Overall cancellation rate:** 37.04%

## Tools

* SQL (SQLite / DBeaver) for data exploration and analysis
* Tableau Public for visualization

## Dashboard

[View the interactive dashboard on Tableau Public](https://public.tableau.com/views/Project2-HotelBooking/HotelBookingCancellationAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Approach

* Lead time ranges were defined before reviewing results, based on standard business logic, to avoid fitting categories to observed patterns.
* Cancellation rates were compared across hotel type, lead time, deposit type, guest type, country, market segment, arrival month, and length of stay.
* The country analysis was limited to the ten countries with the highest booking volumes, and the length-of-stay analysis to stay lengths with at least 100 bookings, to avoid interpreting rates from small groups.
* A follow-up query on length of stay was added to check whether it explained part of the cancellation pattern.
* The analysis is descriptive and observational. It identifies associations in the data but does not establish causality and does not predict future cancellations.

## Key Insights

**1. Hotel type shows a clear gap in cancellation rate**

City Hotel bookings had a higher cancellation rate than Resort Hotel bookings (41.73% vs. 27.76%).

**2. Cancellation rate varies by arrival month**

June had the highest cancellation rate (41.46%), while January had the lowest (30.48%). August had the highest booking volume (13,877) with a cancellation rate of 37.75%, so higher volume did not coincide with the highest cancellation rate.

**3. Cancellation rate increases consistently with lead time**

The rate rises from 9.63% for bookings made 0-7 days in advance to 50.65% for bookings made more than 90 days in advance.

**4. Non-Refund bookings show an unusually high cancellation rate**

Non-Refund bookings had a cancellation rate of 99.36%, compared to 28.38% for No Deposit bookings. Refundable bookings had a rate of 22.22%, although this group contained only 162 bookings and should be interpreted cautiously. The Non-Refund pattern is counterintuitive and may reflect how these bookings are recorded or specific booking channels rather than the deposit policy itself.

**5. Repeated guests show a lower cancellation rate**

14.49% for repeated guests vs. 37.79% for first-time guests, indicating an association between guest history and cancellation behavior.

**6. Cancellation rates differ across the highest-volume countries**

Among the ten countries with the highest booking volumes, Portugal had the highest cancellation rate (56.64%), while Germany had the lowest (16.71%).

**7. Group bookings show the highest cancellation rate among market segments**

Groups had a cancellation rate of 61.06%, while Complementary bookings had the lowest (13.06%). Direct bookings also had a relatively low rate (15.34%).

**8. Length of stay shows no clear pattern**

Cancellation rates varied across stay lengths without a consistent direction. Unlike lead time, longer stays did not correspond to higher or lower cancellation rates.

## Business Recommendations

* Review cancellation policies for bookings made well in advance, where higher cancellation rates were observed.
* Review booking conditions for Group bookings, which had the highest cancellation rate among market segments.
* Explore ways to encourage repeat bookings, given the lower cancellation rate observed among repeated guests.
* Review the booking patterns behind Non-Refund reservations before drawing conclusions about the effectiveness of deposit policies.
* Monitor cancellation patterns by hotel type and arrival month to support capacity and inventory planning.

## Repository Structure

```text
hotel-booking-cancellation-analysis/
│
├── README.md
├── LICENSE
├── .gitignore
├── sql/
│   └── hotel_booking_analysis.sql
├── dashboard/
│   ├── screenshots/
│   │   └── hotel-booking-cancellation-dashboard.png
│   └── README.md
└── data/
    └── README.md
```
