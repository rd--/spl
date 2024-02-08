# noneSatisfy

_noneSatisfy(aCollection, aBlock:/1)_

Evaluate _aBlock_ with the elements of _aCollection_.
If _aBlock_ answers true for any element answer false, otherwise answer true.

```
>>> [].noneSatisfy(odd:/1)
true

>>> [1 3 5 7 9].noneSatisfy(even:/1)
true

>>> [1 2 3 4 5].noneSatisfy(odd:/1)
false
```

At Record:

```
>>> (a: 2, b: 3, c: 6).noneSatisfy(odd:/1)
false
```

* * *

See also: allSatisfy, anySatisfy

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NoneTrue.html)

Categories: Predicate
