# sort (sort!)

- _sort([x₁ x₂ …], f/2)_
- _sort!([x₁ x₂ …], f/2, g/1)_

There are in-place and copying forms of reverse.
The in-place form sorts the sequence _x_ in-place,
using the boolean sort block _f/2_,
and answers _x_.
The copying form first shallow copied the input and then sorts it in-place,
answering the new sorted sequence.
If the sort block is omitted or is `nil`, sort by `precedes`.

The sort block _f_ should take two arguments,
and answer `true` if the first element should preceed the second one.

The unary and binary in-place forms of `sort`:

```
>>> let x = [1 3 2 4 5];
>>> let y = x.sort!;
>>> (x, x == y)
([1 .. 5], true)

>>> let x = [1 3 2 4 5];
>>> let y = x.sort!(>);
>>> (x, x == y)
([5, 4 .. 1], true)
```

With literal block:

```
>>> [1 3 2 4 5].sort! { :i :j |
>>> 	i > j
>>> }
[5, 4 .. 1]
```

In the copying form,
the answer is a new `List`:

```
>>> let x = [3 2 1];
>>> let y = x.sort;
>>> (x, x !== y, y)
([3 2 1], true, [1 2 3])
```

At `List` of `String`:

```
>>> ['d' 'b' 'c' 'a'].sort!(<)
['a' 'b' 'c' 'd']

>>> ['cat' 'fish' 'catfish' 'Cat'].sort!(<)
['cat' 'Cat' 'catfish' 'fish']
```

At `Range`:

```
>>> let x = Range(9, 1, -2);
>>> (x == x.sort!, x)
(true, Range(1, 9, 2))
```

Sort subsets lexicographically:

```
>>> ['a' 'b' 'c' 'd']
>>> .subsets(true.constant)
>>> .sort!(precedes/2)
[
	[],
	['a'],
	['a', 'b'],
	['a', 'b', 'c'],
	['a', 'b', 'c', 'd'],
	['a', 'b', 'd'],
	['a', 'c'],
	['a', 'c', 'd'],
	['a', 'd'],
	['b'],
	['b', 'c'],
	['b', 'c', 'd'],
	['b', 'd'],
	['c'],
	['c', 'd'],
	['d']
]
```

Sort integers by magnitude:

```
>>> [-11 10 2 1 -4].sort!(<)
[-11 -4 1 2 10]
```

Sort by absolute value:

```
>>> [-11 10 2 1 -4].sort!(<=, abs/1)
[1 2 -4 10 -11]
```

Sort strings by dictionary order:

```
>>> ['aa' 'abb' 'ba' 'b' 'aaa'].sort!(<)
['aa', 'aaa', 'abb', 'b', 'ba']
```

Use the ternary form to sort a list of strings by length:

```
>>> ['aa' 'abb' 'ba' 'b' 'aaa']
>>> .sort!(<=, size/1)
['b' 'ba' 'aa' 'aaa' 'abb']
```

Sort the characters of a string:

```
>>> 'eCaBdAbc'
>>> .characters
>>> .sort!(<)
>>> .stringJoin
'aAbBcCde'

>>> 'eCaBdAbc'
>>> .sortCharacters
'aAbBcCde'

>>> 'eCaBdAbc'
>>> .codePoints
>>> .sort
>>> .fromCodePoints
'ABCabcde'

>>> 'eCaBdAbc'
>>> .sortCodePoints
'ABCabcde'

>>> 'eCaBdAbc'
>>> .toCharacterCode('Ascii')
>>> .sort
>>> .fromCharacterCode('Ascii')
'ABCabcde'

>>> 'eCaBdAbc'
>>> .sortCharacterCode('Ascii')
'ABCabcde'
```

Sort vectors by the Euclidean norm:

```
>>> Sfc32(367814)
>>> .randomInteger([-5 5], [10 3])
>>> .sort!(<=, norm/1)
[
	 3  1 -1;
	 2 -4  0;
	 0 -4 -2;
	-3  0  4;
	 0 -5 -2;
	-5 -3  0;
	-3 -4 -4;
	-3 -4 -4;
	-3  5  4;
	-3  5  5
]
```

Sort complex numbers by real part:

```
>>> [2J-3 0J1 3J-1 1J1].sort!(<=, real/1)
[0J1 1J1 2J-3 3J-1]
```

Relation to `ordering`:

```
>>> [9 7 6 10 3 0 8 3 3 5].sort
[0 3 3 3 5 6 7 8 9 10]

>>> let x = [9 7 6 10 3 0 8 3 3 5];
>>> x.atAll(x.ordering)
[0 3 3 3 5 6 7 8 9 10]
```

With explicit `nil`:

```
>>> [3 1 5 3 7 5 9].sort!(nil)
[1 3 3 5 5 7 9]
```

Show comparisons made in doing a sort:

~~~spl svg=A
let n = 200;
let m = 50;
let r = [];
0:n.collect { :x |
	(x.sin * m).round
}.sort! { :a :b |
	r.add!(a);
	a > b
};
r.downsample(4).scatterPlot
~~~

![](Help/Image/sort-A.svg)

* * *

See also: isSorted, lexicographicSort, mergeSort, ordering, quickSort, sortBy, sortByOn, sortOn

Guides: InPlace Syntax, Sort Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Sort.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#sorted)

Categories: Sorting
