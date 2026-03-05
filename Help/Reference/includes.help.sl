# includes

- _includes(c, x)_

Answer whether the collection _c_ contains the object _x_ as a member.

Is five an element of a `List`:

```
>>> [1 3 5 7 9].includes(5)
true
```

At `Range`:

```
>>> 1:5.includes(9)
false
```

At `Interval`:

```
>>> (1 -- 5).includes(1.pi)
true
```

Test whether one interval lies within another:

```
>>> (2 -- 5).includes(3 -- 4)
true

>>> (2 -- 5).includes(4 -- 6)
false
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).includes(3)
true
```

At `Dictionary`:

```
>>> [|1L -> 'A', 2L -> 'B'|].includes('A')
true
```

At `String`, answer `true` if the string includes a particular character:

```
>>> 'String'.includes('i')
true

>>> 'String'.includes('s')
false
```

It is an `error` to search for a substring, see `includesSubstring`:

```
>>> {
>>> 	'String'.includes('tri')
>>> }.hasError
true

>>> 'String'.includesSubstring('tri')
true
```

Map over matrix:

```
>>> includes:/2.map(
>>> 	1:9.reshape([3 3]),
>>> 	[3 6 9]
>>> )
[true true true]

>>> includes:/2.table(
>>> 	1:9.reshape([3 3]),
>>> 	[3 6 9]
>>> )
[
	true false false;
	false true false;
	false false true
]
```

Numbers congruent to one or five modulo six,
OEIS [A007310](https://oeis.org/A007310):

```
>>> 1:45.select { :n |
>>> 	[1 5].includes(n % 6)
>>> }
[1 5 7 11 13 17 19 23 25 29 31 35 37 41 43]

>>> 1:45.select { :n |
>>> 	(4 * n).eulerPhi
>>> 	=
>>> 	(3 * n).eulerPhi
>>> }
[1 5 7 11 13 17 19 23 25 29 31 35 37 41 43]

>>> 1:15.collect { :n |
>>> 	2 * floor(3 * n / 2) - 1
>>> }
[1 5 7 11 13 17 19 23 25 29 31 35 37 41 43]
```

Numbers congruent to three or five modulo six,
OEIS [A047270](https://oeis.org/A047270):

```
>>> 1:45.select { :n |
>>> 	[3 5].includes(n % 6)
>>> }
[3 5 9 11 15 17 21 23 27 29 33 35 39 41 45]
```

Where supported `includes` is displayed as ∋.

* * *

See also: anySatisfy, includesAll, includesBy

Guides: Collection Functions, Dictionary Functions, List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Membership),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MemberQ.html)
[2](https://reference.wolfram.com/language/ref/IntervalMemberQ.html),
_Smalltalk_
5.7.1.15

Unicode: U+220B ∋ Contains as Member

Categories: Testing
