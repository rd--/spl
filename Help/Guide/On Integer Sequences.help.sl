# On Integer Sequences

## 0,1 Sequences

The Baum–Sweet sequence,
OEIS [A086747](https://oeis.org/A086747):

~~~
115.baumSweetSequence.discretePlot
~~~

![](sw/spl/Help/Image/baumSweetSequence-B.svg)

_2^n_ zeroes followed by _2^n_ ones,
OEIS [A079944](https://oeis.org/A079944):

~~~
0:65.collect { :n |
	(n + 2).binaryExpansion.second
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-M.svg)

The characteristic function of the powers of two,
OEIS [A209229](https://oeis.org/A209229):

~~~
(0:86 - 1).bitLength.differences
.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-D.svg)

Characteristic function of numbers with an even number of ones in their binary expansion,
OEIS [A010059](https://oeis.org/A010059):

~~~
0:85.select { :n |
	n.digitCount(2, 1).isEven
}.characteristicFunction.discretePlot
~~~

![](sw/spl/Help/Image/digitCount-S.svg)

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

Characteristic function of Fibonacci numbers,
OEIS [A010056](https://oeis.org/A010056):

~~~
let a = 1:12.fibonacci;
let k = a.max;
1:k.collect { :n |
	a.includes(n).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-N.svg)

Plot an _eta-sequence_,
the differences of the rounded multiples of φ,
OEIS [A006340](https://oeis.org/A006340):

~~~
let x = 0:93.collect(goldenRatio:/1);
(x.round.differences - 1).discretePlot
~~~

![](sw/spl/Help/Image/goldenRatio-L.svg)

The characteristic function of the cubic numbers,
one if _n_ is a cube else zero,
OEIS [A010057](https://oeis.org/A010057):

~~~
1:750.collect { :n |
	(n ^ (1 / 3)).isInteger(1E-14)
}.boole.discretePlot
~~~

![](sw/spl/Help/Image/isInteger-B.svg)

The characteristic function of the square numbers,
OEIS [A010052](https://oeis.org/A010052):

~~~
0:81.collect(isPerfectSquare:/1)
.boole
.discretePlot
~~~

![](sw/spl/Help/Image/isPerfectSquare-B.svg)

Characteristic function of prime numbers,
OEIS [A010051](https://oeis.org/A010051):

~~~
1:100.isPrime.boole.discretePlot
~~~

![](sw/spl/Help/Image/isPrime-E.svg)

Triangle where row _n_ is `one` if _n_ is prime,
`zero` otherwise,
OEIS [A143536](https://oeis.org/A143536):

~~~
1:13.triangularArray { :n :k |
	n.isPrime.boole
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/isPrime-J.svg)

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

The Fredholm-Rueppel sequence,
OEIS [A036987](https://oeis.org/A036987):

~~~
0:6.collect { :k |
	[1].padRight([2 ^ k], 0)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/padRight-B.svg)

Parity of the partition numbers,
OEIS [A040051](https://oeis.org/A040051):

~~~
0:115.collect { :n |
	n.partitionFunctionP
	.isOdd.boole
}.discretePlot
~~~

![](sw/spl/Help/Image/partitionFunctionP-D.svg)

Sierpiński’s triangle,
row-order discrete plot,
OEIS [A047999](https://oeis.org/A047999):

~~~
(11.pascalTriangle % 2)
.catenate
.discretePlot
~~~

![](sw/spl/Help/Image/pascalTriangle-D.svg)

The period doubling sequence,
OEIS [A096268](https://oeis.org/A096268):

~~~
115.periodDoublingSequence.discretePlot
~~~

![](sw/spl/Help/Image/periodDoublingSequence-A.svg)

A sequence that is distinct from but similar to the period doubling sequence,
OEIS [A073059](https://oeis.org/A073059):

~~~
let a = Map { :n |
	[
		{ n = 1 } -> { 0 },
		{ n % 2 = 0 } -> { 0 },
		{ n % 4 = 3 } -> { 1 },
		{ true } -> { a[(n - 1) / 4] }
	].which
};
a[1:105].discretePlot
~~~

![](sw/spl/Help/Image/periodDoublingSequence-B.svg)

A sequence that is distinct from but similar to the complement of the period doubling sequence,
OEIS [A098725](https://oeis.org/A098725):

~~~
let a = Map { :n |
	[
		{ n % 2 = 1 } -> { 1 },
		{ n % 4 = 0 } -> { 0 },
		{ true } -> { a[(n - 2) / 4 + 1] }
	].which
};
a[0:101].discretePlot
~~~

![](sw/spl/Help/Image/periodDoublingSequence-C.svg)

The complement of the period doubling sequence,
OEIS [A035263](https://oeis.org/A035263):

~~~
(1 - 105.periodDoublingSequence).discretePlot
~~~

![](sw/spl/Help/Image/periodDoublingSequence-D.svg)

The regular paperfolding sequence,
OEIS [A014577](https://oeis.org/A014577):

~~~
85.regularPaperfoldingSequence
.discretePlot
~~~

![](sw/spl/Help/Image/regularPaperfoldingSequence-C.svg)

Plot _a(n)%4=3_,
where _a_ is the delayed divison of the Cloitre sequence,
OEIS [A361463](https://oeis.org/A361463):

~~~
let c = 1L.rowlandsSequence(200, lcm:/2);
let a = c.adjacentPairsCollect(/.swap) - 1;
((a % 4) =.each 3).boole.discretePlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-I.svg)

The characteristic function of the triangular numbers,
one if _n_ is a triangular number otherwise zero,
OEIS [A010054](https://oeis.org/A010054):

~~~
0:200.collect { :n |
	1.squaresR(8 * n + 1) / 2
}.discretePlot
~~~

![](sw/spl/Help/Image/squaresR-B.svg)

Plot trajectory of 1 under the morphism _0→11,1→10_,
OEIS [A035263](https://oeis.org/A035263):

~~~
[
	0 -> [1 1],
	1 -> [1 0]
].substitutionSystem([1], 6)
.last
.discretePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-F.svg)

Plot fixed point of morphism _0→0,1→110_,
OEIS [A079559](https://oeis.org/A079559):

~~~
[
	0 -> [0],
	1 -> [1 1 0]
].substitutionSystem([1], 5)
.last
.discretePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-G.svg)

Fixed point of the mapping _00→0010 01→010 10→000_ starting with _00_,
OEIS [A289016](https://oeis.org/A289016):

~~~
[
	[0 0] -> [0 0 1 0],
	[0 1] -> [0 1 0],
	[1 0] -> [0 0 0]
].substitutionSystem([0 0], 8)
.last.discretePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-J.svg)

The Thue-Morse sequence,
OEIS [A010060](http://oeis.org/A010060):

~~~
99.thueMorseSequence.discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-A.svg)

_i=j_,
OEIS [A023531](https://oeis.org/A023531):

~~~
0:11.triangularArray(=)
.catenate.boole.discretePlot
~~~

![](sw/spl/Help/Image/triangularArray-K.svg)

First differences of the lower Wythoff sequence,
a Fibonacci word,
OEIS [A014675](https://oeis.org/A014675):

~~~
1:65.wythoffLower
.differences
.stepPlot
~~~

![](sw/spl/Help/Image/wythoffLower-C.svg)

Discrete plot of the Zeckendorf representation of a large integer,
the prepresentation has 115 places:

~~~
900000000000000000000000L
.zeckendorfRepresentation
.discretePlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-A.svg)

Zeckendorf representations,
OEIS [A189920](https://oeis.org/A189920):

~~~
1:21.collect(
	zeckendorfRepresentation:/1
).catenate.discretePlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-I.svg)

## _-1,1_ Sequences

Kronecker symbol _-1,n_,
the regular paperfolding sequence,
OEIS [A034947](https://oeis.org/A034947):

~~~
1:85.collect { :n |
	-1.kroneckerSymbol(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-K.svg)

The Liouville λ sequence,
OEIS [A008836](https://oeis.org/A008836):

~~~
1:115.liouvilleLambda.discretePlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-A.svg)

_μ(r(n))_,
OEIS [A076479](https://oeis.org/A076479):

~~~
1:85.radical.moebiusMu.discretePlot
~~~

![](sw/spl/Help/Image/radical-C.svg)

_-1^n_,
the _1,-1_ sequence,
OEIS [A033999](https://oeis.org/A033999):

~~~
[1 -1].repeat(30).discretePlot
~~~

![](sw/spl/Help/Image/repeat-C.svg)

The Rudin–Shapiro sequence,
OEIS [A020985](http://oeis.org/A020985):

~~~
0:85.collect(rudinShapiro:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/rudinShapiro-C.svg)

The _+1,-1_ form of the Thue-Morse sequence,
OEIS [A106400](https://oeis.org/A106400):

~~~
let a = 102.thueMorseSequence;
((1 - a) * 2 - 1).discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-E.svg)

## _-1,0,1_ Sequences

Table of the first few cyclotomic polynomials,
OEIS [A013595](https://oeis.org/A013595):

~~~
1:17.collect { :n |
	n.cyclotomic.coefficientList
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/cyclotomic-H.svg)

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

A recurrence table,
_a[n-1]+(-1ᵐa[m])_ where _m=⌊(n/2)_,
OEIS [A089045](https://oeis.org/A089045):

~~~
{ :a :n |
	let m = (n / 2).floor;
	a[n - 1] + ((-1 ^ m) * a[m])
}.recurrenceTable([1], 85).discretePlot
~~~

![](sw/spl/Help/Image/power-I.svg)

Sign of first differences of Recamán’s sequence,
OEIS [A160357](https://oeis.org/A160357):

~~~
100.recamanSequence
.differences
.sign
.discretePlot
~~~

![](sw/spl/Help/Image/recamanSequence-E.svg)

First differences of the regular paperfolding sequence,
OEIS [A343173](https://oeis.org/A343173):

~~~
115.regularPaperfoldingSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/regularPaperfoldingSequence-D.svg)

A Chebyshev transform of the Fibonacci numbers,
OEIS [A100047](https://oeis.org/A100047):

~~~
[1 1 -1 -1 0 -1 -1 1 1 0].repeat(9)
.discretePlot
~~~

![](sw/spl/Help/Image/repeat-A.svg)

First differences of the Thue–Morse sequence,
OEIS [A029883](https://oeis.org/A029883):

~~~
99.thueMorseSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-B.svg)

Second differences of the lower Wythoff sequence,
essentially
OEIS [A014677](https://oeis.org/A014677):

~~~
1:65.wythoffLower
.differences(2)
.discretePlot
~~~

![](sw/spl/Help/Image/wythoffLower-D.svg)

## 1,2 Sequences

A block-fractal and reverse block-fractal sequence,
OEIS [A001468](https://oeis.org/A001468):

~~~
[
	1 -> [1 2],
	2 -> [1 2 2]
].substitutionSystem([1], 4)
.last
.stepPlot
~~~

![](sw/spl/Help/Image/substitutionSystem-H.svg)

## 1,3 Sequences

List of twin primes modulo four,
OEIS [A122567](https://oeis.org/A122567):

~~~
let a = 3:1019.select(
	isLesserTwinPrime:/1
);
let b = [a, a + 2].interleave;
let c = b.deleteDuplicates;
(c % 4).stepPlot
~~~

![](sw/spl/Help/Image/isLesserTwinPrime-C.svg)

## 2,3 Sequences

First differences of the upper Wythoff sequence,
a Fibonacci word,
OEIS [A076662](https://oeis.org/A076662):

~~~
1:65.wythoffUpper
.differences
.stepPlot
~~~

![](sw/spl/Help/Image/wythoffUpper-A.svg)

## 1,2,4,6,8 Sequences

The final nonzero digit of _n!_,
OEIS [A008904](https://oeis.org/A008904):

~~~
let n = 0:65.!.withoutTrailingZeroes;
(n % 10).stepPlot
~~~

![](sw/spl/Help/Image/withoutTrailingZeroes-A.svg)

## 0-9 Sequences

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

First differences of aliquot sums,
OEIS [A053246](https://oeis.org/A053246):

~~~
2:115.aliquotSum.differences
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-D.svg)

Second differences of aliquot sums,
OEIS [A053246](https://oeis.org/A053246):

~~~
1:115.aliquotSum.differences(2)
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-E.svg)

Plot numerator of Bernoulli sequence,
OEIS [A027641](https://oeis.org/A027641):

~~~
99.bernoulliSequence
.numerator
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliSequence-A.svg)

Plot list of powers of φ in the representation of _n_,
OEIS [A104605](https://oeis.org/A104605):

~~~
let phi = 1.goldenRatio;
2:27.collect { :n |
	let e = n.betaExpansion(phi, 32);
	(e[2] - e[1].indicesOf(1)).reverse
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/betaExpansion-D.svg)

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

_₂F₁(-2k,2k-2n;1;-1)_,
OEIS [A184879](https://oeis.org/A184879):

~~~
0:10.triangularArray { :n :k |
	hypergeometric2F1(
		-2 * k, (2 * k) - (2 * n), 1, -1
	)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/hypergeometric2F1-D.svg)

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

First differences of Stern’s diatomic series,
discarding initial two terms,
OEIS[A070990](https://oeis.org/A070990):

~~~
115.sternBrocotSequence
.allButFirst(2)
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-D.svg)

Second differences of Stern’s diatomic series,
OEIS[A283104](https://oeis.org/A283104):

~~~
150.sternBrocotSequence
.differences(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-E.svg)

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

Take odd digits of _n_ with negative sign,
OEIS [A121758](https://oeis.org/A121758):

~~~
1:69.collect { :n |
	n.integerDigits
	.reverse
	.withIndexCollect { :x :i |
		(-1 ^ x) * x * (10 ^ (i - 1))
	}.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/withIndexCollect-A.svg)

Take even digits of _n_ with negative sign,
OEIS [A121759](https://oeis.org/A121759):

~~~
1:69.collect { :n |
	n.integerDigits
	.reverse
	.withIndexCollect { :x :i |
		(-1 ^ (x + 1)) * x * (10 ^ (i - 1))
	}.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/withIndexCollect-B.svg)

## Ascents, Linear

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

## Descents, Linear

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

## Ascents, Curved

Cubic numbers,
OEIS [A000578](https://oeis.org/A000578):

~~~
0:65.cube.discretePlot
~~~

![](sw/spl/Help/Image/cube-B.svg)

The Perrin sequence,
OEIS [A001608](https://oeis.org/A001608):

~~~
35.perrinSequence.discretePlot
~~~

![](sw/spl/Help/Image/perrinSequence-A.svg)

Signature sequence of φ²,
OEIS [A118276](https://oeis.org/A118276):

~~~
1.goldenRatio.square
.signatureSequence(200)
.scatterPlot
~~~

![](sw/spl/Help/Image/signatureSequence-A.svg)

Tetrahedral numbers,
OEIS [A000292](https://oeis.org/A000292):

~~~
0:65.tetrahedralNumber.discretePlot
~~~

![](sw/spl/Help/Image/tetrahedralNumber-A.svg)

The van der Laan sequence,
OEIS [A182097](https://oeis.org/A182097):

~~~
35.vanDerLaanSequence
.discretePlot
~~~

![](sw/spl/Help/Image/vanDerLaanSequence-A.svg)

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

Number of first-quadrant cells that are on after _n_-th stage of the Holladay-Ulam cellular automaton,
OEIS [A151922](https://oeis.org/A151922),
essentially also
OEIS [A151920](https://oeis.org/A151920):

~~~
let n = 1:85;
let w = n.digitCount(2, 1);
let a = 3 ^ (w - 1) + 1;
([1] ++ a).prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-O.svg)

The Entringer triangle,
log scale scatter plot,
OEIS [A008281](https://oeis.org/A008281):

~~~
13.entringerTriangle
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/entringerTriangle-A.svg)

Partial sums of _3^(w(n-1)-1)_,
OEIS [A151920](https://oeis.org/A151920):

~~~
let n = 2:85;
let w = (n - 1).hammingWeight;
let a = 3 ^ (w - 1);
a.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-P.svg)

T-toothpick sequence,
OEIS [A160172](https://oeis.org/A160172):

~~~
let a = Map { :n |
	(n < 0).if {
		0
	} {
		let m = n + 1;
		1:m.sum { :i |
			3 ^ i.hammingWeight
		} / 3
	}
};
0:85.collect { :n |
	(2 * a[n - 2]) + (2 * a[n - 3]) + n
}.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-Q.svg)

First few terms of the toothpick sequence,
OEIS [A139250](https://oeis.org/A139250):

~~~
200.toothpickSequence.scatterPlot
~~~

![](sw/spl/Help/Image/toothpickSequence-A.svg)

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

## Irregular Ascent, Curved

Step plot of _σ3(n)_,
OEIS [A001158](https://oeis.org/A001158):

~~~
1:100.collect { :n |
	3.divisorSigma(n)
}.stepPlot
~~~

![](sw/spl/Help/Image/divisorSigma-J.svg)

Plot where _σ(m)_ rises by at least _n_,
OEIS [A058197](https://oeis.org/A058197):

~~~
let sigma = 0.divisorSigma(1:5100);
let d = sigma.differences;
1:30.collect { :n |
	d.detectIndex { :x |
		x >= n
	}
}.log.stepPlot
~~~

![](sw/spl/Help/Image/divisorSigma-L.svg)

## Irregular Ascent

Record positions of aliquot sums,
OEIS [A034090](https://oeis.org/A034090):

~~~
1:250.aliquotSum
.recordPositions
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-B.svg)

Record values of aliquot sums,
OEIS [A034091](https://oeis.org/A034091):

~~~
1:250.aliquotSum
.recordValues
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-C.svg)

Plot _a(n+1)=a(n)+σ(a(n))_,
OEIS [A064491](https://oeis.org/A064491):

~~~
{ :x |
	x + 0.divisorSigma(x)
}.nestList(1, 47).scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-I.svg)

Sum of digits of Fibonacci numbers,
OEIS [A004090](https://oeis.org/A004090):

~~~
0:85.fibonacci.collect { :n |
	n.integerDigits.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-O.svg)

Lesser of twin primes,
OEIS [A001359](https://oeis.org/A001359):

~~~
3:1607
.select(isLesserTwinPrime:/1)
.linePlot
~~~

![](sw/spl/Help/Image/isLesserTwinPrime-A.svg)

List of twin primes,
OEIS [A001097](https://oeis.org/A001097):

~~~
let a = 3:1607.select(
	isLesserTwinPrime:/1
);
[a, a + 2]
.interleave
.deleteDuplicates
.discretePlot
~~~

![](sw/spl/Help/Image/isLesserTwinPrime-B.svg)

Primes up to one-thousand,
OEIS [A000040](https://oeis.org/A000040):

~~~
1:999.select(isPrime:/1).linePlot
~~~

![](sw/spl/Help/Image/isPrime-A.svg)

Sum of primes _≤n_,
OEIS [A034387](https://oeis.org/A034387):

~~~
1:250.collect { :n |
	n * n.isPrime.boole
}.prefixSum.stepPlot
~~~

![](sw/spl/Help/Image/isPrime-I.svg)

Least prime in each Rowland’s sequence,
step plot,
OEIS [A230504](https://oeis.org/A230504):

~~~
1:75.collect { :m |
	m.rowlandsSequence(13)
	.detect(isPrime:/1)
}.stepPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-D.svg)

Least prime in each Rowland’s sequence,
scatter plot,
OEIS [A230504](https://oeis.org/A230504):

~~~
1:100.collect { :m |
	m.rowlandsSequence(13)
	.detect(isPrime:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-E.svg)

Partial sums of Stern’s diatomic series,
OEIS [A174868](https://oeis.org/A174868):

~~~
85.sternBrocotSequence
.prefixSum
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-G.svg)

Positions of ones in the van Eck sequence,
OEIS [A171951](https://oeis.org/A171951):

~~~
1200.vanEckSequence
.indicesOf(1)
.discretePlot
~~~

![](sw/spl/Help/Image/vanEckSequence-F.svg)

Positions of zeroes in the van Eck sequence,
OEIS [A171865](https://oeis.org/A171865):

~~~
200.vanEckSequence
.indicesOf(0)
.discretePlot
~~~

![](sw/spl/Help/Image/vanEckSequence-G.svg)

The lower Wythoff sequence,
OEIS [A000201](https://oeis.org/A000201):

~~~
1:23.wythoffLower.stepPlot
~~~

![](sw/spl/Help/Image/wythoffLower-A.svg)

## Irregular Restarting Ascents, Horizontal Bands

A sequence by David James Sycamore,
OEIS [A360179](https://oeis.org/A360179):

~~~
let m = 250;
let a = List(m, 1);
let c = Map();
let h = Map();
let j = 1;
let k = nil;
let u = 1;
2.toDo(m) { :n |
	c.lookup(j, false).if {
		k := j + 0.divisorSigma(u);
		h[j] := h.lookup(j, 0) + 1;
		h[u] := h.lookup(u, 0) - 1
	} {
		k := 0.divisorSigma(j);
		c[j] := true;
		h[j] := h.lookup(j, 0) + 1
	};
	u := u.min(j);
	a[n] := k;
	j := k;
	{
		h.lookup(u, 0) = 0
	}.whileTrue {
		u := u + 1
	}
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-S.svg)

## Irregular Restarting Ascents

Restricted growth sequence transform of the ordered pair of counts of ones in the binary expansion of _n_ which have an even and odd number of zeroes at less significant positions,
OEIS [A361020](https://oeis.org/A361020):

~~~
0:275.collect { :n |
	let b = n.binaryExpansion.reverse;
	let z = 0;
	let [p, q] = [0, 0];
	b.do { :i |
		(i = 0).if {
			z := z + 1
		} {
			z.isEven.if {
				p := p + 1
			} {
				q := q + 1
			}
		}
	};
	[p, q]
}.restrictedGrowthSequenceTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-D.svg)

Restricted growth sequence transform of the ordered triple of binary carry sequence and the counts of ones in the binary expansion of _n_ which have an even and odd number of zeroes at less significant positions,
OEIS [A389896](https://oeis.org/A389896):

~~~
0:275.collect { :n |
	let b = n.binaryExpansion.reverse;
	let z = 0;
	let e = (n + 1).integerExponent(2);
	let [p, q] = [0, 0];
	b.do { :i |
		(i = 0).if {
			z := z + 1
		} {
			z.isEven.if {
				p := p + 1
			} {
				q := q + 1
			}
		}
	};
	[e, p, q]
}.restrictedGrowthSequenceTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-E.svg)

In the binary expansion of _n_,
sum the exponents associated with one terms and subtract the exponents associated with zero terms,
OEIS [A309983](https://oeis.org/A309983):

~~~
1:85.collect { :n |
	let b = n.binaryExpansion;
	let p = 2 * b.allButLast - 1;
	let k = p.size;
	(p * k:1:-1).sum
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-L.svg)

A variant of a sequence by David James Sycamore,
OEIS [A361511](https://oeis.org/A361511):

~~~
let k = 250;
let a = List(k, 1);
let c = Map();
let m = 1;
2.toDo(k) { :n |
	let b = a[n - 1];
	c.lookup(b, false).if {
		a[n] := b + 0.divisorSigma(a[m]);
		m := m + 1
	} {
		a[n] := 0.divisorSigma(b)
	};
	c[b] := true
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-U.svg)

Lexicographically earliest sequence of distinct terms such that every pair of consecutive terms contains a term that is a unitary divisor of the other term,
OEIS [A282291](https://oeis.org/A282291):

~~~
[1].leastExcludedSequence(59) { :a :n :m |
	let [p, q] = [a[n - 1], m].sort;
	q.divisible(p) & {
		p.isCoprime(q / p)
	}
}.log.discretePlot
~~~

![](sw/spl/Help/Image/isCoprime-D.svg)

First differences of toothpicks numbers,
OEIS [A139251](https://oeis.org/A139251):

~~~
85.toothpickSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/toothpickSequence-B.svg)

First differences of toothpicks numbers,
further terms,
OEIS [A139251](https://oeis.org/A139251):

~~~
250.toothpickSequence
.differences
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/toothpickSequence-C.svg)

Plot Wythoff array read by rising antidiagonals,
OEIS [A083412](https://oeis.org/A083412):

~~~
10.antidiagonalArray(
	wythoffArray:/2.swap
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffArray-B.svg)

## Irregular Restarting Descents

The difference between the number of zeroes and ones in the base-two representation _n_,
OEIS [A037861](https://oeis.org/A037861):

~~~
0:95.collect { :n |
	let b = n.binaryExpansion;
	let k = b.size;
	let i = b.occurrencesOf(0);
	i - (k - i)
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-K.svg)

Plot Wythoff array read by falling antidiagonals,
OEIS [A035513](https://oeis.org/A035513):

~~~
10.antidiagonalArray(
	wythoffArray:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffArray-A.svg)

Not integer sequence, but derived from such:

Plot _a(n)/n_,
where _a_ is Rowland’s sequence,
OEIS [A106108](https://oeis.org/A106108),
values are real numbers in _(2,3)_:

~~~
let n = 200;
let a = 7.rowlandsSequence(n);
(a / 1:n).
allButFirst(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-F.svg)

## Restarting Ascents

The golden triangle,
OEIS [A180662](https://oeis.org/A180662):

~~~
0:10.triangularArray { :n :k |
	[k, k + 1].fibonacci.product
}.catenate.log.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-P.svg)

Trajectory of 1 under the morphism _1→12,2→123_ &etc,
OEIS [A007001](https://oeis.org/A007001):

~~~
{ :c |
	c.collect { :n |
		[1 .. n + 1]
	}.catenate
}.iterate([1], 5).stepPlot
~~~

![](sw/spl/Help/Image/iterate-D.svg)

## Restarting Descents

The number of Schroeder paths of length _2n_ and having _k_ peaks at height one,
OEIS [A104219](https://oeis.org/A104219):

~~~
0:11.triangularArray { :n :k |
	(-1 ^ (n - k))
	*
	binomial(n, k)
	*
	hypergeometric2F1(
		k - n, n + 1, k + 2, 2
	)
}.catenate.log.discretePlot
~~~

![](sw/spl/Help/Image/hypergeometric2F1-C.svg)

## Stepped Ascent

_2*(n-w(n))/3_ where _w_ is the one count in the base negative two expansion,
OEIS [A073504](https://oeis.org/A073504):

~~~
1:50.collect { :n |
	2 * (n - n.digitCount(-2, 1)) / 3
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-R.svg)

List in which _n_ appears _τ(n)_ times,
OEIS [A061017](https://oeis.org/A061017):

~~~
1:17.collect { :n |
	List(0.divisorSigma(n), n)
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/divisorSigma-X.svg)

Rowland’s sequence with _m=7_,
step plot,
OEIS [A106108](https://oeis.org/A106108):

~~~
7.rowlandsSequence(200)
.stepPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-A.svg)

The self-counting sequence,
discrete plot,
OEIS [A002024](https://oeis.org/A002024):

~~~
65.selfCountingSequence.discretePlot
~~~

![](sw/spl/Help/Image/selfCountingSequence-A.svg)

Denominators of _k=1_ Sobol sequence,
discrete plot,
[A062383](https://oeis.org/A062383):

~~~
63.sobolSequence(1).denominator.discretePlot
~~~

![](sw/spl/Help/Image/sobolSequence-F.svg)

Partial sums of the Thue–Morse sequence,
OEIS [A115384](https://oeis.org/A115384):

~~~
35.thueMorseSequence.prefixSum.stepPlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-D.svg)

## Exponential

The Padovan sequence,
OEIS [A000931](https://oeis.org/A000931):

~~~
35.padovanSequence([1 0 0])
.discretePlot
~~~

![](sw/spl/Help/Image/padovanSequence-A.svg)

Sequence of almost integers,
rounded,
OEIS [A205579](https://oeis.org/A205579):

~~~
(1.plasticRatio ^ 0:35).round.discretePlot
~~~

![](sw/spl/Help/Image/plasticRatio-A.svg)

The Somos four sequence,
discrete log plot,
OEIS [A006720](https://oeis.org/A006720):

~~~
4.somosSequence(35).log.discretePlot
~~~

![](sw/spl/Help/Image/somosSequence-A.svg)

The Somos seven sequence,
discrete log plot,
OEIS [A006723](https://oeis.org/A006723):

~~~
7.somosSequence(35).log.discretePlot
~~~

![](sw/spl/Help/Image/somosSequence-B.svg)

Record values of Stern’s diatomic series,
OEIS [A212289](https://oeis.org/A212289):

~~~
10000.sternBrocotSequence
.recordValues
.discretePlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-C.svg)

The van der Laan sequence,
OEIS [A182097](https://oeis.org/A182097):

~~~
35.vanDerLaanSequence
.discretePlot
~~~

![](sw/spl/Help/Image/vanDerLaanSequence-A.svg)

## Quasi-Symmetry

Numerators of _k=1_ Sobol sequence,
scatter plot,
OEIS [A280995](https://oeis.org/A280995):

~~~
255.sobolSequence(1).numerator.scatterPlot
~~~

![](sw/spl/Help/Image/sobolSequence-G.svg)

Scatter plot of first few terms of Stern’s diatomic series,
OEIS [A002487](https://oeis.org/A002487):

~~~
300.sternBrocotSequence.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-B.svg)

## Quasi-Symmetry, Blocks

Bit-reversal permutations,
OEIS [A049773](https://oeis.org/A049773):

~~~
0:7.collect(bitReversalPermutation:/1)
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/bitReversalPermutation-A.svg)

## Quasi-Horizontal Bands, Varying Density

Product of the proper divisors of _n_,
OEIS [A007956](https://oeis.org/A007956):

~~~
1:200.collect { :n |
	n ^ (0.divisorSigma(n) / 2 - 1)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-K.svg)

## Horizontal Bands

Scatter plot of the first few terms of Recamáns sequence,
OEIS [A005132](https://oeis.org/A005132):

~~~
300.recamanSequence.scatterPlot
~~~

![](sw/spl/Help/Image/recamanSequence-B.svg)

A variant of Recamáns sequence,
_k_ begins at _n_ and then flips signs and increments until a value is located,
OEIS [A064389](https://oeis.org/A064389):

~~~
let m = 300;
let a = [1];
let d = IdentitySet(a);
2.toDo(m) { :n |
	let k = n;
	let x = nil;
	{
		x := a[n - 1] - k;
		k := (k > 0).if { -k } { -k + 1 };
		(x <= 0) | {
			d.includes(x)
		}
	}.whileTrue;
	a.add(x);
	d.add(x)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/recamanSequence-D.svg)

Height of terms of Recamán’s sequence,
OEIS [A064289](https://oeis.org/A064289):

~~~
let r = 150.recamanSequence;
r.addFirst(0);
r.differences.sign.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/recamanSequence-F.svg)

The smallest number _k_ such that _fusc(k)=n_,
OEIS [A020946](https://oeis.org/A020946):

~~~
let k = 10000;
let a = k.sternBrocotSequence;
0:200.collect { :n |
	1:k.detect { :i |
		a[i] = n
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-F.svg)

Plot first few terms:

~~~
1:200.collect { :n |
	n.wythoffIndex[2] - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffIndex-B.svg)

## Horizontal Bands, Varying Density

_σ₀(n)_,
also called _τ(n)_,
OEIS [A000005](https://oeis.org/A000005):

~~~
let n = 200;
0.divisorSigma(1:n).scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-D.svg)

Number of divisors of _n_ that are at most _√n_,
OEIS [A038548](http://oeis.org/A038548):

~~~
1:85.collect { :n |
	(0.divisorSigma(n) + 1) / 2
}.floor.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-E.svg)

## Gapped Ascents

Plot the part of _n_ in base φ left of the decimal point,
interpreted as a binary integer,
OEIS [A105425](https://oeis.org/A105425):

~~~
let phi = 1.goldenRatio;
2:105.collect { :n |
	let e = n.betaExpansion(phi, 32);
	e[1].first(e[2]).fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/betaExpansion-E.svg)

Primes having initial digits _11_ in their binary representation,
OEIS [A080166](https://oeis.org/A080166):

~~~
1:200.prime.select { :n |
	n.binaryExpansion.first(2) = [1 1]
}.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-G.svg)

Primes having initial and final digits _11_ in their binary representation,
OEIS [A080168](https://oeis.org/A080168):

~~~
1:200.prime.select { :n |
	let b = n.binaryExpansion;
	b.first(2) = [1 1] & {
		b.last(2) = [1 1]
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-H.svg)

Denominators of rationals _≥1_ whose continued fractions consist only of ones and twos,
OEIS [A072729](https://oeis.org/A072729):

~~~
[
	1   1  2  2  3  3  5  5  5  5
	8   7  8  8  7  8 12 13 11 12
	13 12 13 11 12 13 19 19 21 17
	18 19 19 21 19 19 21 17 18 19
	19 21 29 31 30 31 34 27 26 29
	29 31 30 31 34
].scatterPlot
~~~

![](sw/spl/Help/Image/continuedFraction-D.svg)

Numbers whose base three representation contains no two,
OEIS [A005836](https://oeis.org/A005836):

~~~
0:2186.select { :n |
	n.digitCount(3, 2) = 0
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-M.svg)

Rowland’s sequence with _m=7_,
step plot,
OEIS [A106108](https://oeis.org/A106108):

~~~
7.rowlandsSequence(200)
.stepPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-A.svg)

Plot first few terms of _s1={0,1}_:

~~~
[0 1].stanleySequence(192).scatterPlot
~~~

![](sw/spl/Help/Image/stanleySequence-A.svg)

## Interleaved Ascents

Number of integers less than _n_ but with the same number of divisors,
OEIS [A047983](https://oeis.org/A047983):

~~~
1:150.collect { :n |
	let tau = 0.divisorSigma(n);
	let m = n - 1;
	1:m.count { :x |
		0.divisorSigma(x) = tau
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-H.svg)

Earliest sequence with _a(a(n))=6n_,
OEIS [A054786](https://oeis.org/A054786):

~~~
let a = Map { :n |
	let m = n % 12;
	[
		{ [0 6].includes(m) } -> {
			6 * a[n/6]
		},
		{ [1 3 8 10].includes(m) } -> {
			n + 1
		},
		{ [2 4 9 11].includes(m) } -> {
			6 * n - 6
		},
		{ m = 5 } -> {
			n + 1
		},
		{ m = 7 } -> {
			6 * n - 12
		}
	].which
};
a[1:115].scatterPlot
~~~

![](sw/spl/Help/Image/which-B.svg)

Plot first few terms:

~~~
1:200.collect { :n |
	n.wythoffIndex[1] - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffIndex-A.svg)

## Interleaved Ascents, Grouped

Scatter plot of the
least number _k<n_ and coprime to _n_ such that the largest term of the continued fraction of _k/n_ is as small as possible,
OEIS [A141821](https://oeis.org/A141821):

~~~
2:108.collect { :n |
	let k = (1 .. n - 1).select { :x |
		x.isCoprime(n)
	};
	let c = (k \ n).continuedFraction;
	let m = c.collect(max:/1);
	let i = m.indexOf(m.min);
	k[i]
}.scatterPlot
~~~

![](sw/spl/Help/Image/continuedFraction-A.svg)

Numerators of rationals _≥1_ whose continued fractions consist only of ones and twos,
OEIS [A072728](https://oeis.org/A072728):

~~~
[
	1   2  3  5  5  8  7  8 12 13
	11 12 13 19 19 21 17 18 19 19
	21 29 31 30 31 34 27 26 29 29
	31 30 31 34 46 45 50 46 49 49
	50 55 41 44 41 43 47 46 45 50
	46 49 49 50 55
].scatterPlot
~~~

![](sw/spl/Help/Image/continuedFraction-C.svg)

## Leaning Peaks

Absolute value of the first digit of _n_ minus the last digit,
OEIS [A040163](https://oeis.org/A040163):

~~~
1:125.collect { :n |
	let d = n.integerDigits;
	(d.first - d.last).abs
}.discretePlot
~~~

![](sw/spl/Help/Image/abs-D.svg)

Absolute value of the first digit of _n_ minus the sum of the remaining digits,
OEIS [A040997](https://oeis.org/A040997):

~~~
50:175.collect { :n |
	let d = n.integerDigits;
	(d.first - d.allButFirst.sum).abs
}.discretePlot
~~~

![](sw/spl/Help/Image/abs-E.svg)

Alternating sum of decimal expansion of _n_,
[A225693](https://oeis.org/A225693):

~~~
0:200.collect { :n |
	n.integerDigits
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-B.svg)

## Ruler

Plot column indices of the Wythoff array that contains _L(n)_,
OEIS [A255670](https://oeis.org/A255670):

~~~
1:65.collect { :n |
	let x = n.wythoffLower;
	1:Infinity.detect { :j |
		let y = 1:Infinity.detect { :i |
			wythoffArray(i, j) >= x
		};
		x = wythoffArray(y, j)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/wythoffLower-B.svg)

## Quasi-Ruler

Table of Hamming distances between binary vectors,
read by antidiagonals,
OEIS [A101080](https://oeis.org/A101080):

~~~
0:11.antidiagonalArray { :n :k |
	n.bitXor(k).hammingWeight
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/hammingWeight-S.svg)

## Left-Right Symmetry, Broken At Right Edge

The Vedic square where _n=9_,
OEIS [A125959](https://oeis.org/A125959)

~~~
9.vedicSquare.catenate.discretePlot
~~~

![](sw/spl/Help/Image/vedicSquare-D.svg)

## Interleaved Quasi-Shadow

Plot the number of ways to express _n_ as the sum of an odd prime, a positive Fibonacci number and twice a positive Fibonacci number,
OEIS [A155114](https://oeis.org/A155114):

~~~
let pq = { :m |
	m > 2 & { m.isPrime }
};
1:99.collect { :n |
	let a = 2 * 2.max(n / 2).log(2);
	2:a.collect { :x |
		let b = 2 * x.fibonacci;
		let c = 2 * 2.max(n - b).log(2);
		2:c.collect { :y |
			pq(n - b - y.fibonacci).boole
		}.sum
	}.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-J.svg)

## Ascent, With Gaps

Plot zero unless _n_ is a non-prime, in which case plot index,
OEIS [A239968](https://oeis.org/A239968):

~~~
let k = 0;
1:100.collect { :n |
	n.isPrime.if {
		0
	} {
		k := k + 1;
		k
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/isPrime-F.svg)

Characteristic function of primes multiplied by _n_,
OEIS [A061397](https://oeis.org/A061397):

~~~
1:99.collect { :n |
	n * n.isPrime.boole
}.discretePlot
~~~

![](sw/spl/Help/Image/isPrime-H.svg)

## Generally Ascending

Running sum of every third term in the _+1,-1_-version of Thue-Morse sequence,
OEIS [A005599](https://oeis.org/A005599):

~~~
0:200.collect { :n |
	0:n.sum { :k |
		-1 ^ (3 * k).hammingWeight
	}
}.linePlot
~~~

![](sw/spl/Help/Image/hammingWeight-R.svg)

## Signed Quasi-Symmetry

_a(2n)=-2*a(n)_ and _a(2n+1)=2*a(n)-1_,
OEIS [A104895](https://oeis.org/A104895):

~~~
let a = Map { :n |
	(n = 0).if {
		0
	} {
		n.isEven.if {
			2 * a[n / 2]
		} {
			-2 * a[(n - 1) / 2] - 1
		}
	}
};
a[0:150].scatterPlot
~~~

![](sw/spl/Help/Image/isEven-B.svg)

## Sparse Interleaved Ascents

Delayed divison of the Cloitre sequence,
OEIS [A135506](https://oeis.org/A135506):

~~~
1L.rowlandsSequence(150, lcm:/2)
.adjacentPairsCollect(/.swap)
.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-G.svg)

## Small Set, Varying Density

Plot the least maxima of
the least number _k<n_ and coprime to _n_ such that the largest term of the continued fraction of _k/n_ is as small as possible,
OEIS [A141822](https://oeis.org/A141822):

~~~
2:67.collect { :n |
	let k = (1 .. n - 1).select { :x |
		x.isCoprime(n)
	};
	(k \ n)
	.continuedFraction
	.collect(max:/1)
	.min
}.stepPlot
~~~

![](sw/spl/Help/Image/continuedFraction-B.svg)

Count the number steps to reach a particular stop condition when iterating a map,
OEIS [A063574](https://oeis.org/A063574):

~~~
1:105.collect { :n |
	{ :x |
		x.isEven.if {
			(3 * x) / 2
		} {
			(3 * x + 1) / 2
		}
	}.nestWhileList(n) { :x |
		x % 4 != 1
	}.size - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/nestWhileList-A.svg)

## Small Set, Varying Density, Patterned

_⌊(σ(n^2)/σ(n))_,
OEIS [A079553](https://oeis.org/A079553):

~~~
1:65.collect { :n |
	(
		0.divisorSigma(n ^ 2)
		/
		0.divisorSigma(n)
	).floor
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-R.svg)

Multiplicative persistence,
OEIS [A031346](https://oeis.org/A031346):

~~~
1:85.collect { :n |
	{ :x |
		x.integerDigits.product
	}.nestWhileList(n) { :x |
		x >= 10
	}.size - 1
}.stepPlot
~~~

![](sw/spl/Help/Image/nestWhileList-B.svg)

Two-multiplicative persistence,
OEIS [A031348](https://oeis.org/A031348):

~~~
1:65.collect { :n |
	{ :x |
		(x.integerDigits ^ 2).product
	}.nestWhileList(n) { :x |
		x > 1
	}.size - 1
}.stepPlot
~~~

![](sw/spl/Help/Image/nestWhileList-C.svg)

## Intermediate Set, Varying Density

Plot shadow transform of _σ(n)_,
OEIS [A072463](https://oeis.org/A072463):

~~~
let s = Map { :n |
	1.divisorSigma(n)
};
0:150.collect { :n |
	let m = n - 1;
	0:m.sum { :j |
		(s[j] % n = 0).boole
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-M.svg)

Sum of σ of `divisors` of _n_,
OEIS [A007425](https://oeis.org/A007425):

~~~
1:100.collect { :n |
	n.divisors.sum { :d |
		0.divisorSigma(d)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-O.svg)

Number of divisors of _2n-1_,
OEIS [A099774](https://oeis.org/A099774):

~~~
1:65.collect { :n |
	0.divisorSigma(2 * n - 1)
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-Q.svg)

## Triangle, Arcs, Irregular

Triangle of coefficients of the Lucas polynomials,
OEIS [A114525](https://oeis.org/A114525):

~~~
0:17.collect { :n |
	n.lucasPolynomial
	.coefficientList
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/lucasPolynomial-A.svg)

## Triangle, Descents, Bands, Irregular

Bitwise logical implies triangular array,
_k→n_,
OEIS [A265705](https://oeis.org/A265705):

~~~
0:19.triangularArray(bitImplies:/2.swap)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitImplies-A.svg)

Bitwise logical implication _n→2n_,
OEIS [A265716](https://oeis.org/A265716):

~~~
0:85.collect { :n |
	n.bitImplies(2 * n)
}.discretePlot
~~~

![](sw/spl/Help/Image/bitImplies-B.svg)

## Triangle, Ascents, Oscillations

Bitwise logical implication _n→2n_,
scatter plot,
OEIS [A265716](https://oeis.org/A265716):

~~~
0:127.collect { :n |
	n.bitImplies(2 * n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitImplies-C.svg)

Bitwise logical implication _n→P(n)_,
OEIS [A265885](https://oeis.org/A265885):

~~~
1:85.collect { :n |
	n.bitImplies(n.prime)
}.discretePlot
~~~

![](sw/spl/Help/Image/bitImplies-D.svg)

## Mostly Regular Ascent

Cube free numbers,
OEIS [A004709](https://oeis.org/A004709):

~~~
1:100.select(isCubeFree:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/isCubeFree-A.svg)

Cubeful numbers,
OEIS [A046099](https://oeis.org/A046099):

~~~
1:500.reject(isCubeFree:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/isCubeFree-B.svg)

## Ascent, Horizon, Descent

Numerators of Bernoulli numbers,
`log` scale plot,
OEIS [A027641](https://oeis.org/A027641):

~~~
0:50.bernoulliNumber
.numerator
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliNumber-B.svg)

Genocchi numbers,
OEIS [A036968](https://oeis.org/A036968):

~~~
0:27.genocchiNumber
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/genocchiNumber-A.svg)

## Ascents, Mostly Descents

Abundance of _n_,
OEIS [A033880](https://oeis.org/A033880):

~~~
let n = 1:70;
(1.divisorSigma(n) - (2 * n)).discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-V.svg)

## Many Interleaved Ascents

Inverse Moebius transform applied twice to natural numbers,
OEIS [A007429](https://oeis.org/A007429):

~~~
1:65.collect { :n |
	1.divisorSigma(n.divisors).sum
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-N.svg)

Unique sequence representing an array read by antidiagonals in which the _i_-th row is this sequence itself multiplied by _i_,
OEIS [A283681](https://oeis.org/A283681):

~~~
{ :x |
	let k = x.size + 1;
	1:k.collect { :n |
		let m = n - 1;
		1:m:1.collect { :i |
			x[n - i] * i
		}
	}.flatten
}.iterate([1 2], 4).scatterPlot
~~~

![](sw/spl/Help/Image/iterate-C.svg)

## Many Interleaved Ascents, Varying Density

Smallest _k_ such that _σ(k)=n_, or zero if there is no such _k_,
OEIS [A051444](https://oeis.org/A051444):

~~~
let m = 10 ^ 2;
1:89.collect { :n |
	let k = 1;
	{
		1.divisorSigma(k) != n & {
			k < m
		}
	}.whileTrue {
		k := k + 1
	};
	(k = m).if { 0 } { k }
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-F.svg)

A sequence by David James Sycamore,
OEIS [A345147](https://oeis.org/A345147):

~~~
let a = [1];
let s = [];
let m = 250;
1.toDo(m) { :i |
	let p = a.last;
	let q = a.allButLast;
	let r = nil;
	q.includes(p).not.if {
		a.add(0.divisorSigma(p))
	} {
		a.add(p + s[1]);
		s := s.allButFirst
	};
	r := a.secondLast;
	s.insertAt(
		r,
		s.lengthWhile { :x |
			x < r
		} + 1
	)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-T.svg)

## Many Interleaved Descents, Varying Density

Coefficients in expansion of Eisenstein series _E2_,
OEIS [A006352](https://oeis.org/A006352):

~~~
(
	-24 * 1:65.collect { :n |
		1.divisorSigma(n)
	}
).discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-W.svg)

## Intricate Arch, Repeating, Growing

Stern’s diatomic array,
discrete plot,
OEIS [A049456](https://oeis.org/A049456):

~~~
6.sternsDiatomicArray
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-A.svg)

Stern’s diatomic array,
scatter plot,
OEIS [A049456](https://oeis.org/A049456):

~~~
8.sternsDiatomicArray
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-B.svg)

Stern’s diatomic array,
version two,
OEIS [A070878](https://oeis.org/A070878):

~~~
8.sternsDiatomicArray('B')
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-C.svg)

Stern’s diatomic array,
version three,
OEIS [A070879](https://oeis.org/A070879):

~~~
8.sternsDiatomicArray('C')
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-D.svg)

## Intricate Trough, Repeating, Growing

Partition array for the products of the hook lengths corresponding to the partitions of _n_,
OEIS [A263003](https://oeis.org/A263003):

~~~
1:11.collect { :n |
	n.integerPartitions.collect { :p |
		p.hookLengths.catenate.product
	}
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/hookLengths-A.svg)

* * *

0,1 Sequences: A361463 A008966 A010054 A096268 A073059 A098725 A035263 A189920 A023531 A014577 A209229 A047999 A010057 A086747 A010059 A079944 A097806 A010052 A040051 A035263 A079559 A289016 A010056 A036987 A051731 A237048 A010051 A143536 A104894 A006340 A188294 A330037 A064841

0,1,2 Sequences: A054635

-1,1 Sequences: A076479 A033999 A008836 A106400 A034947 A020985

-1,0,1 Sequences: A343173 A014677 A054525 A089045 A100047 A029883 A160357 A011584 A011587 A010815 A091337 A014677 A013595

1,2 Sequences: A001468

1,3 Sequences: A122567

2,3 Sequences: A076662

1-4 Sequences: A053238

0-9 Sequences: A007376 A353109

Signed Sequences:
