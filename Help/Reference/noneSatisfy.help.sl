# noneSatisfy

- _noneSatisfy(c, f:/1)_

Evaluate the block _f_ with the elements of the collection _c_.
If _f_ answers `true` for any element answer `false`, otherwise answer `true`.

```
>>> [].noneSatisfy(isOdd:/1)
true

>>> [1 3 5 7 9].noneSatisfy(isEven:/1)
true

>>> [1 2 3 4 5].noneSatisfy(isOdd:/1)
false
```

At `Record`:

```
>>> (a: 2, b: 3, c: 6).noneSatisfy(isOdd:/1)
false
```

* * *

See also: allSatisfy, anySatisfy

Guides: Boolean Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NoneTrue.html)
[2](https://reference.wolfram.com/language/ref/Nor.html)

Categories: Predicate
