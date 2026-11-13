# Set

- _Set([x₁ x₂ …], f/2)_

`Set` is both a collection trait,
holding behaviours for collection types that do not contain duplicate items,
and constructor for set types.
At a collection,
answers a set of the elements of the collection _c_,
if _f_ is `=` answer an `SortedSet`,
if _f_ is `==` answer an `IdentitySet`.
If _f_ is elided it is taken to be `=`.

At `List`:

```
>>> Set([1 1 2 1 2 3], ==)
IdentitySet[1, 2, 3]

>>> Set([1 1 2 1 2 3], =)
SortedSet[1 2 3]
```

At `Multiset`:

```
>>> Multiset([1 1 2 1 2 3], ==)
>>> .Set
IdentitySet[1 2 3]

>>> Multiset([1 1 2 1 2 3], =)
>>> .Set
SortedSet[1 2 3]
```

At `String`:

```
>>> Set'abracadabra'
IdentitySet['a' 'b' 'r' 'c' 'd']
```

At a list of lists:

```
>>> Set([1 1; 1 1; 1 2], =)
SortedSet[1 1; 1 2]
```

The empty set constructor,
also a `Set` from an empty list:

```
>>> IdentitySet().size
0

>>> Set([], ==).size
0
```

Set predicates:

```
>>> Set([], =).isSet
true

>>> Set([], =).isSortedSet
true

>>> Set([], ==).isIdentitySet
true
```

Sets are collections,
and have the expected mathematical behavior in relation to scalars:

```
>>> Set([1 2 3], ==) * 5
IdentitySet[5 10 15]
```

Note that `Set` may be significantly less efficient that `IdentitySet`,
however `==` has some subtle behaviours:

```
>>> 1/2 == 1/2
false

>>> 1.0 == 1L
false

>>> Set([1.0 1L], =)
>>> .List
[1.0]

>>> IdentitySet[1 1L]
>>> .List
[1.0 1L]

>>> 1J1 == 1J1
false

>>> 1J1 = 1J1
true

>>> Set([1J1 1J1], =)
>>> .List
[1J1]

>>> {
>>> 	IdentitySet[1J1 1J1]
>>> }.hasError
true
```

The halving Recaman walk,
OEIS [A400939](https://oeis.org/A400939):

~~~spl svg=A oeis=A400939
let s = Set([1], ==);
let p = 1;
let a = [1];
2:135.do { :i |
	(
		p.isEven & {
			s.includes(p // 2).not
		}
	).if {
		p := p // 2
	} {
		p := p + i
	};
	s.include!(p);
	a.add!(p)
};
a.discretePlot
~~~

![](Help/Image/Set-A.svg)

`Set` is a `Trait`:

```
>>> system
>>> .traitDictionary['@Set']
>>> .isTrait
true
```

Types implementing the `Set` trait:

```
>>> system
>>> .traitTypes('@Set')
>>> .sort!
[
	'IdentitySet'
	'SortedSet'
	'UnsortedSet'
]
```

* * *

See also: IdentitySet, SortedSet, UnsortedSet, nub, unique

Guides: Set Functions, Set Syntax

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Set.html),
_Smalltalk_
5.7.1.7,
_W_
[1](https://en.wikipedia.org/wiki/Set_(mathematics))
