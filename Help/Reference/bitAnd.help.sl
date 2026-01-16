# bitAnd

- _bitAnd(i, j)_
- _bitAnd([i j …])_

Answers the bitwise and of the integers _i_ and _j_.

```
>>> 61.bitAnd(15)
13

>>> 16r5A463CA6.bitAnd(16r67376856)
16r42062806
```

Threads over lists,
`bitAnd` of `one` is `one` when odd and `zero` when even:

```
>>> 1:9.bitAnd(1)
[1 0 1 0 1 0 1 0 1]

>>> 1:9.collect(isOdd:/1).boole
[1 0 1 0 1 0 1 0 1]
```

`bitAnd` of seven is equivalent to modulo eight:

```
>>> -3:18.bitAnd(7)
-3:18 % 8
```

At `LargeInteger`:

```
>>> (3L ^ 100).bitAnd(5L ^ 100)
503913279078601980753385379100266097026814443729L
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

Test for powers of two:

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

Plot first hundred terms of
OEIS [A279125](https://oeis.org/A279125):

~~~spl svg=D
let n = 100;
let g = List(n, 0);
let answer = [];
1.toDo(n - 1) { :i |
	let j = 0;
	{
		g[j + 1].bitAnd(i) != 0
	}.whileTrue {
		j := j + 1
	};
	g[j + 1] := g[j + 1] + i;
	answer.add := j
};
answer.scatterPlot
~~~

![](sw/spl/Help/Image/bitAnd-D.svg)

Plot the bitwise and of the first few integers:

~~~spl png=E
bitAnd:/2
.table(-31:31, -31:31)
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/bitAnd-E.png)

Calculate run length transform of `fibonacci`,
OEIS [A246028](https://oeis.org/A246028):

~~~spl svg=F
0:200.collect { :n |
	0:n.sum { :k |
		let a = (n - k).bitNot;
		let b = bitAnd(a, 2 * k);
		let c = bitAnd(n.bitNot, k);
		bitOr(b, c).isZero.boole
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitAnd-F.svg)

Least multiple to have no common one bit in binary expansion,
OEIS [A261892](https://oeis.org/A261892):

~~~spl svg=G
1:200.collect { :n |
	let k = 1;
	{
		bitAnd(k * n, n) != 0
	}.whileTrue {
		k := k + 1
	};
	k * n
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitAnd-G.svg)

* * *

See also: &, bitNot, bitOr, bitXor

Guides: Bitwise Functions, Boolean Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AND.html)
[2](https://reference.wolfram.com/language/ref/BitAnd.html),
_OEIS_
[1](https://oeis.org/A279125)
[2](https://oeis.org/A246028),
_Smalltalk_
5.6.5.4,
_W_
[1](https://en.wikipedia.org/wiki/Bitwise_operation#AND)
[2](https://en.wikipedia.org/wiki/Logical_conjunction)
