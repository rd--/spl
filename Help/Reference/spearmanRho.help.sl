# spearmanRho

- _spearmanRho(u, v)_

Answer the Spearman rank correlation coefficient for the vectors _u_ and _v_.

Spearman rank correlation coefficient for two integer vectors:

```
>>> let u = [3 -4 1 4 22 17 -2 2 13 -11];
>>> let v = [-20 -24 0 4 24 36 -12 -12 56 -14];
>>> spearmanRho(u, v)
(3 / 2255).sqrt * 43 / 2

>>> let x = [106 100 86 101 99 103 97 113 112 110];
>>> let y = [7 27 2 50 28 29 20 12 6 17];
>>> spearmanRho(x, y)
-29/165
```

Fractional vectors:

```
>>> spearmanRho([3/2 3 5 10], [2 5/4 15 8])
3/5
```

Vectors with repeated items:

```
>>> let x = [1 2 3 4 5];
>>> let y = [5 6 7 8 7];
>>> spearmanRho(x, y)
0.8207826816681233
```

* * *

See also: blomqvistBeta, correlation, ranking

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SpearmanRho.html),
_W_
[1](https://en.wikipedia.org/wiki/Spearman%27s_rank_correlation_coefficient)
