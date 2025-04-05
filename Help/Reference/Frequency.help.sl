# Frequency

A `Type` to represent the number of occurrences of a repeating event per unit of time.
`Frequency` (_f_) is measured in `hertz` (_Hz_) which is equal to the number of events per second.
The period (_T_) is the interval of time between events, the reciprocal of the frequency.

Frequencies are constructed from `Number` values using the methods `hertz`, `kilohertz` and `megaherz`:

```
>>> 3000.hertz
3.kilohertz
```

Frequencies are queried using the same methods:

```
>>> Frequency(3000)
>>> .kilohertz
3
```

The `asHertz` method is `hertz` at `Frequency` and `identity` at `Number`:

```
>>> Frequency(440).asHertz
440

>>> 440.asHertz
440
```

Frequency is a _derived quantity_ in the _International System of Quantities_,
and _hertz_ is a _derived unit_ in the _International System of Units_.

A `Frequency` can be converted into a `Duration`, which gives the length of time of one cycle:

```
>>> Frequency(440).asDuration
Duration(1 / 440)
```

* * *

See also: asHertz, Duration, hertz, Quantity

References:
_W_
[1](https://en.wikipedia.org/wiki/International_System_of_Quantities)
[2](https://en.wikipedia.org/wiki/International_System_of_Units)

Categories: Temporal, Type
