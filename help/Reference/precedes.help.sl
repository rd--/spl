# precedes

- _precedes(p, q)_

Answer `true` if _p_ precedes _q_, according to `compare`, else `false`.

At `List`:

```
>>> [1 2 3].precedes([2 3 4])
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
>>> let l = ['a' 'b' 'c' 'd'].powerSet;
>>> l.sortBy(precedes:/2).collect(stringJoin:/1)
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

See also: =, <, >, <=>, compare, precedesOrEqualTo

Unicode: U+227a ≺ Precedes
