# ceiling

- _ceiling(x)_

Answer the integer nearest _x_ toward infinity.

At integers:

```
>>> 1.ceiling
1

>>> -2.ceiling
-2
```

At real numbers:

```
>>> 1.1.ceiling
2

>>> -2.1.ceiling
-2

>>> (3 / 2).ceiling
2

>>> (-3 / 2).ceiling
-1
```

At `Fraction`:

```
>>> 3/2.ceiling
2

>>> -3/2.ceiling
-1
```

Threads over lists:

```
>>> [-2, -1.5 .. 2].ceiling
[-2 -1 -1 0 0 1 1 2 2]
```

A self-generating sequence,
OEIS [A005041](https://oeis.org/A005041):

```
0:7.collect { :n |
	List(
		((n + 1) / 3).ceiling + 1,
		n + 1
	)
}
[
	1 1;
	2 2;
	3 3;
	4 4 4;
	5 5 5;
	6 6 6;
	7 7 7 7;
	8 8 8 8
]
```

The unary operator form is `>`:

```
>>> 3.141.>
4
```

_Σ{k=1:n}⌈(n/k)_,
OEIS [A006590](https://oeis.org/A006590):

```
>>> 1:23.collect { :n |
>>> 	1:n.sum { :k |
>>> 		(n / k).ceiling
>>> 	}
>>> }
[
	 1  3  6  9 13 16 21 24 29 33
	38 41 48 51 56 61 67 70 77 80
	87 92 97
]
```

Ceiling is a staircase function:

~~~spl svg=A
(0 -- 7).functionPlot(ceiling:/1)
~~~

![](sw/spl/Help/Image/ceiling-A.svg)

Canonical enumeration of integers,
OEIS [A001057](https://oeis.org/A001057):

~~~spl svg=B
0:99.collect { :n |
	(-1 ^n) * (n / 2).ceiling
}.discretePlot
~~~

![](sw/spl/Help/Image/ceiling-B.svg)

Where supported `ceiling` is displayed as ⌈.

* * *

See also: floor, max, min, round, roundUp

Guides: Rounding Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Ceiling),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:ceiling),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/gtdot),
_Mathematica_
[1](https://mathworld.wolfram.com/CeilingFunction.html)
[2](https://reference.wolfram.com/language/ref/Ceiling.html),
_OEIS_
[1](https://oeis.org/A005041),
_Smalltalk_
5.6.2.18,
_W_
[1](https://en.wikipedia.org/wiki/Ceiling_function)

Unicode: U+02308 ⌈ Left Ceiling, U+2309 ⌉ Right Ceiling

Categories: Truncating and rounding
