# divisorSum

- _divisorSum(n, f:/1)_

The sum of _f_ at all _i_ that divide the integer _n_.

Find the sum of the divisors of thirty, c.f. `divisorSigma`:

```
>>> 30.divisorSum(identity:/1)
72

>>> 1.divisorSigma(30)
72
```

The sum of divisors for the first fifty numbers,
OEIS [A000203](https://oeis.org/A000203):

~~~spl svg=A oeis=A000203
1:50.functionPlot { :n |
	n.divisorSum(identity:/1)
}
~~~

![](sw/spl/Help/Image/divisorSum-A.svg)

Generalised sum of divisors function,
OEIS [A002129](https://oeis.org/A002129):

~~~spl svg=B oeis=A002129 signed
1:150.collect { :n |
	n.divisorSum { :x |
		0 - (-1 ^ x * x)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSum-B.svg)

The multiplicative partition function,
OEIS [A001055](https://oeis.org/A001055):

~~~spl svg=C oeis=A001055
let t = { :n :m |
	(n = 1 | { m = 1}).if {
		1
	} {
		n.divisorSum { :x |
			let y = x > 1 & { x <= m};
			y.boole * t(n / x, x)
		}
	}
};
1:200.collect { :n |
	t(n, n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSum-C.svg)

Moebius transform applied twice to the sequence one then zero,
OEIS [A007427](https://oeis.org/A007427):

~~~spl svg=D oeis=A007427 signed
1:81.collect { :n |
	n.divisorSum { :d |
		let a = moebiusMu(d);
		let b = moebiusMu(n / d);
		a * b
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSum-D.svg)

The inverse Moebius transform of the Fredholm-Rueppel sequence,
OEIS [A154402](https://oeis.org/A154402):

~~~spl svg=E oeis=A154402
1:65.collect { :n |
	n.divisorSum { :d |
		(d + 1).log2.isInteger.boole
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSum-E.svg)

Divisor sum _-1^(d-1)*d^2_,
OEIS [A321543](https://oeis.org/A321543):

~~~spl svg=F oeis=A321543 signed
1:85.collect { :n |
	n.divisorSum { :d |
		-1 ^ (d - 1) * d.square
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSum-F.svg)

Expansion of a modular form related to Apery numbers,
OEIS [A006353](https://oeis.org/A006353):

~~~spl svg=G oeis=A006353
let a = [0 5 4 6 4 5];
1:85.collect { :n |
	n.divisorSum { :d |
		d * a[d % 6 + 1]
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSum-G.svg)

* * *

See also: aliquotSum, divisors, divisorSigma, sum

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DivisorSum.html)
