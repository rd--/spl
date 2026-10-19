# deepAllSatisfy

- _deepAllSatisfy(c, f/1)_

Evaluate the block _f_ with the elements of the collection _c_.
If _f_ answers `false` for any element,
answer `false`,
else answer `true`.
Only tests elements until one item answers `false`.

```
>>> [3 3].iota.deepAllSatisfy(isInteger/1)
true
```

* * *

See also: allSatisfy, deepDo, isArray

Guides: Array Functions, Boolean Functions, Predicate Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayQ.html)

Categories: Testing
