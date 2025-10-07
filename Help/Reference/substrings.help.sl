# substrings

- _substrings([x₁ x₂ …], f:/1)_

Answer a `List` of all possible contiguous subsequences (substrings) of the sequence _x_,
for which _f_ answers `true`.
including the empty sequence.

The seven substrings of _123_:

```
>>> 1:3.substrings
[; 1; 2; 3; 1 2; 2 3; 1 2 3]
```

All possible substrings of _1234_ containing up to two elements:

```
>>> 1:4.substrings { :each |
>>> 	each.size <= 2
>>> }
[; 1; 2; 3; 4; 1 2; 2 3; 3 4]
```

Substrings of _1234_ containing exactly two elements:

```
>>> 1:4.substrings { :each |
>>> 	each.size = 2
>>> }
1:4.partition(2, 1)
```

All substrings with even length:

```
>>> 1:5.substrings { :each |
>>> 	each.size.isEven
>>> }
[; 1 2; 2 3; 3 4; 4 5; 1 2 3 4; 2 3 4 5]
```

The 181st substring:

```
>>> 1:20.substrings[181]
[6 .. 18]
```

Obtain all substrings common to two lists:

```
>>> let f = { :p :q :w:/1 |
>>> 	p.substrings(w:/1).intersection(
>>> 		q.substrings(w:/1)
>>> 	)
>>> };
>>> [1 2 3 5 4].f([2 3 5 1 4], { :each |
>>> 	each.size = 2
>>> })
[2 3; 3 5]
```

C.f. `substringsInCommon`:

```
>>> let p = [1 2 3 5 4];
>>> let q = [2 3 5 1 4];
>>> let k = 2;
>>> p.substringsInCommon(q, k)
[2 3; 3 5]
```

Compare to `longestCommonSubsequence`:

```
>>> [1 2 3 5 4]
>>> .longestCommonSubsequence(
>>> 	[2 3 5 1 4]
>>> )
[2 3 5 4]
```

Substrings preserves the order of the input:

```
>>> (3 .. 1).substrings
[; 3; 2; 1; 3 2; 2 1; 3 2 1]
```

Different occurrences of the same element are treated as distinct:

```
>>> [1 2 2 2].substrings
[
	;
	1; 2; 2; 2;
	1 2; 2 2; 2 2;
	1 2 2; 2 2 2;
	1 2 2 2
]
```

Construct a 3×3 Hilbert matrix:

```
>>> (1 / 1:5).substrings { :each |
>>> 	each.size = 3
>>> }
[
	1 1/2 1/3;
	1/2 1/3 1/4;
	1/3 1/4 1/5
]

>>> (1 / 1:5).partition(3, 1)
[
	1 1/2 1/3;
	1/2 1/3 1/4;
	1/3 1/4 1/5
]
```

Substrings generates only one list of length 0:

```
>>> [1 1 2].substrings
[; 1; 1; 2; 1 1; 1 2; 1 1 2]
```

This follows the behavior of `powerSet`:

```
>>> [1 1 2].powerSet
[; 1; 1; 1 1; 2; 1 2; 1 2; 1 1 2]
```

_123121321_ is a three-superpermutation,
since it contains as substrings each of the possible permutations of _123_:

```
>>> let l = [1 2 3 1 2 1 3 2 1];
>>> let s = l.substrings;
>>> [1 2 3].permutations
>>> .allSatisfy { :each |
>>> 	s.includes(each)
>>> }
true
```

Likewise _123412314231243121342132413214321_ is a four-superpermutation:

```
>>> let l = [
>>> 	1 2 3 4 1 2 3 1 4 2
>>> 	3 1 2 4 3 1 2 1 3 4
>>> 	2 1 3 2 4 1 3 2 1 4
>>> 	3 2 1
>>> ];
>>> let s = l.substrings;
>>> [1 2 3 4].permutations
>>> .allSatisfy { :each |
>>> 	s.includes(each)
>>> }
true
```

At `String`:

```
>>> 'abcd'.substrings
[
	''
	'a' 'b' 'c' 'd'
	'ab' 'bc' 'cd'
	'abc' 'bcd'
	'abcd'
]
```

* * *

See also: partition, powerSet, longestCommonSubsequence, subsequences, subsets, tuples

Guides: Sequence Alignment Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Subsequences.html),
_W_
[1](https://en.wikipedia.org/wiki/Substring)

Categories: Enumerating, Math
