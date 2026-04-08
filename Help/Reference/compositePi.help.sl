# compositePi

- _compositePi(n)_

Answer the number of composite numbers less than or equal to _n_.

Number of composites _<=n_,
OEIS [A065855](https://oeis.org/A065855):

```
>>> 1:23.collect(compositePi:/1)
[
	 0  0  0 1  1  2  2  3  4  5
	 5  6  6 7  8  9  9 10 10 11
	12 13 13
]
```

Number of composites _<=n_,
OEIS [A065855](https://oeis.org/A065855):

~~~spl svg=A oeis=A065855
1:65.collect(compositePi:/1)
.discretePlot
~~~

![](Help/Image/compositePi-A.svg)

Fractal sequence of the dispersion of the composite numbers,
OEIS [A022446](https://oeis.org/A022446):

~~~spl svg=B oeis=A022446
1:85.collect { :n |
	compositePi:/1.nestWhile(n) { :x |
		x.isPrime.not & {
			x != 1
		}
	}.primePi + 1
}.discretePlot
~~~

![](Help/Image/compositePi-B.svg)

* * *

See also: isComposite, primePi

Guides: Integer Functions
