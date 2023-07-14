# Date -- time type

An object representing a date and time.

- _Date(aString)_

The string method recognizes subsets of the ISO 8601 specification, _YYYY-MM-DDTHH:mm:ss.sssZ_:

	Date('2023-05-11').iso8601 = '2023-05-11T00:00:00.000Z'

- _Date(aNumber)_

The number method translates from unix time in milliseconds:

	Date(0).iso8601 = '1970-01-01T00:00:00.000Z'

- _Date(aSystem)_

The system method answers the current date at _aSystem_:

	system.Date.isDate

There are methods to access the elements of the date,
i.e. _year_, _month_, _dayOfMonth_, _hour_, _minute_, _second_ &etc.

	| d = Date(0); | [d.year, d.month, d.dayOfMonth] = [1970, 1, 1]

* * *

See also: Duration, TimeStamp
