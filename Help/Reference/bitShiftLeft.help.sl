# bitShiftLeft

- _bitShiftLeft(n, k)_

Shift the binary bits in the integer _n_ to the left by _k_ places.

Left shift, towards most significant:

```
>>> 16.bitShiftLeft(3)
128

>>> 16 * (2 ^ 3)
128
```

Shift three places to the left:

```
>>> 32.bitShiftLeft(3)
256

>>> 32 * (2 ^ 3)
256
```

Shift seven places to the left:

```
>>> 32.bitShiftLeft(7)
4096

>>> 32 * (2 ^ 7)
4096
```

At `SmallFloat` the integers are taken to be 32-bit signed integers:

>>> 1.bitShiftLeft(31)
-2147483648

>>> 1L.bitShiftLeft(31)
2147483648L

>>> 1.bitShiftLeft(32)
1

>>> 1L.bitShiftLeft(32)
4294967296L
```

`bitShiftLeft` works with numbers of any size:

```
>>> (2L ^ 100 - 1).bitShiftLeft(7)
162259276829213363391578010288000L
```

`bitShiftLeft` automatically threads itself over lists:

```
>>> [1 2 4 16].bitShiftLeft(2)
[4 8 16 64]

>>> [1 2 4 16] * (2 ^ 2)
[4 8 16 64]
```

The operator form is `<<`:

```
>>> 32 << 7
4096
```

At `LargeInteger`:

```
>>> 1L << 31
2147483648L

>>> 1 << 32L
4294967296L
```

Sierpiński’s triangle,
OEIS [A001317](https://oeis.org/A001317):

```
>>> 0:16.collect { :n |
>>> 	{ :x |
>>> 		x.bitXor(x.bitShiftLeft(1))
>>> 	}.iterate(1, n)
>>> }
[
	1 3 5 15 17 51 85 255 257 771 1285
	3855 4369 13107 21845 65535 65537
]
```

Compute the first dimension of the Sobol sequence,
OEIS [A280995](https://oeis.org/A280995)
and [A062383](https://oeis.org/A062383):

~~~spl svg=A
let n = 64;
let l = n.bitLength;
let v = 1:l.collect { :i |
	1L << (32 - i)
};
let x = List(n, 0);
2.toDo(n) { :i |
	let j = (i - 1).rulerFunction;
	x[i] := x[i - 1].bitXor(v[j])
};
(x / (2 ^ 32)).stepPlot
~~~

![](sw/spl/Help/Image/bitShiftLeft-A.svg)

* * *

See also: <<, bitShift, bitShiftRight

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitShiftLeft.html),
_OEIS_
[1](https://oeis.org/A001317),
_Tc39_
[1](https://tc39.es/ecma262/multipage/ecmascript-language-expressions.html#sec-left-shift-operator)

Categories: Bits, Binary
