# dividedDifferences

- _dividedDifferences(m)_

Implement the divided differences algorithm which,
given a matrix _m_ of _(x,y)_ coordinates,
calculates the coefficients of the interpolation polynomial of these points in the Newton form.

```
>>> let m = 0:4.collect { :i |
>>> 	[i / 10, (i / 10).exp]
>>> };
>>> m.dividedDifferences.collect(first:/1)
[1 1.05171 0.55305 0.19388 0.05098]
```

* * *

See also: nevillesAlgorithm

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DividedDifference.html),
_W_
[1](https://en.wikipedia.org/wiki/Divided_differences)
