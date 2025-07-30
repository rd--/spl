# isImmediate

- _isImmediate(x)_

Answer if the object _x_ is _immediate_,
one criteria for which is that an instance will compare `==` when it compares `=`.

Immediate objects are suitable for inclusion in `IdentitySet` and `IdentityBag`,
as for use as keys in `Map` (the identity dictionary).

`Nil`, `Boolean`, `SmallFloat`, `String` and `Block` values are all immediate.

```
>>> [
>>> 	nil, true, false, 3.141, 'txt', {}
>>> ].collect(isImmediate:/1)
[true true true true true true]
```

`LargeInteger`, `Character`, `Complex`, `Fraction`, `List`, `Record` and `Tuple` values are all non-immediate:

```
>>> [
>>> 	23L,
>>> 	'x'.asCharacter,
>>> 	2J3,
>>> 	2/3,
>>> 	[2, 3],
>>> 	(x: 2, y: 3),
>>> 	(2, 3)
>>> ].collect(isImmediate:/1)
[false false false false false false false]
```

Note however that both `Character` and `Symbol` values are cached,
so that they also might be considered immediate:

```
>>> 'x'.asCharacter == 'x'.asCharacter
true

>>> 'x'.Symbol == 'x'.Symbol
true
```

_Rationale_:
`LargeInteger` is not considered immediate because of the subtle behaviour regarding `=` and `==` with `SmallFloat`:

```
>>> 1 == 1L
false

>>> 1 = 1L & { 1L = 1L & { 1 = 1 } }
true

>>> 1L == 1L & { 1 == 1 }
true
```

* * *

See also: =, ==, IdentityBag, isJson, isLiteral, Map, IdentitySet

Categories: Testing
