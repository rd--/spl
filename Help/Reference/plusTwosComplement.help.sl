# plusTwosComplement

- _plusTwosComplement(a, b, k)_

Answer the sum of _a_ and _b_ as _k_-bit twos complement values.

Five plus two and four in four-bit twos-complement:

```
>>> 5.plusTwosComplement(2, 4)
7

>>> 5.plusTwosComplement(4, 4)
-7
```

Threads over lists:

```
>>> 5.plusTwosComplement(1:7, 4)
[6 7 -8 -7 -6 -5 -4]

>>> 2:5.plusTwosComplement(4, 4)
[6 7 -8 -7]
```

Overflow for eight-bit integers:

```
>>> 127.plusTwosComplement([1 65 127], 8)
[-128 -64 -2]
```

With 64-bit word size:

```
>>> 4660046610375530309L
>>> .plusTwosComplement(
>>> 	7540113804746346429L,
>>> 	64
>>> )
-6246583658587674878
```

* * *

See also: bitAnd, bitShiftLeft, plus

Guides: Integer Functions

References:
_Mathematica_
[1](https://en.wikipedia.org/wiki/Two%27s_complement)
