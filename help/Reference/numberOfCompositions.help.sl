# numberOfCompositions

- _numberOfCompositions(n, k)_

The number of compositions of a number _n_ of length _k_ (where 0 is allowed).

```
>>> 9.integerCompositions(5).size
70

>>> 9.numberOfCompositions(5)
70

>>> 5:12.collect { :n | n.numberOfCompositions(5) }
[1 5 15 35 70 126 210 330]

>>> 6:9.collect { :k | (k .. 11).collect { :n | n.numberOfCompositions(k) } }
[1 6 21 56 126 252; 1 7 28 84 210; 1 8 36 120; 1 9 45]
```

* * *

See also: integerCompositions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Composition.html)

Categories: Combinatorics
