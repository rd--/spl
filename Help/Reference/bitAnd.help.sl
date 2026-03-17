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

Bitwise and of _n-1_ and _n_,
OEIS [A129760](https://oeis.org/A129760):

~~~spl svg=A oeis=A129760
let n = 1:100;
n.bitAnd(n - 1).linePlot
~~~

![](Help/Image/bitAnd-A.svg)

Bitwise and of _n_ and _2n_,
OEIS [A213370](https://oeis.org/A213370):

~~~spl svg=B oeis=A213370
let n = 1:64;
n.bitAnd(n * 2).discretePlot
~~~

![](Help/Image/bitAnd-B.svg)

Bitwise and of _n_ and _2n_ and _3n_:

~~~spl svg=C
1:64.functionPlot { :i |
	[i, i * 2, i * 3].bitAnd
}
~~~

![](Help/Image/bitAnd-C.svg)

Lexicographically earliest sequence such that,
for any distinct _i_ and _j_,
_a(i)=a(j)_ implies _i&j=0_,
OEIS [A279125](https://oeis.org/A279125):

~~~spl svg=D oeis=A279125
let n = 100;
let g = List(n, 0);
let a = [];
1.toDo(n - 1) { :i |
	let j = 0;
	{
		g[j + 1].bitAnd(i) != 0
	}.whileTrue {
		j := j + 1
	};
	g[j + 1] := g[j + 1] + i;
	a.add := j
};
a.scatterPlot
~~~

![](Help/Image/bitAnd-D.svg)

Bitwise and of positive and negative integers:

~~~spl png=E
bitAnd:/2
.table(-31:31, -31:31)
.rescale
.Greymap
~~~

![](Help/Image/bitAnd-E.png)

Calculate run length transform of `fibonacci`,
OEIS [A246028](https://oeis.org/A246028):

~~~spl svg=F oeis=A246028
0:200.collect { :n |
	0:n.sum { :k |
		let a = (n - k).bitNot;
		let b = bitAnd(a, 2 * k);
		let c = bitAnd(n.bitNot, k);
		bitOr(b, c).isZero.boole
	}
}.scatterPlot
~~~

![](Help/Image/bitAnd-F.svg)

Least multiple to have no common one bit in binary expansion,
OEIS [A261892](https://oeis.org/A261892):

~~~spl svg=G oeis=A261892
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

![](Help/Image/bitAnd-G.svg)

Maximal number of linearly independent smooth nowhere-zero vector fields on a _2n+1_-sphere,
OEIS [A053381](https://oeis.org/A053381):

~~~spl svg=H oeis=A053381
1:102.collect { :n |
	let n0 = 2 * n;
	let b = 1:Infinity.detect { :unused |
		n0 := n0 / 2;
		n0.bitAnd(1) != 0
	};
	let c = b.bitAnd(3);
	let d = (b - c) / 4;
	let rho = (2 ^ c) + (8 * d);
	rho - 1
}.discretePlot
~~~

![](Help/Image/bitAnd-H.svg)

Array giving the length of the longest carry sequence when adding _k_ to _n_ in binary,
OEIS [A080080](https://oeis.org/A080080):

~~~spl svg=I oeis=A080080
let add = { :x :y :z |
	(y = 0).if {
		z - 1
	} {
		add(
			x.bitXor(y),
			x.bitAnd(y).bitShiftLeft(1),
			z + 1
		)
	}
};
1:13.triangularArray { :n :k |
	add(n, k, 0)
}.catenate.stepPlot
~~~

![](Help/Image/bitAnd-I.svg)

Next larger integer with same binary weight as _n_,
OEIS [A057168](https://oeis.org/A057168):

~~~spl svg=J oeis=A057168
1:71.collect { :n |
	let u = bitAnd(n, -n);
	let v = u + n;
	v.bitXor(n) // u // 4 + v
}.stepPlot
~~~

![](Help/Image/bitAnd-J.svg)

Shifts left under _and_-convolution with itself,
OEIS [A007461](https://oeis.org/A007461):

~~~spl svg=K oeis=A007461
let a = Map { :n |
	(n < 2).if {
		1
	} {
		let m = n - 1;
		0:m.sum { :k |
			bitAnd(a[k], a[n - k -1])
		}
	}
};
a[0:75].discretePlot
~~~

![](Help/Image/bitAnd-K.svg)

_n&⌊(n/2)_,
OEIS [A048735](https://oeis.org/A048735):

~~~spl svg=L oeis=A048735
0:127.collect { :n |
	n.bitAnd((n / 2).floor)
}.scatterPlot
~~~

![](Help/Image/bitAnd-L.svg)

_k&(n-k)_,
OEIS [A004198](https://oeis.org/A004198):

~~~spl svg=M oeis=A004198
0:15.triangularArray { :n :k |
	k.bitAnd(n - k)
}.catenate.discretePlot
~~~

![](Help/Image/bitAnd-M.svg)

Bitwise logical and,
triangular array,
OEIS [A080099](https://oeis.org/A080099):

~~~spl svg=N oeis=A080099
0:19.triangularArray(bitAnd:/2)
.catenate.scatterPlot
~~~

![](Help/Image/bitAnd-N.svg)

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
