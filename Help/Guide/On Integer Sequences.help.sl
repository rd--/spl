# On Integer Sequences

## 0,1 sequences

The Thue-Morse sequence,
OEIS [A010060](http://oeis.org/A010060):

~~~
99.thueMorseSequence.discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-A.svg)

One if _k_ divides _n_ else zero,
OEIS [A051731](https://oeis.org/A051731):

~~~
1:17.triangularArray { :n :k |
	n.divisible(k).boole
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/divisible-J.svg)

Irregular triangle read by rows in which column _k_ lists ones interleaved with _k-1_ zeros,
and the first element of column _k_ is in row _k(k+1)/2_,
OEIS [A237048](https://oeis.org/A237048):

~~~
1:24.collect { :n |
	let m = n.inverseTriangularNumber;
	1:m.collect { :k |
		k.isOdd.if {
			n.divisible(k)
		} {
			(n - (k / 2)).divisible(k)
		}.boole
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/divisible-K.svg)

The characteristic function of square free numbers,
OEIS [A008966](https://oeis.org/A008966):

~~~
1:115.collect(
	isSquareFree:/1
).boole.discretePlot
~~~

![](sw/spl/Help/Image/isSquareFree-F.svg)

Riordan array _(1+x,1)_ read by rows,
OEIS [A097806](https://oeis.org/A097806):

~~~
1:13.collect { :n |
	[1 1].padLeft([n], 0)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/padLeft-D.svg)

Parity of the partition numbers,
OEIS [A040051](https://oeis.org/A040051):

~~~
0:115.collect { :n |
	n.partitionFunctionP
	.isOdd.boole
}.discretePlot
~~~

![](sw/spl/Help/Image/partitionFunctionP-D.svg)

The characteristic function of the triangular numbers,
one if _n_ is a triangular number otherwise zero,
OEIS [A010054](https://oeis.org/A010054):

~~~
0:200.collect { :n |
	1.squaresR(8 * n + 1) / 2
}.discretePlot
~~~

![](sw/spl/Help/Image/squaresR-B.svg)

The characteristic function of the powers of two,
OEIS [A209229](https://oeis.org/A209229):

~~~
(0:86 - 1).bitLength.differences
.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-D.svg)

Sierpiński’s triangle,
row-order discrete plot,
OEIS [A047999](https://oeis.org/A047999):

~~~
(11.pascalTriangle % 2)
.catenate
.discretePlot
~~~

![](sw/spl/Help/Image/pascalTriangle-D.svg)

The Fredholm-Rueppel sequence,
OEIS [A036987](https://oeis.org/A036987):

~~~
0:6.collect { :k |
	[1].padRight([2 ^ k], 0)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/padRight-B.svg)

_2^n_ zeroes followed by _2^n_ ones,
OEIS [A079944](https://oeis.org/A079944):

~~~
0:65.collect { :n |
	(n + 2).binaryExpansion.second
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-M.svg)

_i=j_,
OEIS [A023531](https://oeis.org/A023531):

~~~
0:11.triangularArray(=)
.catenate.boole.discretePlot
~~~

![](sw/spl/Help/Image/triangularArray-K.svg)

The characteristic function of the square numbers,
OEIS [A010052](https://oeis.org/A010052):

~~~
0:81.collect(isPerfectSquare:/1)
.boole
.discretePlot
~~~

![](sw/spl/Help/Image/isPerfectSquare-B.svg)

The characteristic function of the cubic numbers,
one if _n_ is a cube else zero,
OEIS [A010057](https://oeis.org/A010057):

~~~
1:750.collect { :n |
	(n ^ (1 / 3)).isInteger(1E-14)
}.boole.discretePlot
~~~

![](sw/spl/Help/Image/isInteger-B.svg)

## _-1,1_ sequences

The Liouville λ sequence,
OEIS [A008836](https://oeis.org/A008836):

~~~
1:115.liouvilleLambda.discretePlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-A.svg)

The Rudin–Shapiro sequence,
OEIS [A020985](http://oeis.org/A020985):

~~~
0:85.collect(rudinShapiro:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/rudinShapiro-C.svg)

_-1^n_,
the _1,-1_ sequence,
OEIS [A033999](https://oeis.org/A033999):

~~~
[1 -1].repeat(30).discretePlot
~~~

![](sw/spl/Help/Image/repeat-C.svg)

A Chebyshev transform of the Fibonacci numbers,
OEIS [A100047](https://oeis.org/A100047):

~~~
[1 1 -1 -1 0 -1 -1 1 1 0].repeat(9)
.discretePlot
~~~

![](sw/spl/Help/Image/repeat-A.svg)

_μ(r(n))_,
OEIS [A076479](https://oeis.org/A076479):

~~~
1:85.radical.moebiusMu.discretePlot
~~~

![](sw/spl/Help/Image/radical-C.svg)

The _+1,-1_ form of the Thue-Morse sequence,
OEIS [A106400](https://oeis.org/A106400):

~~~
let a = 102.thueMorseSequence;
((1 - a) * 2 - 1).discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-E.svg)

## _-1,0,1_ sequences

Table of the first few cyclotomic polynomials,
OEIS [A013595](https://oeis.org/A013595):

~~~
1:17.collect { :n |
	n.cyclotomic.coefficientList
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/cyclotomic-H.svg)

First differences of the Thue–Morse sequence,
OEIS [A029883](https://oeis.org/A029883):

~~~
99.thueMorseSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-B.svg)

Legendre symbol _(n,17)_,
OEIS [A011584](https://oeis.org/A011584):

~~~
0:85.jacobiSymbol(17).discretePlot
~~~

![](sw/spl/Help/Image/jacobiSymbol-D.svg)

Legendre symbol _(n,29)_,
OEIS [A011587](https://oeis.org/A011587):

~~~
0:85.jacobiSymbol(29).discretePlot
~~~

![](sw/spl/Help/Image/jacobiSymbol-E.svg)

From Euler’s pentagonal theorem,
also number of different partitions of _n_ into parts of -1 different kinds,
OEIS [A010815](https://oeis.org/A010815):

~~~
0:200.collect { :n |
	let m = (24 * n + 1).sqrt;
	m.isInteger.if {
		12.kroneckerSymbol(m)
	} {
		0
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-D.svg)

Kronecker symbol where _m=2_,
period eight,
OEIS [A091337](https://oeis.org/A091337):

~~~
0:99.collect { :n |
	n.kroneckerSymbol(2)
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-I.svg)

_μ(n/k)_ if _k_ divides _n_ else zero,
OEIS [A054525](https://oeis.org/A054525):

~~~
1:17.triangularArray { :n :k |
	n.divisible(k).if {
		(n / k).moebiusMu
	} {
		0
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-L.svg)

## 0,1,2,3,4,5,6,7,8,9

Array read by antidiagonals,
places are the digital root of _n×k_,
OEIS [A353109](https://oeis.org/A353109):

~~~
0:21.antidiagonalArray { :n :k |
	(n * k).digitalRoot(10)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/digitalRoot-C.svg)

## Signed

Euler transform of _-3,-3,-2_,
OEIS [A005928](https://oeis.org/A005928):

~~~
0:115.collect(
	[-3 -3 -2].periodicFunction
	.eulerTransform
).discretePlot
~~~

![](sw/spl/Help/Image/eulerTransform-A.svg)

Euler transform of _-1,-1,-2_,
OEIS [A030203](https://oeis.org/A030203):

~~~
0:115.collect(
	[-1 -1 -2].periodicFunction
	.eulerTransform
).discretePlot
~~~

![](sw/spl/Help/Image/eulerTransform-B.svg)

Euler transform of _-3,-3,-2_,
OEIS [A005928](https://oeis.org/A005928):

~~~
let u = [1 -1 -3 1 -1 3 1 -1 0];
0:150.collect { :n |
	(n < 1).if {
		(n = 0).boole
	} {
		-3 * n.divisors.sum { :d |
			u[d.mod(9, 1)]
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-D.svg)

The signed Fibonacci numbers,
OEIS [A039834](https://oeis.org/A039834):

~~~
1:65.fibonacci
.inverseBinomialTransform
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/inverseBinomialTransform-A.svg)

The inverse binomial transform of the prime numbers,
OEIS [A007442](https://oeis.org/A007442):

~~~
1:65.prime
.inverseBinomialTransform
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/inverseBinomialTransform-B.svg)

The inverse binomial transform of the rabbit sequence,
OEIS [A124841](https://oeis.org/A124841):

~~~
(1 - 1:65.fibonacciWord)
.inverseBinomialTransform
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/inverseBinomialTransform-C.svg)

The inverse binomial transform of the Lucas numbers,
OEIS [A061084](https://oeis.org/A061084):

~~~
65.lucasSequence
.inverseBinomialTransform
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/inverseBinomialTransform-D.svg)

The triangle given by recursion _T(n,k)=T(n-1,k)-T(n,k-1)_,
OEIS [A096470](https://oeis.org/A096470):

~~~
let f = { :n :k |
	(k = 0 | { n = k }).if {
		1
	} {
		(n < 0 | { k < 0 }).if {
			0
		} {
			(n > k).if {
				f(n - 1, k) - f(n, k - 1)
			} {
				0
			}
		}
	}
};
0:10.triangularArray(f:/2)
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-A.svg)

Triangle where _(n,n)=n_, _(n,n-1)=-(n-1)_ else zero,
OEIS [A128064](https://oeis.org/A128064):

~~~
1:10.triangularArray { :i :j |
	(i = j).if {
		i
	} {
		(j + 1 = i).if {
			0 - j
		} {
			0
		}
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-L.svg)

Triangle of arctangent numbers,
OEIS [A008309](https://oeis.org/A008309):

~~~
1:11.collect { :n |
	let m = 2 - (n % 2);
	m:n:2.collect { :k |
		let a = -1 ^ ((3 * n + k) / 2);
		let b = n.! / (2 ^ k);
		let c = k:n.sum { :i |
			(2 ^ i)
			*
			binomial(n - 1, i - 1)
			*
			stirlingS1(i, k)
			/
			i.!
		};
		a * b * c
	}
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/stirlingS1-C.svg)

Plot triangle of _s(n,n-k+1)_,
OEIS [A008276](https://oeis.org/A008276):

~~~
1:11.triangularArray { :n :k |
	stirlingS1(n, n - k + 1)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/stirlingS1-D.svg)

Plot the triangle of signed Stirling numbers of the first kind,
OEIS [A008275](http://oeis.org/A008275):

~~~
1:17.triangularArray(stirlingS1:/2)
.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/stirlingS1-E.svg)

Generalized Stirling number triangle of first kind,
OEIS [A049444](https://oeis.org/A049444):

~~~
0:13.triangularArray { :n :i |
	let m = n - i;
	0:m.sum { :k |
		[
			-1 ^ k,
			binomial(n, k),
			(k + 1).!,
			stirlingS1(n - k, i)
		].product
	}
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/stirlingS1-F.svg)

_k!×S1(n,k)_,
OEIS [A048594](https://oeis.org/A048594):

~~~
1:12.triangularArray { :n :k |
	k.! * stirlingS1(n, k)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/stirlingS1-G.svg)

Plot alternating sums of integer compositions in reverse lexicographic order,
OEIS [A124754](https://oeis.org/A124754):

~~~
1:7.collect { :n |
	n.integerCompositions
	.reverseLexicographicSort
	.collect(alternatingSum:/1)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/reverseLexicographicSort-B.svg)

Inverse binomial sum of compositions in standard order,
OEIS [A124756](https://oeis.org/A124756):

~~~
1:7.collect { :n |
	n.integerCompositions
	.reverseLexicographicSort
	.collect { :c |
		c.inverseBinomialTransform.last
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/reverseLexicographicSort-C.svg)

Plot first differences of integer compositions in reverse lexicographic order,
OEIS [A358133](https://oeis.org/A358133):

~~~
1:6.collect { :n |
	n.integerCompositions
	.reverseLexicographicSort
}.catenate.collect(differences:/1)
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/reverseLexicographicSort-D.svg)

## Ascents

Array where differences in rows are _n…1_,
OEIS [A141419](https://oeis.org/A141419):

~~~
1:13.triangularArray { :n :m |
	m * ((2 * n) - m + 1) / 2
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-E.svg)

Plot _k_,
count and count again from zero,
OEIS [A002262](https://oeis.org/A002262):

~~~
0:9.triangularArray { :n :k |
	k
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/triangularArray-H.svg)

## Descents

Plot number of hill-free Dyck paths of length _2n_ having height of first peak equal to _k_,
OEIS [A065602](https://oeis.org/A065602):

~~~
2:12.triangularArray { :n :k |
	let m = (n - k) / 2;
	0:m.sum { :j |
		let a = (k - 1 + (2 * j));
		let b = binomial(
			(2 * n) - k - 1 - (2 * j),
			n - 1
		);
		let c = ((2 * n) - k - 1 - (2 * j));
		a * b / c
	}
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-G.svg)

Plot _n-k_,
count backwards and count again,
OEIS [A025581](https://oeis.org/A025581):

~~~
0:9.triangularArray(-).catenate.stepPlot
~~~

![](sw/spl/Help/Image/triangularArray-I.svg)

## Traces

Number of partitions of _n_ into _k_ distinct parts,
OEIS [A060016](https://oeis.org/A060016):

~~~
let t = { :n :k |
	(k = 1).if {
		1
	} {
		(k < n).if {
			t(n - k, k) + t(n - k, k - 1)
		} {
			0
		}
	}
};
1:30.triangularArray(t:/2)
.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-D.svg)

## Staged Ascents

Square-pyramid-tree numbers,
OEIS [A051678](https://oeis.org/A051678):

~~~
1:9.triangularArray { :n :m |
	let a = (n ^ 2) * (n ^ 2 - 1) / 12;
	let b = m * (m + 1) * (2 * m + 1) / 6;
	a + b
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-F.svg)

## Stepped

List in which _n_ appears _τ(n)_ times,
OEIS [A061017](https://oeis.org/A061017):

~~~
1:17.collect { :n |
	List(0.divisorSigma(n), n)
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/divisorSigma-X.svg)