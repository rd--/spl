# atop

- _atop(f/2, g/1)_

Answer a `Block` that applies the unary block _g_ to post-processes the result of the binary block _f_.

The negation of the pointwise maximum of two lists:

```
>>> max/2.atop(negate/1) . (
>>> 	[3 1 2], [4 6 5]
>>> )
[-4 -6 -5]

>>> [3 1 2].max([4 6 5]).-
[-4 -6 -5]
```

The maximum of the pointwise difference of two lists:

```
>>> -.atop(max/1) . ([3 1 2], [4 6 5])
-1

>>> ([3 1 2] - [4 6 5]).max
-1
```

* * *

See also: over

References:
_Apl_
[1](https://aplwiki.com/wiki/Atop_(operator)),
_J_
[1](https://www.jsoftware.com/help/dictionary/d620.htm)
