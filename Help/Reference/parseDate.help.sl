# parseDate

- _parseDate(s, f₀)_

Parse the string _s_ as a `Date` value.
The parser recognizes subsets of the ISO 8601 specification,
specifically _YYYY-MM-DD_.
An optional error handler can be specified.

Parse date:

```
>>> '2023-05-11'
>>> .parseDate
>>> .dateString
'2023-05-11'
```

On parse failure:

```
>>> '2025-05'.parseDate { nil }
nil

>>> ''.parseDate { nil }
nil

>>> {
>>> 	'2025-05'.parseDate
>>> }.ifError { true }
true
```

To parse a `DateAndTime` use `parseDateAndTime`.

* * *

See also: Date, dateString, dateAndTimeString, Duration, ordinalDateString, parseDateAndTime, TimeStamp

Guides: Date and Time Functions, Parsing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromDateString.html),
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)

Categories: Time, Parsing
