# parseDate

- _parseDate(aString)_

Parse _aString_ as a `Date` value.
A string parser that recognizes subsets of the ISO 8601 specification,
specifically _YYYY-MM-DD_.

Parse date:

```
>>> '2023-05-11'
>>> .parseDate
>>> .dateString
'2023-05-11'
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
