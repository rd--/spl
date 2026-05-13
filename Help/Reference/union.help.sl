# union

- _union(c₁, c₂)_
- _union([c₁ c₂ …])_

Answer a collection holding the set theoretic union of the collections _c₁_ and _c₂_.
The unary form answers the union of all _c_.

The binary case at `List`, equality is decided by `=`:

```
>>> [1 2 3].union([2 3 4])
[1 2 3 4]

>>> [1 1 2 2 3 3].union([2 2 3 3 4 4])
[1 2 3 4]

>>> [1 1 2 2 3 3].union([])
[1 2 3]

>>> ['a' 'b' 'c'].union(['b' 'c' 'd'])
['a' 'b' 'c' 'd']
```

The unary case at `List`:

```
>>> [1 2 3; 2 3 4; 3 4 5].union
[1 2 3 4 5]
```

The binary case at `Set`:

```
>>> Set[1 2 3].union([2 3 4])
Set[1 2 3 4]
```

The binary case at `IdentitySet`:

```
>>> IdentitySet[1 2 3].union([2 3 4])
IdentitySet[1 2 3 4]
```

Find divisors that occur in any of 10, 12, and 20:

```
>>> 10.divisors.union(
>>> 	12.divisors.union(
>>> 		20.divisors
>>> 	)
>>> )
[1 2 5 10 3 4 6 12 20]

>>> [10 12 20].divisors.union
[1 2 5 10 3 4 6 12 20]
```

At `Interval`:

```
>>> (1 -- 3).union(3 -- 7)
(1 -- 7)
```

At `Multiset`:

```
>>> let a = ['x' -> 1, 'y' -> 2, 'z' -> 3];
>>> let b = ['x' -> 2, 'y' -> 1];
>>> Multiset(a).union(Multiset(b))
Multiset(['x' -> 3, 'y' -> 3, 'z' -> 3])
```

Note that the answer is not sorted,
in the `List` case the answer has the unique elements of _c₁_ followed by the elements of _c₂_ not already present:

```
>>> [5 3 1].union([1 2 3 4 5])
[5 3 1 2 4]
```

Numbers of the form _(4^k-1)/3_ or _2^k_,
OEIS [A160967](https://oeis.org/A160967):

```
>>> [2 ^ 0:10, (4 ^ 0:6 - 1) / 3].union.sort
[
	   0    1    2    4    5
	   8   16   21   32   64
	  85  128  256  341  512
	1024 1365
]
```

Sums of distinct positive cubes,
OEIS [A003997](https://oeis.org/A003997),
the complement of
OEIS [A001476](https://oeis.org/A001476):

~~~spl svg=A oeis=A003997
let limit = 8;
let s = [0];
1.toDo(limit) { :n |
	s := s.union(s + (n ^ 3))
};
s.sort.select { :n |
	0 < n & {
		n <= (limit ^ 3)
	}
}.discretePlot
~~~

![](Help/Image/union-A.svg)

Where supported `union` is displayed as ∪.

* * *

See also: ++, difference, IdentitySet, intersection, Set, unionBy

Guides: Set Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:union),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Union.html)
[2](https://reference.wolfram.com/language/ref/IntervalUnion.html),
_W_
[1](https://en.wikipedia.org/wiki/Union_(set_theory))

Unicode: U+222A ∪ Union

Categories: Enumerating
