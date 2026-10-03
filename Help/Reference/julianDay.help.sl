# julianDay

- _julianDay(d)_

Answer the Julian day of the `Date` _d_.

Julian day number `zero` is assigned to the day starting at noon on Monday, January 1, 4713 BCE,
proleptic Julian calendar,
or November 24, 4714 BCE,
in the proleptic Gregorian calendar:

```
>>> Date(-4713, 11, 24)
>>> .julianDay
0

>>> 0.fromJulianDay
Date(-4713, 11, 24)

>>> Date(-4713, 11, 24)
>>> .julianDate
[-4712 1 1]

>>> JulianDate(-4712, 1, 1)
>>> .julianDay
0
```

Ebenezer Burgess in his 1860 translation of the _Surya Siddhanta_ stated that the beginning of the Kali Yuga era occurred at midnight at the meridian of Ujjain at the end of the 588,465th day and the beginning of the 588,466th day (civil reckoning) of the Julian Period, or between February 17 and 18 3102 BC:

```
>>> JulianDate(-3101, 02, 17)
>>> .julianDay
588_465

>>> JulianDate(-3101, 02, 17)
Date(-3101, 1, 22)

>>> Date(-3101, 1, 22)
>>> .julianDay
588_465
```

Common era:

```
>>> JulianDate(0001, 01, 01)
>>> .julianDay
1_721_424

>>> JulianDate(0001, 01, 01)
Date(0000, 12, 30)

>>> Date(0000, 12, 30)
>>> .julianDay
1_721_424

>>> Date(0001, 01, 01)
>>> .julianDay
1_721_426
```

Gregorian calendar:

```
>>> Date(1582, 10, 15).julianDay
2_299_161
```

Modified Julian Date:

```
>>> Date(1858, 11, 16).julianDay
2_400_000

>>> 2_400_000.fromJulianDay
Date(1858, 11, 16)
```

Specific days:

```
>>> Date(2000, 1, 1).julianDay
2_451_545

>>> Date(2009, 12, 09).julianDay
2_455_175

>>> Date(2013, 01, 01).julianDay
2_456_294

>>> Date(2013, 11, 21).julianDay
2_456_618

>>> Date(2026, 10, 03).julianDay
2_461_317
```

* * *

See also: Date, JulianDate

References:
_W_
[1](https://en.wikipedia.org/wiki/Julian_day)
