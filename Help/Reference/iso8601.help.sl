# iso8601

- _iso8601(t)_

Answers a `String` that formats the temporal object _t_ according to the ISO-8601 standard.


At `Date`:

```
>>> 0.asDate.iso8601
'1970-01-01T00:00:00.000Z'
```

At `TimeStamp`:

```
>>> 0.asTimeStamp.iso8601
'1970-01-01T00:00:00.000Z'
```

* * *

See also: Date, parseDate, parseDuration, TimeStamp

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateString.html),
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)

Categories: Time
