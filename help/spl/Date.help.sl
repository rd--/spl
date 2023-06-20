# Date -- time

- _Date(aString)_
- _Date(aNumber)_

An object representing a date and time.

The string constructor will recognize subsets of the ISO 8601 specification, _YYYY-MM-DDTHH:mm:ss.sssZ_.

The number constructor translates from unix time in milliseconds.

	Date('2023-05-11').iso8601 = '2023-05-11T00:00:00.000Z'
	Date(0).iso8601 = '1970-01-01T00:00:00.000Z'

There are methods to access the elements of the date,
i.e. _year_, _month_, _dayOfMonth_, _hour_, _minute_, _second_ &etc.
