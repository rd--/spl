# parseDateAndTime

- _parseDateAndTime(aString)_
- _parseDateAndTime(aString, elseClause:/0)_

Parse _aString_ as a `Date` value.
A string parser that recognizes subsets of the ISO 8601 specification.

```
>>> '2025-04-08T10:41:00.000+10:00'
>>> .parseDateAndTime
>>> .dateAndTimeString
'2025-04-08T00:41:00.000Z'
```

A value of _Z_ indicates _UTC_:

```
>>> '2023-05-11T09:30:00.000Z'
>>> .parseDateAndTime
>>> .dateAndTimeString
'2023-05-11T09:30:00.000Z'
```

On parser failure:

```
>>> '2023-05-11T09:30'
>>> .parseDateAndTime { nil }
nil

>>> {
>>> 	'2023-05-11T09:30'
>>> 	.parseDateAndTime
>>> }.ifError { true }
true
```

To parse a date without time use `parseDate`.

* * *

See also: Date, dateString, dateAndTimeString, Duration, ordinalDateString, parseDate, TimeStamp

Guides: Parsing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromDateString.html),
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)

Categories: Time, Parsing
