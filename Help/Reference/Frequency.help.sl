# Frequency

- _Frequency(x)_

Frequency is a `Trait` for types that represent the number of occurrences of a repeating event per unit of time.
It is also a specialized constructor method for `Quantity` values.

Frequency (_f_) is measured in hertz (_Hz_) which is equal to the number of events per second.
The period (_T_) is the interval of time between events, the reciprocal of the frequency.

Make a `Quantity` value with unit _hertz_:

```
>>> let f = Frequency(1);
>>> (
>>> 	f.isQuantity,
>>> 	f.isFrequency,
>>> 	f.unit,
>>> 	f.magnitude
>>> )
(true, true, 'hertz', 1)
```

Frequencies can be queried using prefixed unit names:

```
>>> Frequency(3000)
>>> .inKilohertz
3
```

The `inHertz` method applied to `Frequency` and `Time` quantities:

```
>>> Frequency(440).inHertz
440

>>> Time(1 / 440).inHertz
440
```

Frequency is a _derived quantity_ in the _International System of Quantities_,
and _hertz_ is a _derived unit_ in the _International System of Units_,
it is the _inverse second_,
written _s⁻¹_.

A `Frequency` can be converted into a `Time` or a `Duration`,
which gives the length of time of one cycle:

```
>>> Frequency(440).Time
Time(1 / 440)

>>> Frequency(440).Duration
Duration(1 / 440)
```

The inverse:

```
>>> Duration(0.01).Frequency
Frequency(100)

>>> Frequency(100).Duration
Duration(0.01)
```

At `Frequency` is identity:

```
>>> let a = Frequency(100);
>>> let b = Frequency(a);
>>> (a, a = b)
(Quantity(100, 'hertz'), true)
```

Threads over lists:

```
>>> Frequency[1 10; 100 1000]
[
	1.hertz 1.decahertz;
	1.hectohertz 1.kilohertz
]
```

* * *

See also: Duration, Quantity, hertz, inHertz

Guides: Quantity Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/International_System_of_Quantities)
[2](https://en.wikipedia.org/wiki/International_System_of_Units)

Categories: Temporal, Trait
