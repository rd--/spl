# beattySequence

- _beattySequence(n, θ)_

Answer the first _n_ terms of the Beatty sequence corresponding to θ.

The sequences for _α=√2_,
OEIS [A001951](https://oeis.org/A001951)
and [A001952](https://oeis.org/A001952):

```
>>> 13.beattySequence(2.sqrt)
[1 2 4 5 7 8 9 11 12 14 15 16 18]

>>> let alpha = 2.sqrt;
>>> let beta = alpha / (alpha - 1);
>>> 13.beattySequence(beta)
[3 6 10 13 17 20 23 27 30 34 37 40 44]
```

The sequences for _α=√3_:

```
>>> 13.beattySequence(3.sqrt)
[1 3 5 6 8 10 12 13 15 17 19 20 22]

>>> let alpha = 3.sqrt;
>>> let beta = alpha / (alpha - 1);
>>> 13.beattySequence(beta)
[2 4 7 9 11 14 16 18 21 23 26 28 30]
```

The sequences for _α=e_:

```
>>> 13.beattySequence(1.e)
[2 5 8 10 13 16 19 21 24 27 29 32 35]

>>> let alpha = 1.e;
>>> let beta = alpha / (alpha - 1);
>>> 13.beattySequence(beta)
[1 3 4 6 7 9 11 12 14 15 17 18 20]
```

The sequences for _α=π_,
OEIS [A022844](https://oeis.org/A022844)
and [A054386](https://oeis.org/A054386):

```
>>> 13.beattySequence(1.pi)
[3 6 9 12 15 18 21 25 28 31 34 37 40]

>>> let alpha = 1.pi;
>>> let beta = alpha / (alpha - 1);
>>> 13.beattySequence(beta)
[1 2 4 5 7 8 10 11 13 14 16 17 19]
```

The sequences for _α=φ_,
the lower and upper Wythoff sequences:

```
>>> 13.beattySequence(1.goldenRatio)
[1 3 4 6 8 9 11 12 14 16 17 19 21]

>>> let alpha = 1.goldenRatio;
>>> let beta = alpha / (alpha - 1);
>>> 13.beattySequence(beta)
[2 5 7 10 13 15 18 20 23 26 28 31 34]
```

* * *

See also: e, goldenRatio, pi, sqrt, wythoffLower, wythoffUpper

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BeattySequence.html)
[2](https://mathworld.wolfram.com/SpectrumSequence.html),
_OEIS_
[1](https://oeis.org/A001951)
[2](https://oeis.org/A001952)
[3](https://oeis.org/A022838)
[4](https://oeis.org/A054406)
[5](https://oeis.org/A022843)
[6](https://oeis.org/A054385)
[7](https://oeis.org/A022844)
[8](https://oeis.org/A054386)
[9](https://oeis.org/A000201)
[10](https://oeis.org/A001950),
_W_
[1](https://en.wikipedia.org/wiki/Beatty_sequence)
