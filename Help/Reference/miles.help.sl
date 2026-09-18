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
>>> 1.miles.inYards
1760

>>> 1760.yards.inMiles
1
```

One mile is defined as 5280 feet:

```
>>> 1.miles.inFeet
5280

>>> 5280.feet.inMiles
1
```

One mile is defined as 1609.344 metres:

```
>>> 1.miles.inMetres
1609.344

>>> 1609.344.metres.inMiles
1
```

At `Quantity`,
use `inMiles` to answer the distance in miles:

```
>>> 1000.metres.inMiles
0.62137
```

* * *

See also: metres, Quantity

Guides: SI Units

References:
_W_
[1](https://en.wikipedia.org/wiki/Mile)
