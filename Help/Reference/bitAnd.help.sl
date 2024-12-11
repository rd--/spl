# bitAnd

- _bitAnd(aCollection)_
- _bitAnd(aNumber, anotherNumber)_

Answers the bitwise and of the integers _aNumber_ and _anotherNumber_.

```
>>> 61.bitAnd(15)
13
```

`bitAnd` of `one` is 1 when odd and 0 when even:

```
>>> 1:9.bitAnd(1)
[1 0 1 0 1 0 1 0 1]
```

At `LargeInteger`:

```
>>> (3n ^ 100).bitAnd(5n ^ 100)
503913279078601980753385379100266097026814443729n
```

Use negative numbers:

```
>>> -2.bitAnd(-3)
-4
```

Extract the second-lowest-order bits in numbers:

```
>>> 1:10.bitAnd(2)
[0 2 2 0 0 2 2 0 0 2]
```

Mask to test whether bits 3 or 4 are 1:

```
>>> 1:16.bitAnd((2 ^ 2) + (2 ^ 3)).sign
[0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 0]
```

The unary form reduces over a collection:

```
>>> [3333 5555 7777 9999].bitAnd
1025
```

Test for powers of 2:

```
>>> 1:20.collect { :i |
>>> 	(i.bitAnd(i - 1) = 0).boole
>>> }
[1 1 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0]

>>> (1:20.bitAnd(0:19) =.map [0]).boole
[1 1 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0]
```

Truth table for and:

```
>>> bitAnd:/2.outer([1 0], [1 0])
[1 0; 0 0]

>>> [0 1; 0 1].bitAnd([0 0; 1 1])
[0 0; 0 1]
```

Plot a nested pattern:

~~~spl svg=A
1:100.bitAnd(0:99).linePlot
~~~

![](sw/spl/Help/Image/bitAnd-A.svg)

Plot bitAnd with double:

~~~spl svg=B
1:63.bitAnd(2 * 1:64).linePlot
~~~

![](sw/spl/Help/Image/bitAnd-B.svg)

Plot bitAnd with double and triple:

~~~spl svg=C
1:64.functionPlot { :i |
	[i, i * 2, i * 3].bitAnd
}
~~~

![](sw/spl/Help/Image/bitAnd-C.svg)

Plot first hundred terms of OEIS [A279125](https://oeis.org/A279125):

~~~spl svg=D
let n = 100;
let g = List(n, 0);
let answer = [];
1.toDo(n - 1) { :i |
	let j = 0;
	{
		g[j + 1].bitAnd(i) ~= 0
	}.whileTrue {
		j := j + 1
	};
	g[j + 1] := g[j + 1] + i;
	answer.add := j
};
answer.scatterPlot
~~~

![](sw/spl/Help/Image/bitAnd-D.svg)

* * *

See also: &, bitAnd, bitNot, bitXor

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OR.html)
[2](https://reference.wolfram.com/language/ref/BitOr.html),
_OEIS_
[1](https://oeis.org/A279125),
_Smalltalk_
5.6.5.4
