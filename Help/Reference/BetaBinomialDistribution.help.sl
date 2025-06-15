# BetaBinomialDistribution

- _BetaBinomialDistributionn(α, β, n)_

A `Type` representing a beta binomial mixture distribution with beta distribution parameters alpha and beta, and n binomial trials.
Also known as a Pólya distribution.

Probability mass function, varying α:

~~~spl svg=A
(0 -- 20).functionPlot(
	[0.5 1 3].collect { :alpha |
		BetaBinomialDistribution(
			alpha, 0.3, 20
		).pdf.clip([0 0.12])
	}
)
~~~

![](sw/spl/Help/Image/BetaBinomialDistribution-A.svg)

Probability mass function, varying β:

~~~spl svg=B
(0 -- 20).functionPlot(
	[0.5 2 3].collect { :beta |
		BetaBinomialDistribution(
			1.2, beta, 20
		).pdf.clip([0 0.15])
	}
)
~~~

![](sw/spl/Help/Image/BetaBinomialDistribution-B.svg)

Generate a sample of pseudo-random numbers from a beta binomial distribution:

~~~spl svg=C
let r = Sfc32(359472);
BetaBinomialDistribution(2, 3, 50)
.randomVariate(r, [10 ^ 4])
.histogramPlot
~~~

![](sw/spl/Help/Image/BetaBinomialDistribution-C.svg)

Compare to `pdf`:

~~~spl svg=A
let d = BetaBinomialDistribution(2, 3, 50);
(0 -- 50).functionPlot(d.pdf)
~~~

![](sw/spl/Help/Image/BetaBinomialDistribution-D.svg)

Four `pdf` functions:

~~~spl svg=E
(0 -- 50).functionPlot(
	[0.5 0.5; 3 0.5; 0.5 3; 3 3]
	.collect { :p |
		BetaBinomialDistribution(
			p[1], p[2], 50
		).pdf
	}
)
~~~

![](sw/spl/Help/Image/BetaBinomialDistribution-E.svg)

Define the Pólya distribution:

```
>>> let polyaDistribution = { :p :alpha :n |
>>> 	BetaBinomialDistribution(
>>> 		p / alpha, (1 - p) / alpha, n
>>> 	)
>>> };
>>> let r = Sfc32(549327);
>>> polyaDistribution(1 / 3, 10 / 3, 10)
>>> .randomVariate(r, [10])
[8 0 6 1 0 0 3 0 10 3]
```

Mean:

```
>> BetaBinomialDistribution(`α`, `β`, `n`)
>> .mean
(/ (* n α) (+ α β))
```

* * *

See also: BetaDistribution, BinomialDistribution

Guides: Probability Distributions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BetaBinomialDistribution.html)
[2](https://reference.wolfram.com/language/ref/BetaBinomialDistribution.html),
_NIST_
[1](https://www.itl.nist.gov/div898/software/dataplot/refman2/auxillar/bbnpdf.htm),
_W_
[1](https://en.wikipedia.org/wiki/Beta-binomial_distribution)
