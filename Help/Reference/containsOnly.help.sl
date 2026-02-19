# containsOnly

- _containsOnly(x, y)_

Answers `true` if _x_ contains only elements that appear in _y_.

The first list contains only elements in the second list:

```
>>> [2 1 1].containsOnly([1 2 3])
true
```

At `Record`:

```
>>> (a: 1, b: 2).containsOnly([1 2 3])
true
```

Numbers _k_ such that _k^2_ contains only digits _1,3,4_,
OEIS [A053890](https://oeis.org/A053890):

```
>>> 1:10000.select { :n |
>>> 	(n ^ 2).integerDigits
>>> 	.containsOnly([1 3 4])
>>> }
[1 2 12 21 38 1188]
```

* * *

See also: allSatisfy, includes

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContainsOnly.html)
