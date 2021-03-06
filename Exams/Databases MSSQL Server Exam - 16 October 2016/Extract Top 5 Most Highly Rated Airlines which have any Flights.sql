SELECT TOP 5 a.AirlineID,a.AirlineName,a.Nationality,a.Rating FROM Airlines AS a
JOIN Flights AS f ON f.AirlineID = a.AirlineID
GROUP BY a.AirlineID,a.AirlineName,a.Nationality,a.Rating
HAVING COUNT(f.FlightID) > 0
ORDER BY a.Rating DESC,a.AirlineID
