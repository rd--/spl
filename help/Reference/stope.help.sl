# stope

_stope(x, p, y)_

Answer _x * (x + p) * (x + (2 * p)) * ..._ for _y_ terms.

```
>>> 5.stope(1, 3)
210
```

Calculate the number of permutations of _x_ things taken _y_ at a time:

```
>>> 5.stope(-1, 3)
60
```

Calculate the _rising Pochhammer symbol (x)y_ as used in the hypergeometric function:

```
>>> 5.1.stope(1, 3)
220.881
```

* * *

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/hat#stope)

Categories: Math, Permutations
