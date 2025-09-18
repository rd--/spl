# precedes

- _precedes(p, q)_

Answer `true` if _p_ precedes _q_,
ordinarily according to `<` if the arguments are numbers or else `compare` if they are collections,
else `false`.

At `SmallFloat`:

```
>>> 1.precedes(3)
true
```

At `Fraction`:

```
>>> 1/3.precedes(1/2)
true
```

At `Complex`, where it is defined as `<` of `abs`:

```
>>> 1J1.precedes(2J2)
true
```

At `List`:

```
>>> [1 2 3].precedes([2 3 4])
true

>>> [1 2 3 4].precedes([3 4])
true
```

Not all items need precede their corresponding item:

```
>>> [1 1 2].precedes([1 2 1])
true
```

C.f. `<`:

```
>>> [1 2 3] < [2 3 4]
[true true true]
```

At `String`:

```
>>> 'abc'.precedes('bcd')
true

>>> '-0'.precedes('-2')
true
```

Sort power-set lexicographically:

```
>>> ['a' 'b' 'c' 'd']
>>> .powerSet
>>> .sortBy(precedes:/2)
>>> .collect(stringJoin:/1)
[
	''
	'a' 'ab' 'abc' 'abcd' 'abd' 'ac' 'acd' 'ad'
	'b' 'bc' 'bcd' 'bd'
	'c' 'cd'
	'd'
]
```

Where supported `precedes` is displayed as ≺.

* * *

See also: =, <, <|, >, <=>, compare, lexicographicSort, precedesOrEqualTo, succeeds

Guides: Comparison Functions, List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LexicographicOrder.html)

Unicode: U+227a ≺ Precedes
