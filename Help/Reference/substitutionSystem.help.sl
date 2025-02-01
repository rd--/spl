# substitutionSystem

- _substitutionSystem(rule, initialCondition, count)_

Answer a `List` representing the evolution of the substitution system with the specified rule,
given as a `Map`,
from _initialCondition_ for _count_ steps.

Five steps of a `String` substitution system:

```
>>> ['A' -> 'AB', 'B' -> 'A']
>>> .asMap
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

Five steps of a substitution system that generates the infinite Fibonacci word:

```
>>> [0 -> [0 1], 1 -> [0]]
>>> .asMap
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

Generate five steps in a Thue–Morse substitution system:

```
>>> [0 -> [0 1], 1 -> [1 0]]
>>> .asMap
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
>>> .asMap
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
>>> .asMap
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
>>> .asMap
>>> .substitutionSystem([3], 3)
[
	3;
	1 2 3;
	1 1 2 1 2 3;
	1 1 1 2 1 1 2 1 2 3
]
```

Steps in constructing a Cantor set:

```
>>> [1 -> [1 0 1], 0 -> [0 0 0]]
>>> .asMap
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

Create an analogous two-dimensional nested object:

~~~spl png=A
[
	1 -> [1 1 1; 1 0 1; 1 1 1],
	0 -> [3 3].constantArray(0)
]
.asMap
.substitutionSystem([[1]], 5)
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
.asMap
.substitutionSystem([0], 10)
.last
.collect { :x |
	-1 ^ x * 1.pi / 2
}
.anglePath
.asLineDrawing
~~~

![](sw/spl/Help/Image/substitutionSystem-B.svg)

* * *

See also: Association, fibonacciWord, Map, thueMorse

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SubstitutionSystem.html)
