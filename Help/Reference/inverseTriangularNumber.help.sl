# inverseTriangularNumber

- _inverseTriangularNumber(n)_

Answer the inverse triangular number of _n_.

```
>>> 276L.inverseTriangularNumber
23

>>> 23L.triangularNumber
276
```

Irregular triangle read by rows in which column _k_ lists the odd numbers interleaved with _k-1_ zeroes,
and the first element of column _k_ is in row _k(k+1)/2_,
OEIS [A196020](https://oeis.org/A196020):

~~~spl svg=A oeis=A196020
1L:24L.collect { :n |
	let m = n.inverseTriangularNumber;
	1L:m.collect { :k |
		let m = n - (k * (k + 1L) / 2L);
		(m % k = 0L).if {
			2L * n // k - k
		} {
			0L
		}
	}
}.catenate.discretePlot
~~~

![](Help/Image/inverseTriangularNumber-A.svg)

* * *

See also: binomial, triangularNumber
