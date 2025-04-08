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

Parse date with time,
which is required to specify the time zone:

```
>>> '2025-04-08T10:41:00.000+10:00'
>>> .parseDate
>>> .dateTimeString
'2025-04-08T00:41:00.000Z'
```

A value of _Z_ indicates _UTC_:

```
>>> '2023-05-11T09:30:00.000Z'
>>> .parseDate
>>> .dateTimeString
'2023-05-11T09:30:00.000Z'
```

* * *

See also: Date, dateString, dateTimeString, Duration, ordinalDateString, TimeStamp

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromDateString.html),
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)

Categories: Time, Parsing
