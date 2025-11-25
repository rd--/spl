# noergaardInfinityNumber

- _noergaardInfinityNumber(n)_

Answer the _n_-th term of Per Nørgårds _infinity sequence_.
The closed form calculation of the sequence,
which Nørgård defined as a recurrence,
is given by a form of signed Hamming weight of _n_,
where zero entries in the binary word invert the parity of the accumulating sum.

Calculate first few terms,
OEIS [A004718](https://oeis.org/A004718):

```
>>> 0:22.collect(
>>> 	noergaardInfinityNumber:/1
>>> )
[
	 0  1 -1  2  1  0 -2  3 -1  2
	 0  1  2 -1 -3  4  1  0 -2  3
	 0  1 -1
]
```

Scatter plot of first few terms:

~~~spl svg=B
0:250.collect(
	noergaardInfinityNumber:/1
).scatterPlot
~~~

![](sw/spl/Help/Image/noergaardInfinityNumber-A.svg)

* * *

See also: hammingWeight, noergaardInfinitySequence

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A004718)
