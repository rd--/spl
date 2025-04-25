# ordinalDateString

- _ordinalDateString(aDate)_

Answer the ISO ordinal date string for _aDate_.

```
>>> let d = Date([2025 04 08 08 11 00 000]);
>>> (
>>> 	d.ordinalDateString,
>>> 	d.dateString,
>>> 	d.dateTimeString
>>> )
(
	'2025-098',
	'2025-04-08',
	'2025-04-08T08:11:00.000Z'
)
```

* * *

See also: Date, dateString, dateTimeString, durationString

References:
_W_
[1](https://en.wikipedia.org/wiki/Ordinal_date)
