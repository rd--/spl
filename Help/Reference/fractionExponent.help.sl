# fractionExponent

- _fractionExponent(x)_

Convert the floating-point number _x_ to fractional and integral components.
The inverse is `loadExponent`.

```
>>> 4.fractionExponent
[0.5 3]

>>> 0.5 * (2 ^ 3)
4

>>> 16.4.fractionExponent
[0.5125 5]

>>> loadExponent(0.5125, 5)
16.4

>>> 0.5125 * (2 ^ 5)
16.4
```

Threads over lists,
zero, negative zero, infinity:

```
>>> [0 -0 Infinity].fractionExponent
[0 0; -0 0; Infinity 1025]

>>> [0 0; -0 0; Infinity 1025]
>>> .loadExponent
[0 -0 Infinity]
```

Compare to `mantissaExponent`:

```
>>> 1027.fractionExponent
[1027/2048 11]

>>> 1027.mantissaExponent(2)
[1027/2048 11]
```

Large exponent:

```
>>> let n = 1023;
>>> let x = (2 ^ n).fractionExponent;
>>> let y = 0.5 * (2 ^ 1) * (2 ^ n);
>>> (x, y)
([0.5 1024], 8.988E+307)

>>> let x = 2L ^ 1023;
>>> let y = 0.5 * (2 ^ 1) * (2L ^ 1023);
>>> (x.integerLength(10), x = y)
(308, true)

>>> let x = 2 ^ 1023;
>>> let y = ldexp(0.5, 1024);
>>> (x, x = y)
(8.988E+307, true)
```

* * *

See also: SmallFloat, loadExponent, mantissaExponent

Guides: Floating Point Functions

References:
_OpenGroup_
[1](https://pubs.opengroup.org/onlinepubs/9799919799/functions/frexp.html)
[2](https://pubs.opengroup.org/onlinepubs/9799919799/functions/ldexp.html)
