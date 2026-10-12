# isDateString

- _isDateString()_

Answer `true` is the string _s_ is an ISO format date string,
else `false`.

The format sequence is year, month, day of month,
and the separator is a hyphen:

```
>>> '2025-04-25'.isDateString
true

>>> '25/04/2025'.isDateString
false
```

`parseDate` will parse strings that answer `true` to `isDateString`:

```
>>> '2025-04-25'.parseDate
Date[2025 04 25]
```

* * *

See also: Date, isBooleanString, isDateAndTimeString, isDecimalIntegerString, isFloatString, parseDate

Guides: Parsing Functions
