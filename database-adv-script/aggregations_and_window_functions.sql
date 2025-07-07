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

-- Window Function: RANK
-- Rank properties by the total number of bookings

SELECT 
  Property.property_id,
  Property.name,
  COUNT(Booking.booking_id) AS booking_count,
  RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS rank
FROM Property
LEFT JOIN Booking ON Property.property_id = Booking.property_id
GROUP BY Property.property_id, Property.name;
