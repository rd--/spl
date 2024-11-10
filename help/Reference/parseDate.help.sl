# parseDate

- _parseDate(aString)_

Parse _aString_ as a `Date` value.
A string parser that recognizes subsets of the ISO 8601 specification, _YYYY-MM-DDTHH:mm:ss.sssZ_:

```
>>> '2023-05-11'.parseDate.iso8601
'2023-05-11T00:00:00.000Z'
```

* * *

See also: Date, Duration, iso8601, TimeStamp

Categories: Time, Parsing
