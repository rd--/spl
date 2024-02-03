# Frequency -- temporal type

A type to represent the number of occurrences of a repeating event per unit of time.
Frequency (f) is measured in hertz (Hz) which is equal to the number of events per second.
The period (T) is the interval of time between events, the reciprocal of the frequency.

Frequencies are constructed from _Number_ values using the method _hertz_:

```
3.hertz.isFrequency
```

Frequencies are queried using the same methods:

```
3.kilohertz.hertz = 3000
```

* * *

See also: Duration
