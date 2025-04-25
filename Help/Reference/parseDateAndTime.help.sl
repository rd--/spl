# parseDateAndTime

- _parseDate(aString)_

Parse _aString_ as a `Date` value.
A string parser that recognizes subsets of the ISO 8601 specification.

```
>>> '2025-04-08T10:41:00.000+10:00'
>>> .parseDateAndTime
>>> .dateTimeString
'2025-04-08T00:41:00.000Z'
```

A value of _Z_ indicates _UTC_:

```
>>> '2023-05-11T09:30:00.000Z'
>>> .parseDateAndTime
>>> .dateTimeString
'2023-05-11T09:30:00.000Z'
```

To parse a date without time use `parseDate`.

* * *

See also: Date, dateString, dateTimeString, Duration, ordinalDateString, parseDate, TimeStamp

Guides: Parsing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromDateString.html),
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)

Categories: Time, Parsing
