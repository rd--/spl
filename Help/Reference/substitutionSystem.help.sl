# substitutionSystem

- _substitutionSystem(r, i, n)_

Answer a `List` representing the evolution of the substitution system with the rule _r_,
specified either as a `Map` or an association list,
from initial condition _i_ for _n_ steps.

Five steps of a `String` substitution system:

```
>>> ['A' -> 'AB', 'B' -> 'A']
>>> .substitutionSystem('A', 5)
[
	'A'
	'AB'
	'ABA'
	'ABAAB'
	'ABAABABA'
	'ABAABABAABAAB'
]
```

Five steps of a substitution system that generates the infinite Fibonacci word (A003849):

```
>>> [0 -> [0 1], 1 -> 0]
>>> .substitutionSystem([0], 5)
[
	0;
	0 1;
	0 1 0;
	0 1 0 0 1;
	0 1 0 0 1 0 1 0;
	0 1 0 0 1 0 1 0 0 1 0 0 1
]
```

C.f. `fibonacciWord`:

```
>>> 1:13.fibonacciWord
[0 1 0 0 1 0 1 0 0 1 0 0 1]
```

Generate five steps in a Thue–Morse substitution system (A010060):

```
>>> [0 -> [0 1], 1 -> [1 0]]
>>> .substitutionSystem([0], 5)
[
	0;
	0 1;
	0 1 1 0;
	0 1 1 0 1 0 0 1;
	0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0;
	0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0
	1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1
]
```

C.f. `thueMorse`:

```
>>> [0 .. 2 ^ 5 - 1].thueMorse
[
	0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0
	1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1
]
```

The initial condition can be of any length:

```
>>> [0 -> [0 1], 1 -> [1 0]]
>>> .substitutionSystem([0 1 0], 3)
[
	0 1 0;
	0 1 1 0 0 1;
	0 1 1 0 1 0 0 1 0 1 1 0;
	0 1 1 0 1 0 0 1 1 0 0 1
	0 1 1 0 0 1 1 0 1 0 0 1
]
```

Rule with three tokens:

```
>>> [0 -> [1 2], 1 -> [1 2], 2 -> [0 1]]
>>> .substitutionSystem([0], 3)
[
	0;
	1 2;
	1 2 0 1;
	1 2 0 1 1 2 1 2
]
```

Derived rule:

```
>>> 1:3.collect { :n |
>>> 	n -> [1 .. n]
>>> }
>>> .substitutionSystem([3], 3)
[
	3;
	1 2 3;
	1 1 2 1 2 3;
	1 1 1 2 1 1 2 1 2 3
]
```

The regular paper folding sequence (A014577):

```
>>> [
>>> 	'a' -> 'ab',
>>> 	'b' -> 'cb',
>>> 	'c' -> 'ad',
>>> 	'd' -> 'cd'
>>> ].substitutionSystem('a', 5)
>>> .last.characters.collect { :c |
>>> 	['a' 'b'].includes(c).boole
>>> }
[
	1 1 0 1 1 0 0 1 1 1
	0 0 1 0 0 1 1 1 0 1
	1 0 0 0 1 1 0 0 1 0
	0 1
]
```

The Rudin-Shapiro sequence (A020985):

```
>>> [
>>> 	'a' -> 'ab',
>>> 	'b' -> 'ac',
>>> 	'c' -> 'db',
>>> 	'd' -> 'dc'
>>> ].substitutionSystem('a', 5)
>>> .last.characters.collect { :c |
>>> 	['a' 'b'].includes(c).if { 1 } { -1 }
>>> }
[
	 1  1  1 -1  1  1 -1  1  1  1
	 1 -1 -1 -1  1 -1  1  1  1 -1
	 1  1 -1  1 -1 -1 -1  1  1  1
	-1  1
]
```

The period-doubling sequence (A096268):

```
>>> [0 -> [0 1], 1 -> [0 0]]
>>> .substitutionSystem([0], 5)
>>> .last
[
	0 1 0 0 0 1 0 1 0 1
	0 0 0 1 0 0 0 1 0 0
	0 1 0 1 0 1 0 0 0 1
	0 1
]
```

The rule for the _Symmetry_ movement from T. Johnson’s _Automatic Music_:

```
>>> [1 -> [1 2 1], 2 -> [2 2]]
>>> .substitutionSystem([1], 3)
[
	1;
	1 2 1;
	1 2 1 2 2 1 2 1;
	1 2 1 2 2 1 2 1 2 2 2 2 1 2 1 2 2 1 2 1
]
```

The rule for the _Canon_ movement from T. Johnson’s _Automatic Music_:

```
>>> [1 -> [1 1 2], 2 -> [3 2], 3 -> [3 3]]
>>> .substitutionSystem([1], 4)
[
	1;
	1 1 2;
	1 1 2 1 1 2 3 2;
	1 1 2 1 1 2 3 2 1 1 2 1 1 2 3 2 3 3 3 2;
	1 1 2 1 1 2 3 2 1 1 2 1 1 2 3 2 3 3 3 2
	1 1 2 1 1 2 3 2 1 1 2 1 1 2 3 2 3 3 3 2
	3 3 3 3 3 3 3 2
]
```

The rule for the _One-Line_ movement from T. Johnson’s _Automatic Music_:

```
>>> [1 -> [2], 2 -> [3 1], 3 -> [1]]
>>> .substitutionSystem([2 3 1], 6)
[
	2 3 1;
	3 1 1 2;
	1 2 2 3 1;
	2 3 1 3 1 1 2;
	3 1 1 2 1 2 2 3 1;
	1 2 2 3 1 2 3 1 3 1 1 2;
	2 3 1 3 1 1 2 3 1 1 2 1 2 2 3 1
]
```

