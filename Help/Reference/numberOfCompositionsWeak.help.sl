# numberOfCompositionsWeak

- _numberOfCompositions(n, k)_

The number of compositions of a number _n_ of length _k_ (where 0 is allowed).

```
>>> 1:12.collect { :n | n.numberOfCompositionsWeak(5) }
[5 15 35 70 126 210 330 495 715 1001 1365 1820]

>>> 6:9.collect { :k | 1:5.collect { :n | n.numberOfCompositionsWeak(k) } }
[6 21 56 126 252; 7 28 84 210 462; 8 36 120 330 792; 9 45 165 495 1287]
```

* * *

See also: integerCompositionsWeak, numberOfCompositions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Composition.html)

Categories: Combinatorics
