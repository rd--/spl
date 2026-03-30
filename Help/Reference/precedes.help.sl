# precedes

- _precedes(p, q)_

Answer `true` if _p_ precedes _q_,
ordinarily according to `<` if the arguments are numbers or else `compare` if they are collections,
else `false`.

At `SmallFloat`:

```
>>> 1.precedes(3)
true
```

At `Fraction`:

```
>>> 1/3.precedes(1/2)
true
```

At `Complex`, where it is defined as `<` of `abs`:

```
>>> 1J1.precedes(2J2)
true
```

At `List`:

```
>>> [1 2 3].precedes([2 3 4])
true

>>> [1 2 3 4].precedes([3 4])
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
>>> ['a' 'b' 'c' 'd']
>>> .powerSet
>>> .sortBy(precedes:/2)
>>> .collect(stringJoin:/1)
[
	''
	'a' 'ab' 'abc' 'abcd' 'abd' 'ac' 'acd' 'ad'
	'b' 'bc' 'bcd' 'bd'
	'c' 'cd'
	'd'
]
```

Lattice points sorted first by _x²+y²_ then by _x_ then by _y_,
OEIS [A283307](https://oeis.org/A283307)
and
OEIS [A283308](https://oeis.org/A283308):

~~~spl svg=A
let i = -5:5;
{ :x :y |
	[x.square + y.square, x, y]
}.table(i, i)
.catenate
.sort(precedes:/2)
.columns([2 3])
.pathPlot
~~~

![](Help/Image/precedes-A.svg)

Lattice points sorted first by radial coordinate then by unsigned polar angle,
OEIS [A305575](https://oeis.org/A305575)
and
OEIS [A305576](https://oeis.org/A305576):

~~~spl svg=B
let i = -5:5;
[i, i].tuples
.toPolarCoordinates('Unsigned')
.sort(precedes:/2)
.fromPolarCoordinates
.pathPlot
~~~

![](Help/Image/precedes-B.svg)

Where supported `precedes` is displayed as ≺.

* * *

See also: =, <, <|, >, <=>, compare, lexicographicSort, precedesOrEqualTo, succeeds

Guides: Comparison Functions, List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LexicographicOrder.html)

Unicode: U+227a ≺ Precedes
