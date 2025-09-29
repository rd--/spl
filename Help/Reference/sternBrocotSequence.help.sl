# sternBrocotSequence

- _sternBrocotSequence(n)_

Answer at least the first _n_ entries of Stern’s diatomic series (or Stern-Brocot sequence).

```
>>> let list = 15.sternBrocotSequence;
>>> (list.size, list)
(16, [1 1 2 1 3 2 3 1 4 3 5 2 5 3 4 1])
```

The `gcd` of adjacent values is always `one`:

```
>>> let k = 1000;
>>> let l = k.sternBrocotSequence;
>>> 2:k.allSatisfy { :i |
>>> 	l[i - 1].gcd(l[i]) = 1
>>> }
true
```

Find the index where the number 100 first appears in the sequence:

```
>>> 10000
>>> .sternBrocotSequence
>>> .indexOf(100)
1179
```

Discrete plot of first few terms:

~~~spl svg=A
200.sternBrocotSequence.discretePlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-A.svg)

Scatter plot of first few terms:

~~~spl svg=B
300.sternBrocotSequence.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-B.svg)

* * *

See also: fareySequence, sternBrocotNumber, sternBrocotTree

Guides: Integer Sequences, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SternsDiatomicSeries.html)
[2](https://mathworld.wolfram.com/Stern-BrocotTree.html),
_OEIS_
[1](https://oeis.org/A002487),
_W_
[1](https://en.wikipedia.org/wiki/Stern%27s_diatomic_sequence)

Categories: Math, Sequence
