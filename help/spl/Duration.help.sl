# Duration -- time

A type to represent an interval of time.

- _Duration(aString)_

Parse an ISO-8601 duration string.

	'P3DT4H'.Duration = (3.days + 4.hours)

Durations are constructed from _Number_ values using the methods _milliseconds_, _seconds_, _minutes_, _hours_, _days_, _weeks_:

	3.seconds = 3000.milliseconds
	3.minutes = 180.seconds
	3.hours = 180.minutes
	3.days = 72.hours
	3.weeks = 21.days

Durations are queried using the same methods:

	3.minutes.seconds = 180
	3.hours.minutes = 180
	3.days.hours = 72
	3.weeks.days = 21

* * *

See also: Date, TimeStamp
