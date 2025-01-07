# homogeneousTranslationMatrix

- _homogeneousTranslationMatrix(aVector)_

Answer a matrix that represents translation by _aVector_ for homogeneous coordinates.

```
>>> [10 0 0].homogeneousTranslationMatrix
[
	1 0 0 10;
	0 1 0 0;
	0 0 1 0;
	0 0 0 1
]
```

Translate _(10,10,10,1)_ by 10 in the _x_ axis,
and show that translating a _direction_ has no effect:

```
>>> let v = [10 0 0];
>>> let m = v.homogeneousTranslationMatrix;
>>> (
>>> 	m.dot([10 10 10 1]),
>>> 	m.dot([0 0 -1 0])
>>> )
(
	[20 10 10 1],
	[0 0 -1 0]
)
```

For non-homogeneous coordinates translation is equivalent to `+`:

```
>>> [10 0 0] + [10 10 10]
[20 10 10]
```

* * *

See also: dot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TranslationTransform.html),
_W_
[1](https://en.wikipedia.org/wiki/Homogeneous_coordinates)
