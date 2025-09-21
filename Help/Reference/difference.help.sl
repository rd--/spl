# difference

- _difference(c₁, c₂)_

Answer a value that is the set theoretic difference of the two collections _c₁_ and _c₂_.
This is also called the relative complement.

At `Range`:

```
>>> 1:4.difference(2:5)
[1]
```

This function is also called `complement`:

```
>>> 1:4.complement(2:5)
[1]
```

`difference` is not symmetrical:

```
>>> let a = [1 2 3];
>>> let b = [2 3 4];
>>> (a.difference(b), b.difference(a))
([1], [4])

>>> let a = [1 2 3];
>>> let b = [2 3 4];
>>> (
>>> 	a.symmetricDifference(b),
>>> 	b.symmetricDifference(a)
>>> )
([1 4], [4 1])
```

Find which elements in the first list are not in any of the subsequent lists:

```
>>> ['a' 'b' 'c' 'd' 'e'; 'a' 'c'; 'd']
>>> .reduce(difference:/2)
['b' 'e']
```

Find divisors of 20 that are not also divisors of 12:

```
>>> 20.divisors.difference(12.divisors)
[5 10 20]
```

Find which triples of digits do not occur in the binary decomposition of 12345:

```
>>> [0 1].tuples(3).difference(
>>> 	12345.integerDigits(2)
>>> 	.partition(3, 1)
>>> )
[0 1 0; 1 0 1]
```

The answer is not sorted and may contain repeated elements:

```
>>> 'bedabcd'.difference('bc')
'edad'
```

Where supported, `difference` is displayed as ∖.

* * *

See also: differenceAll, intersection, symmetricDifference, union

Guides: Set Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:-92--92-),
_Mathematica_
[1](https://mathworld.wolfram.com/SetDifference.html)
[2](https://reference.wolfram.com/language/ref/Complement.html),
_W_
[1](https://en.wikipedia.org/wiki/Complement_(set_theory))

Unicode: U+2216 ∖ Set Minus

Categories: Set, Logic
