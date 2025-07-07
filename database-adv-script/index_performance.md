# 📈 Index Performance Report

## Overview
To improve query performance in the Airbnb schema, we identified and indexed the most frequently queried columns across key tables.

---

## ✅ Indexes Added

| Table      | Column           | Index Name                |
|------------|------------------|---------------------------|
| User       | email            | idx_user_email            |
| Booking    | user_id          | idx_booking_user_id       |
| Booking    | property_id      | idx_booking_property_id   |
| Booking    | start_date       | idx_booking_start_date    |
| Property   | location         | idx_property_location     |

---

## 🔍 Performance Testing

### 1. Query: Find bookings for a specific user

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 'abc123';
