--Dates and Datetimes in SQL
select 1-1-2020;
select GETDATE(); -- doesn't require argument or input, gets today's,time


--erased the top 1000 and created a derived column[As of Datetime] and set it = Getdate() function
--timezone info is from where the server is, not you, unless in the same location.
--to create a custom time value using date from parts function
SELECT [As of Datetime]=GETDATE()
      
  FROM [AdventureWorks2022].[HumanResources].[Employee];

Select GETDATE();
Select DATEFROMPARTS(2025,3,19) as [Today's Date]

-selecting data that occurs before of after a certain date
-- copy [OrderDate] name column to use in Where statement
--when comparing a Date to a Datetime, sql will treat the date w/o datetime component
-- as the time at midnight 12 am, so the comparison will still work
SELECT [SalesOrderID]
      ,[Order Year] = YEAR([OrderDate]) --created/derived column to use Year() function
      ,[RevisionNumber]
      ,[OrderDate]    
      
  FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
  where [OrderDate] between Datefromparts(2013,1,1) and datefromparts(2013,12,1)--year,month,day
  --where [OrderDate] < DATEFROMPARTS(2014,1,1)
  --you can also use the Year() function this way, its easier and cleaner to read:
  where Year([OrderDate]) = 2013
  
--deriving first day of current month, or last day; big deal in data intelligence.
--you can get the individual components/parts of the date, or all at once
select year(getdate()) --select and press alt x  run just the selected/highlighted code
select month(getdate())
select day(getdate())
select DATEFROMPARTS(year(getdate()),month(getdate()),day(getdate()))-- get current date w/o timestamp
select DATEFROMPARTS(year(getdate()),month(getdate()), 1) --get the first day of the month