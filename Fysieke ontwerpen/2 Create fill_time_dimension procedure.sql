-- create procedure to fill time_dimension
CREATE PROCEDURE fill_time_dimension (@startDate date, @endDate date)
AS
BEGIN
	DECLARE @loopDate date
	SET @loopDate = @startDate

	WHILE @loopDate <= @endDate
	BEGIN
	INSERT INTO time_dimension (
	full_date,
	year,
	quarter,
	month,
	day
	)
	VALUES (
	@loopDate,
	YEAR(@loopDate),
	DATEPART(quarter, @loopDate),
	MONTH(@loopDate),
	DAY(@loopDate)
	)
	SET @loopDate = DATEADD(day, 1, @loopDate)
	END
END