# bitShiftRight

- _bitShiftRight(n, k)_

Shift the binary bits in the integer _n_ to the right by _k_ places,
dropping bits that are shifted past the unit position on the right.

Right shift, towards least significant:

```
>>> 16.bitShiftRight(3)
2

>>> 16 // (2 ^ 3)
2
```

Shift 3 places to the right:

```
>>> 32.bitShiftRight(3)
4

>>> 32 // (2 ^ 3)
4
```

Shift 7 places to the right, leaving no nonzero bits:

```
>>> 32.bitShiftRight(7)
0

>>> 32 // (2 ^ 7)
0
```

`bitShiftRight` works with numbers of any size:

```
>>> (2L ^ 111 - 1).bitShiftRight(7)
20282409603651670423947251286015L
```

`bitShiftRight` automatically threads itself over lists:

```
>>> [1 2 4 16].bitShiftRight(2)
[0 0 1 4]

>>> [1 2 4 16] // (2 ^ 2)
[0 0 1 4]
```

Index from the right of the first zero bit of _n_,
OEIS [A001511](https://oeis.org/A001511):

```
>>> 0:43.collect { :n |
>>> 	let c = 1;
>>> 	let x = n;
>>> 	{ x.bitAnd(1) }.whileTrue {
>>> 		x := x >> 1;
>>> 		c := c + 1
>>> 	};
>>> 	c
>>> }
[
	1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 5 1 2 1 3
	1 2 1 4 1 2 1 3 1 2 1 6 1 2 1 3 1 2 1 4
	1 2 1 3
]
```

The operator form is `>>`.

* * *

See also: >>, bitShift, bitShiftLeft

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitShiftRight.html),
_W_
[1](https://en.wikipedia.org/wiki/Binary_shift)

Categories: Bits, Binary
