# inverseTriangularNumber

- _inverseTriangularNumber(n)_

Answer the inverse triangular number of _n_.

```
>>> 276.inverseTriangularNumber
23

>>> 23.triangularNumber
276
```

Irregular triangle read by rows in which column _k_ lists the odd numbers interleaved with _k-1_ zeros,
and the first element of column _k_ is in row _k(k+1)/2_,
OEIS [A196020](https://oeis.org/A196020):

~~~spl svg=A oeis=A196020
1:24.collect { :n |
	let m = n.inverseTriangularNumber;
	1:m.collect { :k |
		let m = n - (k * (k + 1) / 2);
		(m % k = 0).if {
			2 * n / k - k
		} {
			0
		}
	}
}.catenate.discretePlot
~~~

![](Help/Image/inverseTriangularNumber-A.svg)

* * *

See also: binomial, triangularNumber
