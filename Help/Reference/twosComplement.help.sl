# twosComplement

- _twosComplement(n, k)_

Answer the value of _n_ as a _k_-bit twos-complement value.

Five plus two and four in four-bit twos-complement:

```
>>> (5 + 2).twosComplement(4)
7

>>> (5 + 4).twosComplement(4)
-7
```

Threads over lists:

```
>>> (5 + 1:7).twosComplement(4)
[6 7 -8 -7 -6 -5 -4]

>>> (2:5 + 4).twosComplement(4)
[6 7 -8 -7]
```

Negative _n_:

```
>>> (-7 - 1:3).twosComplement(4)
[-8 7 6]

>>> (-127 - 1:3).twosComplement(8)
[-128 127 126]
```

Three-bit integers:

```
>>> 0:7.twosComplement(3)
[0 1 2 3 -4 -3 -2 -1]

>>> 0:7.onesComplement(3)
[0 1 2 3 -3 -2 -1 -0]
```

Eight-bit integers:

```
>>> [0:2 126:130 254:255]
>>> .catenate
>>> .twosComplement(8)
[0 1 2 126 127 -128 -127 -126 -2 -1]
```

Overflow for eight-bit integers:

```
>>> (127 + [1 65 127]).twosComplement(8)
[-128 -64 -2]
```

With 64-bit word size:

```
>>> let a = 4660046610375530309L;
>>> let b = 7540113804746346429L;
>>> (a + b).twosComplement(64)
-6246583658587674878L
```

The Fibonacci sequence in four-bit signed twos-complement,
the period is twenty-four:

```
>>> 0:40.fibonacci
>>> .twosComplement(4)
>>> .findRepeat
[
	 0  1  1  2  3  5 -8 -3  5  2
	 7 -7  0 -7 -7  2 -5 -3 -8  5
	-3  2 -1  1
]
```

Find the period of the the first few word sizes,
OEIS [A007283](https://oeis.org/A007283):

```
>>> let f = 0:1000.fibonacci;
>>> 1:9.collect { :n |
>>> 	f.twosComplement(n)
>>> 	.findRepeat
>>> 	.size
>>> }
[3 6 12 24 48 96 192 384 768]

>>> 3 * (2 ^ (1:9 - 1))
[3 6 12 24 48 96 192 384 768]

>>> (2 ^ 1:9).pisanoPeriod
[3 6 12 24 48 96 192 384 768]
```

Initial terms of the Fibonacci sequence in eight-bit signed twos-complement:

```
>>> 0:23.fibonacci
>>> .twosComplement(8)
[
	  0   1    1   2   3
	  5   8   13  21  34
	 55  89 -112 -23 121
	 98 -37   61  24  85
	109 -62   47 -15
]
```

Initial terms of the Fibonacci sequence in sixteen-bit signed twos-complement:

```
>>> 0:31.fibonacci
>>> .twosComplement(16)
[
	   0        1     1     2      3
	   5        8    13    21     34
	  55       89   144   233    377
	 610      987  1597  2584   4181
	6765    10946 17711 28657 -19168
	9489    -9679  -190 -9869 -10059
	-19928 -29987
]
```

Initial terms of the Fibonacci sequence in eight-bit signed twos-complement:

~~~spl svg=A
115.fibonacciSequence
.twosComplement(8)
.discretePlot
~~~

![](Help/Image/twosComplement-A.svg)

Initial terms of the Fibonacci sequence in sixteen-bit signed twos-complement:

~~~spl svg=B
115.fibonacciSequence
.twosComplement(16)
.discretePlot
~~~

![](Help/Image/twosComplement-B.svg)

The Fibonacci sequence in four-bit signed twos-complement,
the period is twenty-four:

~~~spl svg=C
115.fibonacciSequence
.twosComplement(4)
.discretePlot
~~~

![](Help/Image/twosComplement-C.svg)

The Fibonacci sequence in eight-bit signed twos-complement,
the period is three-hundred and eighty-four:

~~~spl svg=D
0:383.fibonacci
.twosComplement(8)
.scatterPlot
~~~

![](Help/Image/twosComplement-D.svg)

* * *

See also: bitAnd, bitShiftLeft, divide, mod, plus, power

Guides: Integer Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Ones%27_complement),
[2](https://en.wikipedia.org/wiki/Two%27s_complement)
