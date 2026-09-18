# yards

- _yards(x)_

At `Number`,
answer the `Quantity` _x_ yards.

```
>>> 1760.yards
Quantity(1609.344, 'metres')
```

One mile is defined as 1760 yards:

```
>>> 1760.yards.inMiles
1

>>> 1.miles.inYards
1760
```

One yard is defined as 0.9144 metres:

```
>>> 1.yards.inMetres
0.9144
```

At `Quantity`,
use `inYards` to answer the distance in yards:

```
>>> 1000.metres.inYards
1093.613
```

* * *

See also: feet, metres, miles, Quantity

Guides: SI Units

References:
_W_
[1](https://en.wikipedia.org/wiki/Yard)
