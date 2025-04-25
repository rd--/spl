# isDateString

- _isDateString(aString)_

Answer `true` is _aString_ is an ISO format date string,
else `false`.

```
>>> '2025-04-25'.isDateString
true

>>> '25/04/2025'.isDateString
false
```

`parseDate` will parse strings that answer `true` to `isDateString`:

```
>>> '2025-04-25'.parseDate
Date([2025 04 25 00 00 00 000])
```

* * *

See also: isBooleanString, isDecimalIntegerString, isFloatString, parseDate

Guides: Parsing Functions
