# isImmediate

- _isImmediate(anObject)_

Answer if _anObject_ will compare _==_ when it compares _=_.

Immediate objects are suitable for inclusion in _Set_ and _Bag_.

Nil, Boolean, SmallFloat, LargeInteger and String values are all immediate.

```
>>> [nil, true, false, 3.141, 23n, 'txt'].collect(isImmediate:/1)
[true true true true true true]
```

Character, Complex, Fraction, List and Tuple values are all non-immediate:

```
['x'.asCharacter, 2j3, 2r3, [2, 3], (2, 3)].collect(isImmediate:/1)
[false false false false false]
```

* * *

See also: ==, ===, Bag, isJson, isLiteral, Set