The rule for the _Hocket_ movement from T. Johnson’s _Automatic Music_:

```
>>> [[1 3] -> [1 3 3 2], [3 2] -> [3 2 1 3]]
>>> .substitutionSystem([1 3], 4)
[
	1 3;
	1 3 3 2;
	1 3 3 2 3 2 1 3;
	1 3 3 2 3 2 1 3 3 2 1 3 1 3 3 2;
	1 3 3 2 3 2 1 3 3 2 1 3 1 3 3 2
	3 2 1 3 1 3 3 2 1 3 3 2 3 2 1 3
]
```

The rule for the _Loops_ movement from T. Johnson’s _Automatic Music_:

```
>>> [[1 2] -> [], 1 -> 2, 2 -> [3 2 1], 3 -> 1]
>>> .substitutionSystem([2], 9)
[
	2;
	3 2 1;
	1 3 2 1 2;
	2 1 3 2 1;
	3 2 1 2 1 3 2 1 2;
	1 3 2 1 2 1 3 2 1;
	2 1 3 2 1 2 1 3 2 1 2;
	3 2 1 2 1 3 2 1 2 1 3 2 1;
	1 3 2 1 2 1 3 2 1 2 1 3 2 1 2;
	2 1 3 2 1 2 1 3 2 1 2 1 3 2 1
]

>>> [[1 2] -> [], 1 -> 2, 2 -> [3 2 1], 3 -> 1]
>>> .substitutionSystem([2], 27).last
[
	2 1 3 2 1
	2 1 3 2 1
	2 1 3 2 1
	2 1 3 2 1
	2 1 3 2 1
	2 1 3 2 1
	2 1 3 2 1
	2 1 3 2 1
	2 1 3 2 1
]
```

The rule for the first movement of T. Johnson’s _Formulas for String Quartet_:

```
>>> ['+' -> '+-+', '-' -> '--+']
>>> .substitutionSystem('+', 3)
[
	'+'
	'+-+'
	'+-+--++-+'
	'+-+--++-+--+--++-++-+--++-+'
]
```

Steps in constructing a Cantor set:

```
>>> [1 -> [1 0 1], 0 -> [0 0 0]]
>>> .substitutionSystem([1], 3)
[
	1;
	1 0 1;
	1 0 1 0 0 0 1 0 1;
	1 0 1 0 0 0 1 0 1
	0 0 0 0 0 0 0 0 0
	1 0 1 0 0 0 1 0 1
]
```

Create an analogous two-dimensional nested object,
the Sierpiński carpet:

~~~spl png=A
[
	0 -> [0 0 0; 0 0 0; 0 0 0],
	1 -> [1 1 1; 1 0 1; 1 1 1]
]
.substitutionSystem([[1]], 4)
.last
.Bitmap
~~~

![](sw/spl/Help/Image/substitutionSystem-A.png)

Generate a "C curve" fractal:

~~~spl svg=B
[
	0 -> [0 0 1],
	1 -> [1]
]
.substitutionSystem([0], 10)
.last
.collect { :x |
	-1 ^ x * 1.pi / 2
}
.anglePath
.Line
~~~

![](sw/spl/Help/Image/substitutionSystem-B.svg)

Approximate a Cantor staircase function:

~~~spl svg=C
[1 -> [1 0 1], 0 -> [0 0 0]]
.substitutionSystem([1], 5)
.last
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-C.svg)

Draw the Cantor square fractal, the binary complement of Cantor dust:

~~~spl png=D
[
	0 -> [0 1 0; 1 1 1; 0 1 0],
	1 -> [1 1 1; 1 1 1; 1 1 1]
]
.substitutionSystem([[0]], 4)
.last
.Bitmap
~~~

![](sw/spl/Help/Image/substitutionSystem-D.png)

Draw the partial complement of the Haferman carpet:

~~~spl png=E
[
	0 -> [1 1 1; 1 1 1; 1 1 1],
	1 -> [0 1 0; 1 0 1; 0 1 0]
]
.substitutionSystem([[0]], 4)
.last
.Bitmap
~~~

![](sw/spl/Help/Image/substitutionSystem-E.png)

Plot trajectory of 1 under the morphism _0→11,1→10_,
OEIS [A035263](https://oeis.org/A035263):

~~~spl svg=F
[
	0 -> [1 1],
	1 -> [1 0]
].substitutionSystem([1], 6)
.last
.discretePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-F.svg)

Plot fixed point of morphism _0→0,1→110_,
OEIS [A079559](https://oeis.org/A079559):

~~~spl svg=G
[
	0 -> [0],
	1 -> [1 1 0]
].substitutionSystem([1], 5)
.last
.discretePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-G.svg)

A block-fractal and reverse block-fractal sequence,
OEIS [A001468](https://oeis.org/A001468):

~~~spl svg=H
[
	1 -> [1 2],
	2 -> [1 2 2]
].substitutionSystem([1], 4)
.last
.stepPlot
~~~

![](sw/spl/Help/Image/substitutionSystem-H.svg)

* * *

See also: Association, fibonacciWord, locallyCatenativeSequence, Map, rudinShapiro, simpleLindenmayerSystem, thueMorse

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SubstitutionSystem.html)
_OEIS_
[1](https://oeis.org/A003849)
[2](https://oeis.org/A010060)
[3](https://oeis.org/A014577)
[4](https://oeis.org/A020985)
[5](https://oeis.org/A096268)
