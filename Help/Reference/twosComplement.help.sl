# twosComplement

- _twosComplement(n, k)_

Answer the value of _n_ as a _k_-bit twos complement values.

Five plus two and four in four-bit twos-complement:

```
>>> (5 + 2).twosComplement(4)
7

>>> (5 + 4).twosComplement(4)
-7
```

Negative _n_:

```
>>> (-7 - 1:3).twosComplement(4)
[-8 7 6]

>>> (-127 - 1:3).twosComplement(8)
[-128 127 126]
```

Threads over lists:

```
>>> (5 + 1:7).twosComplement(4)
[6 7 -8 -7 -6 -5 -4]

>>> (2:5 + 4).twosComplement(4)
[6 7 -8 -7]
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

The Fibonacci sequence in eight-bit signed twos-complement:

```
>>> 20.fibonacciSequence
>>> .twosComplement(8)
[
	 0   1    1   2   3
	 5   8   13  21  34
	55  89 -112 -23 121
	98 -37   61  24  85
]
```

~~~spl svg=A
115.fibonacciSequence
.twosComplement(8).normal
.discretePlot
~~~

![](Help/Image/twosComplement-A.svg)

* * *

See also: bitAnd, bitShiftLeft, plus

Guides: Integer Functions

References:
_Mathematica_
[1](https://en.wikipedia.org/wiki/Two%27s_complement)
