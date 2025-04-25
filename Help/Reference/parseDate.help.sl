# parseDate

- _parseDate(aString)_

Parse _aString_ as a `Date` value.
A string parser that recognizes subsets of the ISO 8601 specification.

Parse date without time,
which is set to _00:00_ UTC:

```
>>> '2023-05-11'
>>> .parseDate
>>> .dateString
'2023-05-11'
```

To parse a date with time use `parseDateAndTime`.

* * *

See also: Date, dateString, dateTimeString, Duration, ordinalDateString, parseDateAndTime, TimeStamp

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromDateString.html),
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)

Categories: Time, Parsing
