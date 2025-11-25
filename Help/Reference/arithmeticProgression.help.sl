# arithmeticProgression

- _arithmeticProgression(n, a, d)_

Answer a `List` holding the first _n_ places of the arithmetic sequence counting from _a_ by _d_.

The natural numbers,
OEIS [A000027](https://oeis.org/A000027)
and [A001477](https://oeis.org/A001477):

```
15.arithmeticProgression(1, 1)
[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]

15.arithmeticProgression(0, 1)
[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14]
```

Arithmetic sequence of five places by two,
OEIS [A005408](https://oeis.org/A005408),
[A005843](https://oeis.org/A005843)
and [A299174](https://oeis.org/A299174):

```
>>> 5.arithmeticProgression(1, 2)
[1 3 5 7 9]

>>> 5.arithmeticProgression(0, 2)
[0 2 4 6 8]

>>> 5.arithmeticProgression(2, 2)
[2 4 6 8 10]
```

Counting by three and four,
OEIS [A008585](https://oeis.org/A008585)
and [A008586](https://oeis.org/A008586):
```
>>> 5.arithmeticProgression(0, 3)
[0 3 6 9 12]

>>> 5.arithmeticProgression(0, 4)
[0 4 8 12 16]
```

The `sum` of a finite arithmetic progression is called an arithmetic series:

```
>>> let n = 13;
>>> let d = 7;
>>> n.arithmeticProgression(0, d)
>>> .prefixSum
[0 .. n - 1].triangularNumber * d
```

The _n_, or count, and _d_, or step, values may be signals:

```
let t = Impulse(1, 0);
let a = TRand(222, 333, t);
let d = TRand(111, 555, t);
let freq = 8.arithmeticProgression(a, d);
(SinOsc(freq, 0) / TRand(7, 13, t)).Splay
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
[5](https://oeis.org/A008586)
[6](https://oeis.org/A001477),
_W_
[1](https://en.wikipedia.org/wiki/Arithmetic_progression)

Categories: Arithmetic
