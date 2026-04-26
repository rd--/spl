# miles

- _miles(x)_

At `Number`,
answer the `Quantity` _x_ miles.
The usual abbreviation is _mi_,
since _m_ is metres and _ml_ is millilitre.

```
>>> 2.miles
Quantity(3218.688, 'metres')
```

One mile is defined as 1760 yards:

```
>>> 1.miles.yards
1760

>>> 1760.yards.miles
1
```

One mile is defined as 5280 feet:

```
>>> 1.miles.feet
5280

>>> 5280.feet.miles
1
```

One mile is defined as 1609.344 metres:

```
>>> 1.miles.metres
1609.344

>>> 1609.344.metres.miles
1
```

At `Quantity`,
answer the distance _x_ in miles.

```
>>> 1000.metres.miles
0.62137
```

* * *

See also: metres, Quantity

Guides: SI Units

References:
_W_
[1](https://en.wikipedia.org/wiki/Mile)
