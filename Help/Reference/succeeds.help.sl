# succeeds

- _succeeds(p, q)_

Answer `true` if _p_ succeeds _q_,
ordinarily according to `>` if the arguments are numbers or else `compare` if they are collections,
else `false`.

At `SmallFloat`:

```
>>> 3.succeeds(1)
true
```

At `Fraction`:

```
>>> 1/2.succeeds(1/3)
true
```

At `Complex`, where it is defined as `>` of `abs`:

```
>>> 2J2.succeeds(1J1)
true
```

At `List`:

```
>>> [2 3 4].succeeds([1 2 3])
true

>>> [3 4].succeeds([1 2 3 4])
true
```

Not all items need succeed their corresponding item:

```
>>> [1 2 1].succeeds([1 1 2])
true
```

C.f. `>`:

```
>>> [2 3 4] > [1 2 3]
[true true true]
```

At `String`:

```
>>> 'bcd'.succeeds('abc')
true

>>> '-2'.succeeds('-0')
true
```

Sort power-set reverse lexicographically:

```
>>> ['a' 'b' 'c' 'd']
>>> .powerSet
>>> .sortBy(succeeds:/2)
>>> .collect(stringJoin:/1)
[
	'd'
	'cd' 'c'
	'bd' 'bcd' 'bc' 'b'
	'ad' 'acd' 'ac' 'abd' 'abcd' 'abc' 'ab' 'a'
	''
]
```

Where supported `succeeds` is displayed as ≻.

* * *

See also: =, <, <|, >, <=>, compare, lexicographicSort, succeedsOrEqualTo, succeeds

Guides: Comparison Functions, List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LexicographicOrder.html)

Unicode: U+227B ≻ Succeeds
