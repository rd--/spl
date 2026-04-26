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
>>> 1760.yards.miles
1

>>> 1.miles.yards
1760
```

One yard is defined as 0.9144 metres:

```
>>> 1.yards.metres
0.9144
```

At `Quantity`,
answer the distance _x_ in yards.

```
>>> 1000.metres.yards
1093.613
```

* * *

See also: feet, metres, miles, Quantity

Guides: SI Units

References:
_W_
[1](https://en.wikipedia.org/wiki/Yard)
