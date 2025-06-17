# arithmeticProgression

- _arithmeticProgression(n, a, d)_

Answer a `List` holding the first _n_ places of the arithmetic sequence counting from _a_ by _d_.

Arithmetic sequence of five places from one by two:

```
>>> 5.arithmeticProgression(1, 2)
[1 3 5 7 9]

>>> 5.arithmeticProgression(2, 3)
[2 5 8 11 14]
```

The `sum` of a finite arithmetic progression is called an arithmetic series:

```
>>> let n = 13;
>>> let d = 7;
>>> n.arithmeticProgression(0, d)
>>> .prefixSum
(0 .. n - 1).triangularNumber * d
```

The _n_, or count, and _d_, or step, values may be signals:

```
let t = Impulse(1, 0);
let a = TRand(222, 333, t);
let d = TRand(111, 555, t);
let freq = 8.arithmeticProgression(a, d);
(SinOsc(freq, 0) / TRand(7, 13, tr)).Splay
```

* * *

See also: arithmeticoGeometricSequence, differences, geometricProgression, Range

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ArithmeticProgression.html),
_OEIS_
[1](https://oeis.org/A000027)
[2](https://oeis.org/A005408)
[3](https://oeis.org/A005843)
[4](https://oeis.org/A008585)
[4](https://oeis.org/A008586),
_W_
[1](https://en.wikipedia.org/wiki/Arithmetic_progression)

Categories: Arithmetic
