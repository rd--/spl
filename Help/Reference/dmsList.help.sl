# dmsList

- _dmsList(θ)_
- _dmsList([d, m, s])_

Answer a `List` telling an angle θ,
specified in decimal degrees,
as _(degree, minute, second)_.

Convert an angle given in decimal degrees to _(degree, minute, second)_:

```
>>> 20.5.dmsList
[20 30 0]

>>> 51.00964.dmsList
[51 0 34.704]
```

Canonicalize a Dms list:

```
>>> [11 -30 5].dmsList
[10 30 5]
```

Dms list form of an angle given in decimal degrees:

```
>>> 23.1972.dmsList
[23 11 49.92]
```

A negative angle:

```
>>> -23.1972.dmsList
[-23 -11 -49.92]
```

Canonicalize to a unique form:

```
>>> [23 75 1234.92].dmsList
[24 35 34.92]
```

At `Quantity`:

```
>>> 23.1972.degrees.dmsList
[23 11 49.92]
```

* * *

See also: degree, degrees, fromDms, numberDecompose

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DMSList.html)

Categories: Converting
