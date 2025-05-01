# isTimeString

- _isTimeString(s)_

Answer `true` if the `String` _s_ is an ISO-8601 time string,
specifically _hh:mm:ss.sss_,
else `false`.

```
>>> '08:22:09.023'.isTimeString
true
```

The millisecond part may be elided:

```
>>> '08:23:04'.isTimeString
true
```

* * *

See also: parseTime, Time, timeString

Guides: Parsing Functions

Categories: Time
