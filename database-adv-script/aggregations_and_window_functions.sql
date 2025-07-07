-- Aggregation with COUNT
-- Find total number of bookings made by each user

SELECT 
  User.user_id,
  User.first_name,
  User.email,
  COUNT(Booking.booking_id) AS total_bookings
FROM User
JOIN Booking ON User.user_id = Booking.user_id
GROUP BY User.user_id, User.first_name, User.email
ORDER BY total_bookings DESC;

-- Window Function: ROW_NUMBER
-- Rank properties by the total number of bookings

SELECT 
  property_id,
  name,
  booking_count,
  ROW_NUMBER() OVER (ORDER BY booking_count DESC) AS row_num
FROM (
    SELECT 
      Property.property_id,
      Property.name,
      COUNT(Booking.booking_id) AS booking_count
    FROM Property
    LEFT JOIN Booking ON Property.property_id = Booking.property_id
    GROUP BY Property.property_id, Property.name
) AS ranked_properties;
