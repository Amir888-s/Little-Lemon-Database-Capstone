USE LittleLemonDB;
CALL GetMaxQuantity();
CALL ManageBooking('2026-12-01', 4);
SELECT COUNT(*) FROM Orders;
SELECT * FROM SalesSummary LIMIT 10;
