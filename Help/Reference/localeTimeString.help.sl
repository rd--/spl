# localeTimeString

- _localeTimeString(aDateAndTime, aLocale)_

Answer a `String` with a language-sensitive representation of the time portion of _aDateAndTime_ in the local timezone.

```
>>> 0.asDateAndTime.localeTimeString('en-US')
'10:00:00 AM'

>>> 0.asDateAndTime.localeTimeString('it-IT')
'10:00:00'
```

* * *

See also: asDate, Date, dateAndTimeString

Categories: Printing, Time
