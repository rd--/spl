# atop

- _atop(aBlock:/2, anotherBlock:/1)_

Answer a Block that applies _anotherBlock_ to post-processes the result of _aBlock_.

The negation of the pointwise maximum of two lists:

```
>>> max:/2.atop(negate:/1) . (
>>> 	[3 1 2], [4 6 5]
>>> )
[-4 -6 -5]

>>> [3 1 2].max([4 6 5]).-
[-4 -6 -5]
```

The maximum of the pointwise difference of two lists:

```
>>> -.atop(max:/1) . ([3 1 2], [4 6 5])
-1

>>> ([3 1 2] - [4 6 5]).max
-1
```

* * *

See also: over

References:
_Apl_
[1](https://aplwiki.com/wiki/Atop_(operator))
