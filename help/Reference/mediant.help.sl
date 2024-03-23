# mediant

- _mediant(aFraction, anotherFraction)_
- _mediant(aCollection)_

For fractions _a/c_ and _b/d_ answer _a+b/c+d_.

```
>>> 1/2.mediant(3/4)
2/3
```

In the unary case answers the sum of the numerators divided by the sum of the denominators:

```
>>> [1/2 3/4].mediant
2/3

>>> [3/2 5/4; 3/2 4/3; 5/4 6/5; 9/8 10/9; 9/8 19/17; 19/17 10/9].collect(mediant:/1)
[4/3 7/5 11/9 19/17 28/25 29/26]
```

* * *

See also:
_Mathematica_
[1](https://mathworld.wolfram.com/Mediant.html),
_Xenharmonic_
[1](https://en.xen.wiki/w/Mediant),
_W_
[1](https://en.wikipedia.org/wiki/Mediant_(mathematics))
