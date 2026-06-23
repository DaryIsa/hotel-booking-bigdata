raw_data = LOAD '/hotel_project/raw_data/hotels.csv'
USING PigStorage(',')
AS (
    hotel:chararray,
    is_canceled:int,
    lead_time:int,
    arrival_date_year:int,
    arrival_date_month:chararray,
    arrival_date_week_number:int,
    arrival_date_day_of_month:int,
    stays_in_weekend_nights:int,
    stays_in_week_nights:int,
    adults:int,
    children:chararray,
    babies:int,
    meal:chararray,
    country:chararray,
    market_segment:chararray,
    distribution_channel:chararray,
    is_repeated_guest:int,
    previous_cancellations:int,
    previous_bookings_not_canceled:int,
    reserved_room_type:chararray,
    assigned_room_type:chararray,
    booking_changes:int,
    deposit_type:chararray,
    agent:chararray,
    company:chararray,
    days_in_waiting_list:int,
    customer_type:chararray,
    adr:double,
    required_car_parking_spaces:int,
    total_of_special_requests:int,
    reservation_status:chararray,
    reservation_status_date:chararray
);

data_no_header =
FILTER raw_data BY hotel != 'hotel';

valid_data =
FILTER data_no_header BY
adults > 0 AND
lead_time >= 0 AND
adr >= 0;

STORE valid_data
INTO '/hotel_project/clean_data'
USING PigStorage(',');
