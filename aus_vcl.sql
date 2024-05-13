SELECT * FROM firstproject.australian_vehicle_prices;
# Select Year wise Brand
select Year,Brand from firstproject.australian_vehicle_prices group by Brand,Year order by year desc;
#2. year wise seles of cars
select Year,count(Year) from firstproject.australian_vehicle_prices group by Year order by Year desc;
SELECT * FROM firstproject.australian_vehicle_prices;
#3. Distinct wise Year
select Brand,count(Brand) as Count_Brand from firstproject.australian_vehicle_prices group by Brand order by Count_Brand desc;
select Brand,count(distinct(Brand)) as Co_br from firstproject.australian_vehicle_prices group by Brand order by Co_Br;
select (Brand) from firstproject.australian_vehicle_prices;
select count(Brand)from firstproject.australian_vehicle_prices;
#4. Maximum sales of which fuel typesold
select FuelType,count(FuelType) as count_of_Max_FuelType_car_Sold from firstproject.australian_vehicle_prices group by FuelType order by count_of_max_Fueltype_car_sold desc;

#10. Average pricing of each bodytype car
select BodyType, Count(BodyType),avg(Price) as avg_Price from firstproject.australian_vehicle_prices group by BodyType;
select Model, count(Model),avg(price) as Avg_Price from firstproject.australian_vehicle_prices group by Model order by Avg_Price desc;
select FuelType,count(FuelType),avg(Price) as Avg_price from firstproject.australian_vehicle_prices group by FuelType;
#5. maximum Sales of Which Bodytype Cars Sold
select Brand,count(Brand) as Count_Brand FROM firstproject.australian_vehicle_prices group by Brand order by Count_Brand desc;
select * FROM firstproject.australian_vehicle_prices;
select BodyType,count(BodyType),avg(Price) as Avg_BodyType FROM firstproject.australian_vehicle_prices group by BodyType order by Avg_BodyType desc;
#6. 
select Trasmission,FuelType FROM firstproject.australian_vehicle_prices group by Transmission,FuelType;
#7.
select count(usedornew) as Number_of_Cars,Bodytype,Engine,usedornew from aus_vehicle_price  group by usedornew,Bodytype,Engine order by Number_of_cars desc;
#8.Minimum car price 
SELECT UsedOrNew, Car/suv, price FROM firstproject.australian_vehicle_prices  WHERE price = (SELECT MIN(price) FROM firstproject.australian_vehicle_prices);

#9. Maximum Car Price
select UserOrNew, Car/Suv, price from firstproject.australian_vehicle_prices where price = (select min(Price)from firstproject.australian_vehicle_prices);

#11. Percentage of each bodytype car count & average price of each bodytype car
select BodyType,count(BodyType) as Car_count, avg(Price) as average_price,(count(Car_count)*100.0/(select Count(Car_count))from firstproject.australian_vehicle_prices group by BodyType order by percentage desc;
# 12.
select Year,Brand,count(Price) AS MaxUsedCarPrice FROM firstproject.australian_vehicle_prices group by Year;
WHERE UsedOrNew = 'Used' GROUP BY    Brand,Year order by year desc;
#Q15. Identifing brands using case function on the basis of luxary,premium.
select distinct(Brand),case when Brand in ('BMW','Mercedes-Benz') then 'Luxary' 
when  Brand in ('Honda','Toyota') then 'Reliable'
when Brand like ('%Nissan%')  then 'Efficient'
else 'Ordinary'
End as class from firstproject.australian_vehicle_prices;
#Q14. Identifying factors such as model, year, and fuel type that significantly impact vehicle prices.
SELECT Brand, Model,    Year,    FuelType,    AVG(Price) AS AveragePrice,    MAX(Price) AS MaxPrice,    MIN(Price) AS MinPrice
FROM    firstproject.australian_vehicle_prices GROUP BY    Brand,Model, Year, FuelType;
#15. Analyzing the distribution of prices reveals trends in the pricing of vehicles in different segments.
SELECT    Car/Suv AS Segment, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice, AVG(Price) AS AvgPrice,    COUNT(*) AS NumberOfVehicles
FROM firstproject.australian_vehicle_prices GROUP BY Car/Suv;
#16. Q16. Observing how vehicle prices have evolved over the years to identify market trends and shifts.
SELECT Year,AVG(Price) AS AveragePrice, MIN(Price) AS MinPrice,MAX(Price) AS MaxPrice,COUNT(*) AS NumberOfVehicles 
FROM firstproject.australian_vehicle_prices GROUP BY Year ORDER BY Year desc;
#17. Q17. Analysis of Cylinder Count in the Engine:
SELECT CylindersinEngine,COUNT(*) AS VehicleCount, AVG(Price) AS AvgPrice 
FROM firstproject.australian_vehicle_prices GROUP BY    CylindersinEngine  order by vehicleCount desc;
#18. Q18. Average Number of Seats by Body Type:
SELECt bodyType,round(AVG(Seats)) AS AvgSeats FROM firstproject.australian_vehicle_prices GROUP BY BodyType;
#19. Q19. Top 5 Brands,Models with the Highest Average Price:
SELECT Brand,Model,AVG(Price) AS AveragePrice FROM firstproject.australian_vehicle_prices GROUP BY brand,Model ORDER BY AveragePrice DESC LIMIT 5;
#Q20. Maximum Kilometres Traveled by Transmission Type:
SELECT Transmission, MAX(Kilometres) AS MaxKilometres
FROM firstproject.australian_vehicle_prices GROUP BY Transmission;
select Year, UsedOrNew,,Trasmission,FuelType count(Year)aFROM firstproject.australian_vehicle_prices group by Year,UsedOrNew,Transmission,FuelType order by Year desc;
