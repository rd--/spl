# bitNor

- _bitNor(a, b, k)_

Answers the bitwise not of the bitwise or of the integers _a_ and _b_.
All bits that are unset in both inputs will be set in the output.

```
>>> let a = 2r0110_0001;
>>> let b = 2r0110_0010;
>>> bitNor(a, b, 8)
2r1001_1100

>>> let a = 2r111_0110_1010_0011;
>>> let b = 2r101_0001_0010_0110;
>>> bitNor(a, b, 15)
2r000100001011000
```

At `LargeInteger`:

```
>>> 30371L.bitNor(20774L, 15)
2136L
```

Logical convolution,
first _2^6_ terms,
OEIS [A142151](https://oeis.org/A142151):

~~~spl svg=A oeis=A142151
0:63.collect { :n |
	let k = (n + 1).bitLength;
	n + n.bitNor(n + 1, k)
}.discretePlot
~~~

![](Help/Image/bitNor-A.svg)

Logical convolution,
first _2^7_ terms,
OEIS [A142151](https://oeis.org/A142151):

~~~spl svg=B oeis=A142151
0:127.collect { :n |
	let k = (n + 1).bitLength;
	n + n.bitNor(n + 1, k)
}.scatterPlot
~~~

![](Help/Image/bitNor-B.svg)

* * *

See also: bitAnd, bitNot, bitOr, bitXor

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NOR.html),
_W_
[1](https://en.wikipedia.org/wiki/Logical_NOR)
[2](https://en.wikipedia.org/wiki/NOR_gate)

Categories: Bit Manipulation, Binary
