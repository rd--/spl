# Date

An object representing a date and time.

- _parseDate(aString)_

The string parser recognizes subsets of the ISO 8601 specification, _YYYY-MM-DDTHH:mm:ss.sssZ_:

	'2023-05-11'.parseDate.iso8601 = '2023-05-11T00:00:00.000Z'

- _asDate(aNumber)_

The number conversion translates from unix time in milliseconds:

	0.asDate.iso8601 = '1970-01-01T00:00:00.000Z'

- _Date(aSystem)_

The system constructor method answers the current date at _aSystem_:

	Date(system).isDate

There are methods to access the elements of the date,
i.e. _year_, _month_, _dayOfMonth_, _hour_, _minute_, _second_ &etc.

	let d = 0.asDate;  [d.year, d.month, d.dayOfMonth] = [1970, 1, 1]

* * *

See also: Duration, TimeStamp

Categories: Time, Type
