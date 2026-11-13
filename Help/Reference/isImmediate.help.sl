# isImmediate

- _isImmediate(x)_

Answer if the object _x_ is _immediate_,
one criteria for which is that an instance will compare `==` when it compares `=`.

Immediate objects are suitable for inclusion in `Set` and `Multiset` of `==`,
and for use as keys in `Map` (the identity dictionary).

`Nil`, `Boolean`, `Integer`, `Float`, `String` and `Block` values are all immediate.

```
>>> [
>>> 	nil, true, false, 23L, 3.141, 'txt', {}
>>> ].collect(isImmediate/1)
[true true true true true true true]
```

`Character`, `Complex`, `Fraction`, `List`, `Record` and `Tuple` values are all non-immediate:

```
>>> [
>>> 	'x'.Character,
>>> 	2J3,
>>> 	2/3,
>>> 	[2, 3],
>>> 	(x: 2, y: 3),
>>> 	(2, 3)
>>> ].collect(isImmediate/1)
[false false false false false false]
```

Note however that both `Character` and `Symbol` values are cached,
so that they also might be considered immediate:

```
>>> 'x'.Character == 'x'.Character
true

>>> 'x'.Symbol == 'x'.Symbol
true
```

_Note_:
While both `Float` and `Integer` are considered immediate,
there is subtle behaviour regarding `=` and `==`:

```
>>> (1 == 1L, 1L == 1)
(false, false)

>>> (1 = 1L, 1L = 1)
(true, true)

>>> (1L = 1L, 1 = 1)
(true, true)

>>> (1L == 1L, 1 == 1)
(true, true)
```

* * *

See also: IdentitySet, Map, Multiset, =, ==, isJson, isLiteral

Categories: Testing
