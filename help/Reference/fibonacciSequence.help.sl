# fibonacciSequence

- _fibonacciSequence(anInteger)_

Answer a `List` of the first _anInteger_ Fibonacci numbers:

```
>>> 20.fibonacciSequence
[1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765]
```

C.f. `fibonacci`:

```
>>> 1:20.collect(fibonacci:/1)
[1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765]
```

The Fibonacci Q-matrix:

```
>>> let q = [1 1; 1 0];
>>> q.matrixPower(23)
[46368 28657; 28657 17711]

>>> (23 + 1).fibonacciSequence.drop(23 + 1 - 3)
[17711 28657 46368]
```

* * *

See also: binetsFormula, fibonacci, goldenRatio

Guides: Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FibonacciNumber.html)
[2](https://mathworld.wolfram.com/FibonacciQ-Matrix.html),
_OEIS_
[1](https://oeis.org/A000045)

Categories: Math, Sequence
