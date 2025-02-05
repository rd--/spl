# min

- _min(aCollection)_
- _min(aMagnitude, anotherMagnitude)_

The unary form answers the minimum value in the collection.
The collection must be non-empty and contain compatible Magnitudes.

```
>>> 1:10.min
1

>>> { [].min }.ifError { true }
true
```

The binary form answer the receiver or the argument, whichever has the least magnitude.

```
>>> [4 3 2 3 1 5 7].reduce(min:/2)
1

>>> 2.4.min(1.9)
1.9
```

The binary form allows vector operands:

```
>>> [1 3 5].min([5 3 1])
[1 3 1]

>>> 0.max(1.min([-0.2 -0.1 0.3 0.8 1 1.3]))
[0 0 0.3 0.8 1 1]
```

Smallest `Complex` element:

```
>>> [-2J2 4J1 -1J-3].min
-2J2
```

Smallest element in each matrix column:

```
>>> [2 8 4; 7 3 9].min
[2 3 4]
```

Smallest element in each matrix row:

```
>>> [1.7 1.2 1.5; 1.3 1.6 1.99].collect(min:/1)
[1.2 1.3]
```

* * *

See also: floor, max, minBy

References:
_Apl_
[1](https://aplwiki.com/wiki/Minimum),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:min)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:minimum),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/ltdot#dyadic)
_Mathematica_
[1](https://mathworld.wolfram.com/Minimum.html)
[2](https://reference.wolfram.com/language/ref/Min.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/min.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#min),
_Smalltalk_
5.6.1.7

Categories: Testing
