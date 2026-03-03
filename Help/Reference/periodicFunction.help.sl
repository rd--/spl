# periodicFunction

- _periodicFunction([x₁ x₂ …], d=1)_

Answer a `Block` of one argument,
an index,
that periodically indexes the sequence _x_.
_d_ specifies the reference index, and is ordinarily one.

With _d=1_:

```
>>> 1:9.collect(
>>> 	[-3 -3 -2].periodicFunction
>>> )
[-3 -3 -2 -3 -3 -2 -3 -3 -2]

>>> [-3 -3 -2].repeat(3)
[-3 -3 -2 -3 -3 -2 -3 -3 -2]
```

With _d=0_:

```
>>> 0:8.collect(
>>> 	[-3 -3 -2].periodicFunction(0)
>>> )
[-3 -3 -2 -3 -3 -2 -3 -3 -2]
```

* * *

See also: repeat

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PeriodicFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Periodic_function)
