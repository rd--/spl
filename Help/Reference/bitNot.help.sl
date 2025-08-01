# bitNot

- _bitNot(n)_

Answer bitwise not, i.e. invert bits of _n_.

```
>>> 3.bitNot
-4
```

-1 corresponds to having all bits on:

```
>>> 0.bitNot
-1

>>> 7.bitNot
-8
```

Threads over lists:

```
>>> 1:10.bitNot
[-2 .. -11]
```

At `BitSet`, mutates set:

```
>>> let b = '1001'.asBitSet;
>>> b.bitNot;
>>> b.asString
'0110'
```

As `not` of `boole`:

```
>>> 1.bitNot + 2
0

>>> 0.bitNot + 2
1

>>> 5.identityMatrix.bitNot + 2
[
	0 1 1 1 1;
	1 0 1 1 1;
	1 1 0 1 1;
	1 1 1 0 1;
	1 1 1 1 0
]
```

* * *

See also: bitAnd, bitOr, bitXor, not

Guides: Bitwise Functions, Boolean Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitNot.html),
_W_
[1](https://en.wikipedia.org/wiki/Bitwise_operation#NOT)

Categories: Bit Manipulation, Binary
