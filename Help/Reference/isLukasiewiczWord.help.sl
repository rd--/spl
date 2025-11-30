# isLukasiewiczWord

- _isLukasiewiczWord([y₁ y₂ …], k=0)_

Answer `true` if _y_ is a Łukasiewicz word on the non-negative integers,
if _k=0_,
or on the integers from _-1_ if _k=-1_.

Equivalent words in the two allowed forms:

```
>>> [4 0 0 0].isLukasiewiczWord
true

>>> [3 -1 -1 -1].isLukasiewiczWord(-1)
true
```

A longer word:

```
>>> [
>>> 	5 -1 -1 -1 2 -1 -1 1 -1 -1
>>> 	0 -1 4 -1 -1 -1 3 -1 -1 -1
>>> 	-1
>>> ].isLukasiewiczWord(-1)
true
```

The Łukasiewicz path with content _0004_:

```
>>> [4 0 0 0].isLukasiewiczWord
true
```

The Łukasiewicz paths with content _0013_:

```
>>> [
>>> 	3 1 0 0;
>>> 	3 0 1 0;
>>> 	3 0 0 1;
>>> 	1 3 0 0
>>> ].allSatisfy(isLukasiewiczWord:/1)
true
```

The Łukasiewicz paths with content _0022_:

```

>>> motzkinWords(2, 1)
>>> .allSatisfy(isLukasiewiczWord:/1)
true

>>> motzkinWords(2, 1)
[
	2 1 1 0;
	2 0 1 1;
	1 2 0 1;
	2 1 0 1;
	1 2 1 0;
	1 1 2 0
]
```

The Łukasiewicz path with content _1111_:

```
>>> [1 1 1 1].isLukasiewiczWord(0)
true
```

The Łukasiewicz paths with content _000123_:

```
>>> [
>>> 	3 0 2 1 0 0;
>>> 	2 3 0 1 0 0;
>>> 	2 0 3 1 0 0;
>>> 	3 2 0 1 0 0;
>>> 	3 0 2 0 1 0;
>>> 	3 0 0 2 1 0;
>>> 	2 3 0 0 1 0;
>>> 	2 0 3 0 1 0;
>>> 	3 2 0 0 1 0;
>>> 	3 0 2 0 0 1;
>>> 	3 0 0 2 0 1;
>>> 	2 3 0 0 0 1;
>>> 	2 0 3 0 0 1;
>>> 	3 2 0 0 0 1;
>>> 	1 3 2 0 0 0;
>>> 	3 1 2 0 0 0;
>>> 	3 0 1 2 0 0;
>>> 	1 3 0 2 0 0;
>>> 	3 1 0 2 0 0;
>>> 	3 0 1 0 2 0;
>>> 	3 0 0 1 2 0;
>>> 	1 3 0 0 2 0;
>>> 	3 1 0 0 2 0;
>>> 	2 3 1 0 0 0;
>>> 	1 2 3 0 0 0;
>>> 	2 1 3 0 0 0;
>>> 	2 0 1 3 0 0;
>>> 	1 2 0 3 0 0;
>>> 	2 1 0 3 0 0;
>>> 	3 2 1 0 0 0
>>> ].allSatisfy(isLukasiewiczWord:/1)
true
```

The five Dyck words of order _n=3_:

```
>>> 3.dyckWords([2 0])
>>> .allSatisfy(isLukasiewiczWord:/1)
true

>>> 3.dyckWords([2 0])
[
	2 2 2 0 0 0;
	2 0 2 2 0 0;
	2 2 0 2 0 0;
	2 0 2 0 2 0;
	2 2 0 0 2 0
]
```

Łukasiewicz word for each rooted plane tree,
OEIS [A071153](https://oeis.org/A071153):

```
>>> [
>>> 	;
>>> 	1;
>>> 	2 0;
>>> 	1 1;
>>> 	3 0 0;
>>> 	2 0 1;
>>> 	2 1 0;
>>> 	1 2 0;
>>> 	1 1 1;
>>> 	4 0 0 0;
>>> 	3 0 0 1;
>>> 	3 0 1 0;
>>> 	2 0 2 0;
>>> 	2 0 1 1;
>>> 	3 1 0 0;
>>> 	2 1 0 1;
>>> 	2 2 0 0;
>>> 	1 3 0 0;
>>> 	1 2 0 1;
>>> 	2 1 1 0;
>>> 	1 2 1 0;
>>> 	1 1 2 0;
>>> 	1 1 1 1;
>>> 	5 0 0 0 0;
>>> 	4 0 0 0 1
>>> ].allSatisfy(isLukasiewiczWord:/1)
true
```

Łukasiewicz words for regular binary trees having nine nodes,
also Dyck words on _2,0_:

```
>>> [
>>> 	2 0 2 0 2 0 2 0;
>>> 	2 0 2 0 2 2 0 0;
>>> 	2 0 2 2 0 0 2 0;
>>> 	2 0 2 2 0 2 0 0;
>>> 	2 0 2 2 2 0 0 0;
>>> 	2 2 0 0 2 0 2 0;
>>> 	2 2 0 0 2 2 0 0;
>>> 	2 2 0 2 0 0 2 0;
>>> 	2 2 0 2 0 2 0 0;
>>> 	2 2 0 2 2 0 0 0;
>>> 	2 2 2 0 0 0 2 0;
>>> 	2 2 2 0 0 2 0 0;
>>> 	2 2 2 0 2 0 0 0;
>>> 	2 2 2 2 0 0 0 0
>>> ].allSatisfy { :y |
>>> 	y.isLukasiewiczWord(0) & {
>>> 		y.isDyckWord([2 0])
>>> 	}
>>> }
true
```

A longer Łukasiewicz word of length eighteen:

```
>>> [
>>> 	5 -1 -1 0 0 -1 2 -1 -1 -1
>>> 	-1 2 0 2 -1 -1 -1 -1
>>> ].isLukasiewiczWord(-1)
```

_Note_:
In some contexts the words are given with a trailing _0_ (or _-1_).

* * *

See also: dyckWords, isDyckWord, motzkinWords

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MotzkinNumber.html),
_OEIS_
[1](https://oeis.org/A071153)

Further Reading: Balakirsky 2002, Lapey 2022

Categories: Testing
