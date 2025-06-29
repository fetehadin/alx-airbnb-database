# 🔄 Database Normalization - Airbnb Clone

This document outlines the normalization process applied to the Airbnb Clone database schema to ensure it adheres to **Third Normal Form (3NF)**. The goal is to eliminate redundancy, ensure data integrity, and optimize the schema for scalability and consistency.

---

## ✅ Normalization Goals

To achieve **Third Normal Form (3NF)**, the database must meet the following:

1. **First Normal Form (1NF):**  
   - All attributes contain only atomic values (no repeating groups or arrays).
   - Each record is unique (has a primary key).

2. **Second Normal Form (2NF):**  
   - Satisfies 1NF.
   - All non-key attributes are fully functionally dependent on the entire primary key (no partial dependencies).

3. **Third Normal Form (3NF):**  
   - Satisfies 2NF.
   - No transitive dependencies (non-key attributes depend only on the primary key).

---

## 🔍 Normalization Analysis

### 1. **User Table**

**Current Structure:**

- Atomic values ✅  
- Primary key assumed as `user_id` (though not listed; should be added)  
- No partial or transitive dependencies ✅  

✅ Already in 3NF.

### 2. **Property Table**

**Current Structure:**

- `property_id` is the primary key ✅  
- `host_id` is a foreign key to `User(user_id)` ✅  
- All other fields depend solely on `property_id` ✅  
- `location` is a VARCHAR — assumed to be a string like city or address. If detailed address components are stored, this can be split into a separate `Location` table.

✅ No transitive dependencies → 3NF satisfied.

### 3. **Booking Table**

**Structure:**

- `booking_id` is the primary key ✅  
- Foreign keys: `property_id`, `user_id`  
- All fields directly depend on `booking_id` ✅  
- `total_price` could be considered derived (from date range × price per night), but it's acceptable to store for performance.

✅ 3NF compliant.

### 4. **Payment Table**

- `payment_id` is the primary key ✅  
- Foreign key: `booking_id`  
- No derived or redundant fields ✅  
- `payment_method` as ENUM is acceptable here; consider normalization into a `PaymentMethod` table if new payment types may be frequently added.

✅ Acceptable in 3NF.

### 5. **Review Table**

- `review_id` is the primary key ✅  
- Foreign keys: `property_id`, `user_id`  
- `rating` and `comment` are atomic ✅  
- No transitive dependencies ✅

✅ Already in 3NF.

### 6. **Message Table**

- `message_id` is the primary key ✅  
- `sender_id`, `recipient_id` → Foreign keys to `User(user_id)` ✅  
- `message_body` is atomic ✅

✅ Satisfies 3NF.

---

## ⚠️ Optional Improvements

| Table       | Column         | Suggestion                                      |
|-------------|----------------|-------------------------------------------------|
| `Property`  | `location`     | Could be split into a `Location` table for normalization if storing multiple address fields (e.g., city, state, country) |
| `Payment`   | `payment_method` | Could be normalized into a separate `PaymentMethod` table if values grow or require attributes (e.g., provider metadata) |

---

## ✅ Final Verdict

The current schema is well-structured and adheres to **Third Normal Form (3NF)**. Minor enhancements are optional and can be introduced for extensibility in larger-scale systems.

