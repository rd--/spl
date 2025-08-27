# periodogramArray

- _periodogramArray(l, n, d, w)_

Answer the squared magnitude of the discrete Fourier transform (power spectrum) of the list _l_.

Power spectrum of a list:

```
>>> [0 1 0 -1 0 1 0 -1].periodogramArray
[0 0 2 0 0 0 2 0]
```

Power spectrum of a noisy dataset:

~~~spl svg=A
let r = Sfc32(368142);
let n = r.randomReal([-1 1], [128]);
let s = 0:127.collect { :n |
	(0.7 * (0.2.pi * n).sin) + (0.5.pi * n).sin
};
(s + n).periodogramArray.linePlot
~~~

![](sw/spl/Help/Image/periodogramArray-A.svg)

Specify the partition length:

```
>>> [0 1 0 -1 0 1 1 -1]
>>> .periodogramArray(4)
[0.125 1.125 0.125 1.125]
```

Use overlapping partitions:

```
>>> [0 1 0 -1 0 1 1 -1]
>>> .periodogramArray(4, 2)
[0.08333 1.08333 0.08333 1.08333]
```

Smooth with a Hamming window:

```
>>> let w = 4.hammingWindowTable;
>>> [0 1 0 -1 0 1 1 -1]
>>> .periodogramArray(4, 2, w)
[0.84538 0.77584 0.26125 0.77584]
```

Use a numerical array as a custom smoothing window:

```
>>> [0 1 0 -1 0 1 1 -1]
>>> .periodogramArray(4, 2, [0.5 1 1 0.2])
[0.65793 0.77438 0.19214 0.77438]
```

Verification of Parseval’s theorem:

```
>>> let r = Sfc32(678321);
>>> let x = r.randomReal([-1 1], [8]);
>>> x.periodogramArray.sum
x.square.sum
```

* * *

See also: periodogramPlot, fourier, partition, spectrogramArray, dirichletWindow

Guides: Fourier Analysis Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PeriodogramArray.html)
[2](https://mathworld.wolfram.com/ParsevalsTheorem.html),
_W_
[1](https://en.wikipedia.org/wiki/Periodogram)
[2](https://en.wikipedia.org/wiki/Parseval%27s_theorem)
