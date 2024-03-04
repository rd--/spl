# localeTimeString

- _localeTimeString(aDate, aLocale)_

Answer a `String` with a language-sensitive representation of the time portion of _aDate_ in the local timezone.

```
>>> 0.asDate.localeTimeString('en-US')
'10:00:00 AM'

>>> 0.asDate.localeTimeString('it-IT')
'10:00:00'
```

* * *

See also: asDate, Date, iso8601
