# softMax

- _softMax(z, β=1)_

Implement the softmax function,
the normalized exponential function.
The answer sums to `one`.

```
>>> let z = [1 2 3 4 1 2 3];
>>> let beta = 1;
>>> z.softMax(beta)
[
	0.02364 0.06426 0.17468 0.47483
	0.02364 0.06426 0.17468
]
```

The same _z_ with _β=1/10_:

```
>>> [1 2 3 4 1 2 3].softMax(0.1)
[
	0.12495 0.13809 0.152618 0.16867
	0.12495 0.13809 0.15262
]
```

Eliding β:

```
>>> [0.1 4.5 -0.2 3.3 5.4].softMax
[
	0.003246 0.264398 0.002405 0.079635
	0.650315
]
```

Threads over lists,
each row of the matrix is normalized:

```
>>> [1 2; 3 0; 4 -1].softMax(1)
[	0.268941 0.731059;
	0.952574 0.047425;
	0.993307 0.006693
]
```

* * *

See also: softPlus

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SoftmaxLayer.html)
_W_
[1](https://en.wikipedia.org/wiki/Softmax_function)
