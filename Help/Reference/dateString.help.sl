# dateString

- _dateString(aDate)_

Answer the ISO-8601 date string.

```
>>> Date(2025, 04, 08)
>>> .dateString
'2025-04-08'
```

This format is recognised by `parseDate`:

```
>>> '2025-04-08'.parseDate.components
[2025 04 08]
```

* * *

See also: Date, dateAndTimeString, ordinalDateString

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateString.html),
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)
