# Integer Sequence Image Index

The number of finite groups of order _n_,
OEIS [A000001](https://oeis.org/A000001):

~~~spl
0:30.finiteGroupCount
.discretePlot
~~~

![](sw/spl/Help/Image/finiteGroupCount-A.svg)

The number of finite groups of order _n_,
log scale scatter plot,
OEIS [A000001](https://oeis.org/A000001):

~~~spl
1:250.finiteGroupCount
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/finiteGroupCount-B.svg)

All of the `data` given in the OEIS entry proper,
OEIS [A000001](https://oeis.org/A000001):

~~~spl
OeisEntry('A000001').then { :e |
	e.data
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/OeisEntry-A.svg)

The first few items of `bFileData`,
as given in B-file associated with the OEIS entry,
OEIS [A000001](https://oeis.org/A000001):

~~~spl
OeisEntry('A000001').then { :e |
	e.bFileData
	.first(250)
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/OeisEntry-B.svg)

The _1,2_ Kolakoski sequence,
OEIS [A000002](https://oeis.org/A000002):

~~~spl
37.kolakoskiSequence
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-A.svg)

The _1,2_ Kolakoski sequence,
OEIS [A000002](https://oeis.org/A000002),
offset terms to be at `zero` and `one`:

~~~spl
(85.kolakoskiSequence - 1)
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-B.svg)

Divisor function _σ₀(n)_ up to _n=100_,
OEIS [A000005](https://oeis.org/A000005):

~~~spl
1:100.functionPlot { :x |
	0.divisorSigma(x)
}
~~~

![](sw/spl/Help/Image/divisorSigma-A.svg)

_σ₀(n)_,
also called _τ(n)_,
OEIS [A000005](https://oeis.org/A000005):

~~~spl
let n = 200;
0.divisorSigma(1:n).scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-D.svg)

Integer part of square root of _n_-th prime,
OEIS [A000006](https://oeis.org/A000006):

~~~spl
1:65.prime.sqrt.integerPart.stepPlot
~~~

![](sw/spl/Help/Image/integerPart-D.svg)

The Euler totient function,
OEIS [A000010](https://oeis.org/A000010):

~~~spl
1:50.functionPlot(eulerPhi:/1)
~~~

![](sw/spl/Help/Image/eulerPhi-A.svg)

Mosaic numbers,
OEIS [A000026](https://oeis.org/A000026):

~~~spl
1:75.collect { :n |
	n.factorInteger.catenate.product
}.discretePlot
~~~

![](sw/spl/Help/Image/factorInteger-M.svg)

Identity,
OEIS [A000027](https://oeis.org/A000027):

~~~spl
1:23.collect(
	dirichletConvolve(
		{ :n | n },
		{ :n | (n - 1).kroneckerDelta }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-F.svg)

Initial digit of _n_,
OEIS [A000030](https://oeis.org/A000030):

~~~spl
0:100.collect { :n |
	n.decimalExpansion.first
}.stepPlot
~~~

![](sw/spl/Help/Image/decimalExpansion-B.svg)

The _01_ sequence,
discrete plot,
OEIS [A000035](http://oeis.org/A000035):

~~~spl
[0 1].repeat(30).discretePlot
~~~

![](sw/spl/Help/Image/repeat-B.svg)

Primes up to one-thousand,
OEIS [A000040](https://oeis.org/A000040):

~~~spl
1:999.select(isPrime:/1).linePlot
~~~

![](sw/spl/Help/Image/isPrime-A.svg)

Prime numbers,
OEIS [A000040](https://oeis.org/A000040):

~~~spl
1:50.functionPlot(prime:/1)
~~~

![](sw/spl/Help/Image/prime-A.svg)

The number of unrestricted partitions,
OEIS [A000041](https://oeis.org/A000041):

~~~spl
0:50.functionPlot { :x |
	x.partitionFunctionP.log10
}
~~~

![](sw/spl/Help/Image/partitionFunctionP-A.svg)

Number of solutions to _x^2+1=0_ modulo _n_,
OEIS [A000089](https://oeis.org/A000089):

~~~spl
1:135.collect { :n |
	1:n.collect { :m |
		(m ^ 2 + 1) / n
	}.select(isInteger:/1).size
}.discretePlot
~~~

![](sw/spl/Help/Image/power-F.svg)

Number of fixed points of _γ0(n)_ of type _i_,
OEIS [A000095](https://oeis.org/A000095):

~~~spl
let k = { :d |
	-1.kroneckerSymbol(d)
};
1:85.collect { :n |
	(n <= 1 | { n % 4 = 0 }).if {
		(n = 1).boole
	} {
		let t = 1;
		n.divisors.do { :d |
			d.isPrime.ifTrue {
				t := t * (1 + k(d))
			}
		};
		t
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-H.svg)

Bell numbers,
discrete log plot,
OEIS [A000110](https://oeis.org/A000110):

~~~spl
1:99.bellNumber.log.discretePlot
~~~

![](sw/spl/Help/Image/bellNumber-A.svg)

Number of transformation groups of order _n_,
OEIS [A000113](https://oeis.org/A000113):

~~~spl
1:135.collect { :n |
	let i = n.integerExponent(2);
	let j = n.integerExponent(3);
	let a = n.divisors.sum { :d |
		d.moebiusMu ^ 2 / d
	};
	let b = 2 ^ 3.min(i // 2);
	let c = 3 ^ (1 < j).boole;
	n * a / (b * c)
}.scatterPlot
~~~

![](sw/spl/Help/Image/moebiusMu-H.svg)

Number of ways of writing _n_ as a sum of four squares,
OEIS [A000118](https://oeis.org/A000118):

~~~spl
0:250.collect { :n |
	4.squaresR(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/squaresR-C.svg)

Number of representations of _n_ as a sum of distinct Fibonacci numbers,
OEIS [A000119](https://oeis.org/A000119):

~~~spl
1:150.collect { :n |
	let a = Polynomial([0: 1, n: n]);
	let m = 2;
	let f = m.fibonacci;
	{ f <= n }.whileTrue {
		a := a * Polynomial([0: 1, f: 1]);
		m := m + 1;
		f := m.fibonacci
	};
	a.coefficientList.at(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacci-I.svg)

The number of ones in the base-two representation,
called the Hamming weight or binary weight,
OEIS [A000120](https://oeis.org/A000120):

~~~spl
1:63.functionPlot { :each |
	each.digitCount(2, 1)
}
~~~

![](sw/spl/Help/Image/digitCount-A.svg)

The sum of the digits of _n_,
where _b=2_,
OEIS [A000120](http://oeis.org/A000120):

~~~spl
1:250.collect { :n |
	n.digitSum(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitSum-B.svg)

Hamming weight,
OEIS [A000120](https://oeis.org/A000120):

~~~spl
0:99.hammingWeight.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-A.svg)

Hamming weight of the first eight-bit integers,
line plot,
OEIS [A000120](https://oeis.org/A000120):

~~~spl
0:255.hammingWeight.linePlot
~~~

![](sw/spl/Help/Image/hammingWeight-B.svg)

Number of partitions of _n_ into two squares,
OEIS [A000161](https://oeis.org/A000161):

~~~spl
1:107.collect { :n |
	let m = ((n - 1) // 2);
	let a = m.integerSquareRoot + 1;
	let b = n.integerSquareRoot;
	a:b.sum { :k |
		(n - (k ^ 2))
		.isPerfectSquare
		.boole
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/integerSquareRoot-A.svg)

Number of partitions of _n_ into three squares,
allowing part zero,
OEIS [A000164](https://oeis.org/A000164):

~~~spl
1:115.collect { :n |
	let m = n.integerSquareRoot;
	0:m.sum { :i |
		0:i.sum { :j |
			0:j.sum { :k |
				let p = [i j k] ^ 2;
				(p.sum = n).boole
			}
		}
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/boole-C.svg)

Shadow transform of the squares,
OEIS [A000188](https://oeis.org/A000188):

~~~spl
1:150.collect { :n |
	1:n.count { :x |
		x.powerMod(2, n) = 0
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-H.svg)

The lower Wythoff sequence,
OEIS [A000201](https://oeis.org/A000201):

~~~spl
1:23.wythoffLower.stepPlot
~~~

![](sw/spl/Help/Image/wythoffLower-A.svg)

Divisor function _σ₁(n)_ up to _n=100_,
OEIS [A000203](https://oeis.org/A000203):

~~~spl
1:100.functionPlot { :x |
	1.divisorSigma(x)
}
~~~

![](sw/spl/Help/Image/divisorSigma-B.svg)

The sum of divisors for the first fifty numbers,
OEIS [A000203](https://oeis.org/A000203):

~~~spl
1:50.functionPlot { :n |
	n.divisorSum(identity:/1)
}
~~~

![](sw/spl/Help/Image/divisorSum-A.svg)

Triangular numbers,
OEIS [A000217](https://oeis.org/A000217):

~~~spl
0:23.collect { :n |
	3.polygonalNumber(n)
}.linePlot
~~~

![](sw/spl/Help/Image/polygonalNumber-A.svg)

Triangular numbers,
OEIS [A000217](https://oeis.org/A000217):

~~~spl
1:12.prefixSum.discretePlot
~~~

![](sw/spl/Help/Image/prefixSum-A.svg)

Number of squares modulo _n_,
OEIS [A000224](https://oeis.org/A000224):

~~~spl
1:150.collect { :n |
	1:n.collect { :k |
		k.square % n
	}.nub.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/mod-H.svg)

Binary expansion of square numbers,
matrix plot,
OEIS [A000290](https://oeis.org/A000290):

~~~spl
1:42.square
.binaryExpansion
.padLeft
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/square-A.svg)

Square numbers,
OEIS [A000290](https://oeis.org/A000290):

~~~spl
0:65.square.discretePlot
~~~

![](sw/spl/Help/Image/square-D.svg)

Tetrahedral numbers,
OEIS [A000292](https://oeis.org/A000292):

~~~spl
0:65.tetrahedralNumber.discretePlot
~~~

![](sw/spl/Help/Image/tetrahedralNumber-A.svg)

Pentagonal numbers,
OEIS [A000326](https://oeis.org/A000326):

~~~spl
1:85.pentagonalNumber.discretePlot
~~~

![](sw/spl/Help/Image/pentagonalNumber-A.svg)

Square pyramidal numbers,
OEIS [A000330](https://oeis.org/A000330):

~~~spl
0:65.squarePyramidalNumber
.discretePlot
~~~

![](sw/spl/Help/Image/squarePyramidalNumber-A.svg)

Sum of the coefficients of the terms with an even exponent in the Stern polynomial _B(n+1,t)_,
OEIS [A000360](https://oeis.org/A000360):

~~~spl
let a = Map { :n |
	(n = 0).if {
		1
	} {
		n.isOdd.if {
			let m = (n - 1) / 2 - 1 % 3;
			a[(n - 1) / 2] - m + 1
		} {
			a[n / 2] + a[n / 2 - 1]
		}
	}
};
a[0:200].scatterPlot
~~~

![](sw/spl/Help/Image/isOdd-D.svg)

Divisor sum of Kronecker symbol _-6,d_,
the coefficients of the powers of _q_ in Fine’s equation,
OEIS [A000377](https://oeis.org/A000377):

~~~spl
1:85.collect { :n |
	n.divisorSum { :d |
		-6.kroneckerSymbol(d)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-L.svg)

_⌊(cos(n))_,
OEIS [A000480](https://oeis.org/A000480):

~~~spl
0:85.cos.floor
.discretePlot
~~~

![](sw/spl/Help/Image/cos-I.svg)

Nearest integer to _cos(n)_,
OEIS [A000484](https://oeis.org/A000484):

~~~spl
0:85.cos.round
.discretePlot
~~~

![](sw/spl/Help/Image/cos-H.svg)

_⌊(sin(n))_,
OEIS [A000493](https://oeis.org/A000493):

~~~spl
0:85.sin.floor.discretePlot
~~~

![](sw/spl/Help/Image/sin-M.svg)

Nearest integer to _sin(n)_,
OEIS [A000494](https://oeis.org/A000494):

~~~spl
0:200.sin.round.discretePlot
~~~

![](sw/spl/Help/Image/sin-L.svg)

_|⌊(tan(n))_,
unsigned variant of
OEIS [A000503](https://oeis.org/A000503):

~~~spl
0:150.tan.floor.abs.log.scatterPlot
~~~

![](sw/spl/Help/Image/tan-C.svg)

_⌊(tan(n))_,
OEIS [A000503](https://oeis.org/A000503):

~~~spl
0:150.tan.floor.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/tan-D.svg)

Binary expansion of cubic numbers,
matrix plot,
OEIS [A000578](https://oeis.org/A000578):

~~~spl
0:63.cube
.binaryExpansion
.padLeft
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/cube-A.svg)

Cubic numbers,
OEIS [A000578](https://oeis.org/A000578):

~~~spl
0:65.cube.discretePlot
~~~

![](sw/spl/Help/Image/cube-B.svg)

The Ramanujan τ function,
logarithmic plot,
OEIS [A000594](https://oeis.org/A000594):

~~~spl
1:33
.collect(ramanujanTau:/1)
.logScale
.stepPlot
~~~

![](sw/spl/Help/Image/ramanujanTau-A.svg)

The Ramanujan τ function,
further terms,
OEIS [A000594](https://oeis.org/A000594):

~~~spl
1:85
.collect(ramanujanTau:/1)
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/ramanujanTau-B.svg)

Discrete plot of first few terms,
OEIS [A000688](https://oeis.org/A000688):

~~~spl
0:50.finiteAbelianGroupCount
.discretePlot
~~~

![](sw/spl/Help/Image/finiteAbelianGroupCount-A.svg)

Scatter plot of first few terms,
OEIS [A000688](https://oeis.org/A000688):

~~~spl
1:125.finiteAbelianGroupCount
.scatterPlot
~~~

![](sw/spl/Help/Image/finiteAbelianGroupCount-B.svg)

The prime counting function _π(n)_,
OEIS [A000720](https://oeis.org/A000720):

~~~spl
1:60.primePi.discretePlot
~~~

![](sw/spl/Help/Image/primePi-A.svg)

Total number of ones in binary expansions,
OEIS [A000788](https://oeis.org/A000788):

~~~spl
0:47.hammingWeight
.prefixSum
.scatterPlot
~~~

![](sw/spl/Help/Image/prefixSum-I.svg)

Scatter plot of the digits of π,
OEIS [A000796](https://oeis.org/A000796):

~~~spl
1.pi(104)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/pi-A.svg)

Number of ordered ways of writing _n_ as a sum of two squares of nonnegative integers,
OEIS [A000925](https://oeis.org/A000925):

~~~spl
0:75.collect { :n |
	[1 1].frobeniusSolve(n)
	.count { :x |
		x.allSatisfy(isPerfectSquare:/1)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-D.svg)

The Padovan sequence,
OEIS [A000931](https://oeis.org/A000931):

~~~spl
35.padovanSequence([1 0 0])
.discretePlot
~~~

![](sw/spl/Help/Image/padovanSequence-A.svg)

Flavius Josephus’s sieve,
OEIS [A000960](https://oeis.org/A000960):

~~~spl
1:65.collect { :n |
	let m = n - 1;
	m:1:-1.injectInto(n) { :a :b |
		b * (a / b + 1).ceiling
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/injectInto-B.svg)

The super Catalan numbers,
OEIS [A001003](https://oeis.org/A001003):

~~~spl
1:25.superCatalanNumber.log.discretePlot
~~~

![](sw/spl/Help/Image/superCatalanNumber-A.svg)

Motzkin numbers,
log scale discrete plot,
OEIS [A001006](https://oeis.org/A001006):

~~~spl
1:35.motzkinNumber.log.discretePlot
~~~

![](sw/spl/Help/Image/motzkinNumber-A.svg)

The multiplicative partition function,
OEIS [A001055](https://oeis.org/A001055):

~~~spl
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

Canonical enumeration of integers,
OEIS [A001057](https://oeis.org/A001057):

~~~spl
0:99.collect { :n |
	(-1 ^n) * (n / 2).ceiling
}.discretePlot
~~~

![](sw/spl/Help/Image/ceiling-B.svg)

Alternate positive and negative integers,
OEIS [A001057](https://oeis.org/A001057)
without the leading zero:

~~~spl
let n = 1:35;
[n, -n].interleave.discretePlot
~~~

![](sw/spl/Help/Image/interleave-A.svg)

Aliquot sums,
OEIS [A001065](https://oeis.org/A001065):

~~~spl
1:119.aliquotSum.linePlot
~~~

![](sw/spl/Help/Image/aliquotSum-A.svg)

List of twin primes,
OEIS [A001097](https://oeis.org/A001097):

~~~spl
let a = 3:1607.select(
	isLesserTwinPrime:/1
);
[a, a + 2]
.interleave
.deleteDuplicates
.discretePlot
~~~

![](sw/spl/Help/Image/isLesserTwinPrime-B.svg)

Step plot of _σ3(n)_,
OEIS [A001158](https://oeis.org/A001158):

~~~spl
1:100.collect { :n |
	3.divisorSigma(n)
}.stepPlot
~~~

![](sw/spl/Help/Image/divisorSigma-J.svg)

Pisano periods,
OEIS [A001175](https://oeis.org/A001175):

~~~spl
1:200.collect(pisanoPeriod:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-A.svg)

The number of distinct prime factors,
OEIS [A001221](https://oeis.org/A001221):

~~~spl
1:99.functionPlot { :each |
	each.factorInteger.size
}
~~~

![](sw/spl/Help/Image/factorInteger-A.svg)

The `primeNu` sequence for the first 100 numbers,
OEIS [A001221](https://oeis.org/A001221):

~~~spl
1:100.functionPlot(primeNu:/1)
~~~

![](sw/spl/Help/Image/primeNu-A.svg)

Number of prime divisors of _n_,
counted with multiplicity,
OEIS [A001222](https://oeis.org/A001222):

~~~spl
1:100.functionPlot(primeOmega:/1)
~~~

![](sw/spl/Help/Image/primeOmega-A.svg)

First differences of 23-rough numbers,
apart from first term also, initially,
differences between consecutive primes
OEIS [A001223](https://oeis.org/A001223):

~~~spl
1:750.select { :each |
	each.isRoughNumber(23)
}.differences.scatterPlot
~~~

![](sw/spl/Help/Image/isRoughNumber-E.svg)

Prime gaps,
differences between consecutive primes,
OEIS [A001223](https://oeis.org/A001223):

~~~spl
1:99.functionPlot(primeGap:/1)
~~~

![](sw/spl/Help/Image/primeGap-A.svg)

Prime gaps,
differences between consecutive primes,
scatter plot,
OEIS [A001223](https://oeis.org/A001223):

~~~spl
1:200.collect(primeGap:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/primeGap-B.svg)

Number of odd divisors of _n_,
OEIS [A001227](https://oeis.org/A001227):

~~~spl
1:105.collect { :n |
	(n.divisors % 2).sum
}.stepPlot
~~~

![](sw/spl/Help/Image/divisors-G.svg)

Narayana numbers,
OEIS [A001263](https://oeis.org/A001263):

~~~spl
1:11.triangularArray(
	narayanaNumber:/2
).catenate.log.discretePlot
~~~

![](sw/spl/Help/Image/narayanaNumber-A.svg)

Gould’s sequence,
OEIS [A001316](https://oeis.org/A001316):

~~~spl
0:64.functionPlot(
	gouldsNumber:/1
)
~~~

![](sw/spl/Help/Image/gouldsNumber-A.svg)

Gould’s sequence,
log scale scatter plot,
OEIS [A001316](https://oeis.org/A001316):

~~~spl
99.gouldsSequence
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/gouldsSequence-A.svg)

Generalized pentagonal numbers,
OEIS [A001318](https://oeis.org/A001318):

~~~spl
100.generalisedPentagonalNumbers
.stepPlot
~~~

![](sw/spl/Help/Image/generalisedPentagonalNumbers-A.svg)

Semiprime numbers,
OEIS [A001358](https://oeis.org/A001358):

~~~spl
1:250.select(isSemiprime:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isSemiprime-A.svg)

Lesser of twin primes,
OEIS [A001359](https://oeis.org/A001359):

~~~spl
3:1607
.select(isLesserTwinPrime:/1)
.linePlot
~~~

![](sw/spl/Help/Image/isLesserTwinPrime-A.svg)

Sum of the prime factors of _n_,
OEIS [A001414](https://oeis.org/A001414):

~~~spl
1:75.collect { :n |
	n.primeFactors.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeFactors-C.svg)

Golomb’s sequence,
OEIS [A001462](https://oeis.org/A001462):

~~~spl
98.golombsSequence
.discretePlot
~~~

![](sw/spl/Help/Image/golombsSequence-A.svg)

Partial sums of Golomb’s sequence,
OEIS [A001463](https://oeis.org/A001463):

~~~spl
98.golombsSequence.prefixSum
.discretePlot
~~~

![](sw/spl/Help/Image/golombsSequence-B.svg)

A block-fractal and reverse block-fractal sequence,
OEIS [A001468](https://oeis.org/A001468):

~~~spl
[
	1 -> [1 2],
	2 -> [1 2 2]
].substitutionSystem([1], 4)
.last
.stepPlot
~~~

![](sw/spl/Help/Image/substitutionSystem-H.svg)

The ruler function,
OEIS [A001511](https://oeis.org/A001511):

~~~spl
1:47.collect(rulerFunction:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/rulerFunction-A.svg)

The Perrin sequence,
OEIS [A001608](https://oeis.org/A001608):

~~~spl
35.perrinSequence.discretePlot
~~~

![](sw/spl/Help/Image/perrinSequence-A.svg)

The Dedekind ψ function,
OEIS [A001615](https://oeis.org/A001615):

~~~spl
1:250.dedekindPsi
.scatterPlot
~~~

![](sw/spl/Help/Image/dedekindPsi-A.svg)

Dedekind ψ function,
OEIS [A001615](https://oeis.org/A001615):

~~~spl
1:115.collect(
	dirichletConvolve(
		{ :j | j },
		{ :j | j.moebiusMu ^ 2 }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-A.svg)

Dedekind ψ function,
OEIS [A001615](https://oeis.org/A001615):

~~~spl
1:69.collect { :n |
	n * n.divisorSum { :d |
		d.moebiusMu ^ 2 / d
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-I.svg)

Least primitive root of _n_-th prime,
OEIS [A001918](https://oeis.org/A001918):

~~~spl
1:66.collect { :n |
	n.prime.primitiveRootList.min
}.stepPlot
~~~

![](sw/spl/Help/Image/primitiveRootList-C.svg)

The self-counting sequence,
OEIS [A002024](https://oeis.org/A002024):

~~~spl
1:85.collect(selfCountingNumber:/1)
.stepPlot
~~~

![](sw/spl/Help/Image/selfCountingNumber-A.svg)

The self-counting sequence,
discrete plot,
OEIS [A002024](https://oeis.org/A002024):

~~~spl
65.selfCountingSequence.discretePlot
~~~

![](sw/spl/Help/Image/selfCountingSequence-A.svg)

Number of perfect partitions of _n_,
OEIS [A002033](https://oeis.org/A002033):

~~~spl
let a = Map { :n |
	(n < 2).if {
		n
	} {
		let d = n.divisors;
		a.atAll(d.allButLast).sum
	}
};
a[1:200].log.scatterPlot
~~~

![](sw/spl/Help/Image/divisors-N.svg)

The [Kempner_function](https://en.wikipedia.org/wiki/Kempner_function),
also sometimes called the Smarandache function or Kempner numbers,
the smallest positive integer _m_ such that _n_ divides _m!_,
OEIS [A002034](https://oeis.org/A002034):

~~~spl
1:100.collect { :n |
	let m = 1;
	{
		m.!.divisible(n)
	}.whileFalse {
		m := m + 1
	};
	m
}.stepPlot
~~~

![](sw/spl/Help/Image/factorial-A.svg)

The Kempner function,
OEIS [A002034](https://oeis.org/A002034):

~~~spl
1:65.kempnerFunction.stepPlot
~~~

![](sw/spl/Help/Image/kempnerFunction-A.svg)

Least value of _m_ for which Liouville’s function is _-n_,
OEIS [A002053](https://oeis.org/A002053):

~~~spl
let l = 1:3000.liouvilleLambda.prefixSum;
0:65.collect { :n |
	l.indexOf(-n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-D.svg)

The cumulative `sum` of `eulerPhi`,
OEIS [A002088](https://oeis.org/A002088):

~~~spl
1:50.eulerPhi.prefixSum.linePlot
~~~

![](sw/spl/Help/Image/eulerPhi-B.svg)

Generalised sum of divisors function,
OEIS [A002129](https://oeis.org/A002129):

~~~spl
1:150.collect { :n |
	n.divisorSum { :x |
		0 - (-1 ^ x * x)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSum-B.svg)

Shuffling _2n_ cards,
OEIS [A002139](https://oeis.org/A002139):

~~~spl
1:200.collect { :n |
	let m = 2 * n - 1;
	let x = 2.multiplicativeOrder(m);
	(x = m.eulerPhi).if {
		let [p, k] = m.factorInteger.first;
		(x + 1) * (p ^ (k - 1)).eulerPhi
	} {
		x.lcm(x + 1)
	}
}.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-E.svg)

The first few Pythagorean primes,
OEIS [A002144](https://oeis.org/A002144):

~~~spl
1:1000.select(
	isPythagoreanPrime:/1
).scatterPlot
~~~

![](sw/spl/Help/Image/isPythagoreanPrime-A.svg)

The decimal digits of the natural logarithm of two,
OEIS [A002162](https://oeis.org/A002162):

~~~spl
'Ln(2)'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/namedConstant-A.svg)

Sprague-Grundy value for Grundy’s game when starting with _n_ tokens,
OEIS [A002188](https://oeis.org/A002188):

~~~spl
let k = 200;
let a = List(k + 2, 0);
0.toDo(k) { :i |
	let e = List(i // 2 + 1, 0);
	1.toDo((i + 1) // 2 - 1) { :j |
		let k = i - j;
		let l = a[j + 1].bitXor(a[k + 1]);
		e[l + 1] := 1
	};
	a[i + 1] := e.indexOf(0) - 1
};
a.allButLast.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-Q.svg)

Digits of Khinchin’s constant,
scatter plot,
OEIS [A002210](https://oeis.org/A002210):

~~~spl
'KhinchinsConstant'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/khinchinsConstant-A.svg)

Least positive prime primitive root of _n_-th prime,
OEIS [A002233](https://oeis.org/A002233):

~~~spl
2:85.collect { :n |
	n.prime.primitiveRootList
	.detect(isPrime:/1)
}.discretePlot
~~~

![](sw/spl/Help/Image/primitiveRootList-I.svg)

Positive integers with swaps according to Wythoff pairs,
OEIS [A002251](https://oeis.org/A002251):

~~~spl
let w = 1:65.collect(wythoffPair:/1);
let i = w.catenate;
let m = i.max;
let k = 1:m.complement(i).min;
let a = [1 .. m];
w.do { :p |
	a.swapWith(p[1], p[2])
};
a.first(k).scatterPlot
~~~

![](sw/spl/Help/Image/wythoffPair-C.svg)

Start counting again and again,
OEIS [A002260](https://oeis.org/A002260):

~~~spl
1:17.collect(iota:/1).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/iota-A.svg)

Prefixes of the natural numbers,
OEIS [A002260](https://oeis.org/A002260):

~~~spl
1:13.prefixes.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prefixes-B.svg)

_k_,
count and count again from zero,
OEIS [A002262](https://oeis.org/A002262):

~~~spl
0:9.triangularArray { :n :k |
	k
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/triangularArray-H.svg)

Quotient of _n_ and five,
OEIS [A002266](https://oeis.org/A002266):

~~~spl
0:40.collect { :n |
	n.quotientRemainder(5).first
}.discretePlot
~~~

![](sw/spl/Help/Image/quotientRemainder-A.svg)

Mertens’s function,
OEIS [A002321](https://oeis.org/A002321):

~~~spl
1:100.collect(mertensFunction:/1)
.stepPlot
~~~

![](sw/spl/Help/Image/mertensFunction-A.svg)

Mertens’s function,
OEIS [A002321](https://oeis.org/A002321):

~~~spl
1:250.moebiusMu.prefixSum.linePlot
~~~

![](sw/spl/Help/Image/moebiusMu-B.svg)

Glaisher’s J numbers,
OEIS [A002325](https://oeis.org/A002325):

~~~spl
1:150.collect { :n |
	n.divisors.sum { :d |
		-8.kroneckerSymbol(d)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-E.svg)

Order of two modulo _2n+1_,
OEIS [A002326](https://oeis.org/A002326):

~~~spl
2:150.collect { :n |
	2.multiplicativeOrder(2 * n + 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-H.svg)

Periods of reciprocals of integers coprime to ten,
OEIS [A002329](https://oeis.org/A002329):

~~~spl
2:600.select { :n |
	n.isCoprime(10)
}.collect { :n |
	(1 \ n).decimalPeriod
}.scatterPlot
~~~

![](sw/spl/Help/Image/decimalPeriod-C.svg)

Period of decimal expansion of reciprocal of the _n_-th prime,
OEIS [A002371](https://oeis.org/A002371):

~~~spl
1:175.prime.collect { :p |
	(1 \ p).decimalPeriod
}.scatterPlot
~~~

![](sw/spl/Help/Image/decimalPeriod-B.svg)

Largest prime _≤n_ in any decomposition of _2n_ into a sum of two odd primes,
OEIS [A002374](https://oeis.org/A002374):

~~~spl
3:150.collect { :n |
	let k = 0;
	{
		k < n & {
			(n - k).isPrime.not | {
				(n + k).isPrime.not
			}
		}
	}.whileTrue {
		k := k + 1
	};
	(k = n).if {
		n + 1
	} {
		n - k
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/isPrime-G.svg)

Number of decompositions of _2n_ into an unordered sum of two odd primes,
OEIS [A002375](https://oeis.org/A002375):

~~~spl
1:98.collect { :n |
	(2 * n).integerPartitions([2])
	.count { :p |
		p.allSatisfy(isPrime:/1) & {
			p.includes(2).not
		}
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-F.svg)

Palindromic primes,
OEIS [A002385](https://oeis.org/A002385):

~~~spl
1:6000.prime
.select(isPalindrome:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/isPalindrome-B.svg)

Expansion of Jacobi theta function _θ4(x)_,
OEIS [A002448](https://oeis.org/A002448):

~~~spl
0:500.collect { :n |
	let q = n.isPerfectSquare.boole;
	(-1 ^ n) * q * 2 - (n = 0).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/isPerfectSquare-E.svg)

Stern-Brocot sequence,
OEIS [A002487](https://oeis.org/A002487):

~~~spl
1:256
.collect(sternBrocotNumber:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotNumber-A.svg)

Stern’s diatomic series,
discrete plot,
OEIS [A002487](https://oeis.org/A002487):

~~~spl
200.sternBrocotSequence.discretePlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-A.svg)

Stern’s diatomic series,
scatter plot,
OEIS [A002487](https://oeis.org/A002487):

~~~spl
300.sternBrocotSequence.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-B.svg)

Earliest sequence with _a(a(n))=2n_,
OEIS [A002516](https://oeis.org/A002516):

~~~spl
let a = { :n |
	[
		{ n = 0 } -> {
			0
		},
		{ n % 2 = 0 } -> {
			2 * a(n / 2)
		},
		{ n % 4 = 1 } -> {
			n + 2
		},
		{ n % 4 = 3 } -> {
			2 * (n - 2)
		}
	].which
};
0:200.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/mod-Q.svg)

Number of ways of writing _n_ as a sum of at most two nonzero squares where order matters,
OEIS [A002654](https://oeis.org/A002654):

~~~spl
2:105.collect { :n |
	n.factorInteger.collect { :f |
		let [p, e] = f;
		(p = 2).if {
			1
		} {
			(p % 4 = 1).if {
				e + 1
			} {
				(e + 1) % 2
			}
		}
	}.product
}.discretePlot
~~~

![](sw/spl/Help/Image/factorInteger-O.svg)

Fibonacci modulo _n_,
OEIS [A002708](https://oeis.org/A002708):

~~~spl
1:75.collect { :n |
	n.fibonacci % n
}.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacci-D.svg)

Fibonacci modulo _n_,
OEIS [A002708](https://oeis.org/A002708):

~~~spl
0:250.collect { :n |
	n.fibonacciNumber % n
}.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacciNumber-A.svg)

Fibonacci modulo _n_,
OEIS [A002708](https://oeis.org/A002708):

~~~spl
let n = 201;
(n.fibonacciSequence % (0 .. 200))
.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacciSequence-A.svg)

Numbers that are divisible by each non-zero digit,
OEIS [A002796](https://oeis.org/A002796):

~~~spl
1:500.select { :n |
	n.integerDigits
	.select(isPositive:/1)
	.unique
	.allSatisfy { :x |
		n.divisible(x)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-F.svg)

Liouville’s function,
OEIS [A002819](https://oeis.org/A002819):

~~~spl
1:165.liouvilleLambda.prefixSum
.scatterPlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-C.svg)

The Ulam sequence,
OEIS [A002858](https://oeis.org/A002858):

~~~spl
80.ulamSequence.scatterPlot
~~~

![](sw/spl/Help/Image/ulamSequence-A.svg)

The inverse of the triangular numbers,
OEIS [A003056](https://oeis.org/A003056):

~~~spl
1:85.inverseTriangularNumber.discretePlot
~~~

![](sw/spl/Help/Image/triangularNumber-C.svg)

Sum of squares of digits of _n_,
OEIS [A003132](https://oeis.org/A003132):

~~~spl
0:200.collect { :n |
	n.integerDigits.square.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-U.svg)

_n⊻(n≫1)_,
OEIS [A003188](https://oeis.org/A003188):

~~~spl
0:115.collect { :n |
	n.bitXor(n >> 1)
}.discretePlot
~~~

![](sw/spl/Help/Image/bitShiftRight-A.svg)

Gray encoding of _n_,
scatter plot,
OEIS [A003188](https://oeis.org/A003188):

~~~spl
0:250.collect { :n |
	(n / 2).floor.bitXor(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-A.svg)

Gray encoding of _n_,
line plot,
OEIS [A003188](https://oeis.org/A003188):

~~~spl
{ :i |
	i.bitXor((i / 2).floor)
~~~

![](sw/spl/Help/Image/bitXor-C.svg)

Gray encodings of integers,
scatter plot,
OEIS [A003188](https://oeis.org/A003188):

~~~spl
0:250.grayEncode.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-A.svg)

Gray encodings of integers,
line plot,
OEIS [A003188](https://oeis.org/A003188):

~~~spl
1:100.grayEncode.linePlot
~~~

![](sw/spl/Help/Image/grayEncode-B.svg)

Number of representations of _n_ as a sum of distinct Lucas numbers,
OEIS [A003263](https://oeis.org/A003263):

~~~spl
1:10.product { :n |
	Polynomial(
		[
			0: 1,
			n.lucasInteger: 1
		]
	)
}.coefficientList
.allButFirst
.take(105)
.discretePlot
~~~

![](sw/spl/Help/Image/Polynomial-A.svg)

The Szekeres sequence,
OEIS [A003278](https://oeis.org/A003278):

~~~spl
192.szekeresSequence.scatterPlot
~~~

![](sw/spl/Help/Image/szekeresSequence-A.svg)

The arithmetic derivative of _n_,
OEIS [A003415](https://oeis.org/A003415):

~~~spl
0:85.arithmeticDerivative.discretePlot
~~~

![](sw/spl/Help/Image/arithmeticDerivative-A.svg)

The arithmetic derivative of _n_,
OEIS [A003415](https://oeis.org/A003415):

~~~spl
1:150.collect { :n |
	(n < 2).if {
		0
	} {
		n.abs.factorInteger
		.collect { :x |
			x[2] / x[1]
		}.sum * n
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-D.svg)

The number of iterations of _φ(x)_ at _n_ needed to reach one,
OEIS [A003434](https://oeis.org/A003434):

~~~spl
1:105.collect { :n |
	eulerPhi:/1
	.nestWhileList(n) { :x |
		x != 1
	}.size - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-G.svg)

A `log` scaled scatter plot of the row-order sequence,
the reciprocal of OEIS [A003506](https://oeis.org/A003506):

~~~spl
20.leibnizHarmonicTriangle
.catenate
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/leibnizHarmonicTriangle-A.svg)

Triangle of denominators in Leibniz’s harmonic triangle,
OEIS [A003506](https://oeis.org/A003506):

~~~spl
9.leibnizHarmonicTriangle
.catenate.denominator.discretePlot
~~~

![](sw/spl/Help/Image/leibnizHarmonicTriangle-B.svg)

Multiplicative suborder of _2_ and _2n+1_,
OEIS [A003558](https://oeis.org/A003558):

~~~spl
0:200.collect { :n |
	let m = 1;
	{
		let a = 2 * n;
		let b = (2 ^ m) % (a + 1);
		b = 1 | { b = a }
	}.whileFalse {
		m := m + 1
	};
	m
}.scatterPlot
~~~

![](sw/spl/Help/Image/mod-T.svg)

_P(n)%(n-1)_,
OEIS [A003558](https://oeis.org/A003558):

~~~spl
1:135.collect { :n |
	n.prime % (n - 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/mod-U.svg)

Multiplicative suborder of two modulo _2n+1_,
OEIS [A003558](https://oeis.org/A003558):

~~~spl
1:200.collect { :n |
	2.multiplicativeSuborder(2 * n + 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeSuborder-C.svg)

Kimberling’s paraphrase of the binary number system,
OEIS [A003602](https://oeis.org/A003602):

~~~spl
1:200.collect { :n |
	let a = { :x |
		(x / 2).floor
	}.nestWhile(n, isEven:/1);
	(a / 2).ceiling
}.scatterPlot
~~~

![](sw/spl/Help/Image/nestWhile-A.svg)

Zeckendorf representation as binary integer,
OEIS [A003714](https://oeis.org/A003714):

~~~spl
0:75.collect { :n |
	n.zeckendorfRepresentation
	.fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-C.svg)

Numbers with no adjacent zeroes in binary expansion,
OEIS [A003754](https://oeis.org/A003754):

~~~spl
0:75.collect { :n |
	n.dualZeckendorfRepresentation
	.fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-C.svg)

_2^l(n)_,
[A003817](https://oeis.org/A003817):

~~~spl
(2 ^ 0:50.bitLength).discretePlot
~~~

![](sw/spl/Help/Image/bitLength-B.svg)

The tenth Fibonacci word,
OEIS [A003849](https://oeis.org/A003849):

~~~spl
1:55.fibonacciWord.discretePlot
~~~

![](sw/spl/Help/Image/fibonacciWord-B.svg)

Scatter plot of the digits of _π/4_,
OEIS [A003881](https://oeis.org/A003881):

~~~spl
1/4.pi(104).integerDigits.scatterPlot
~~~

![](sw/spl/Help/Image/pi-C.svg)

Fibonacci numbers modulo ten,
period is sixty,
OEIS [A003893](https://oeis.org/A003893):

~~~spl
(1:75.fibonacci % 10)
.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-C.svg)

Completely multiplicative with _a(P(k))=P(k+1)_,
OEIS [A003961](https://oeis.org/A003961):

~~~spl
let a = { :n |
	(n = 1).if {
		1
	} {
		n.isPrime.if {
			(n.primePi + 1).prime
		} {
			n.factorInteger.product { :x |
				a(x[1]) ^ x[2]
			}
		}
	}
};
1:100.collect(a:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-E.svg)

A sequence fully multiplicative with _a(p)=k_ if _p_ is the _k_-th prime,
OEIS [A003963](https://oeis.org/A003963):

~~~spl
1:275.collect { :n |
	(n = 1).if {
		1
	} {
		n.factorInteger
		.product { :x |
			x[1].primePi ^ x[2]
		}
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-I.svg)

Bitwise or table,
read by antidiagonals,
OEIS [A003986](https://oeis.org/A003986):

~~~spl
0:21.triangularArray { :n :k |
	k.bitOr(n - k)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitOr-F.svg)

The Nim-sum table,
OEIS [A003987](https://oeis.org/A003987):

~~~spl
0:20.triangularArray { :a :b |
	b.bitXor(a - b)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-E.svg)

Triangular array of quotients,
OEIS [A003988](https://oeis.org/A003988):

~~~spl
1:17.triangularArray { :n :k |
	(n - k + 1) // k
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/quotient-E.svg)

The greatest common divisor matrix read by antidiagonals,
OEIS [A003989](https://oeis.org/A003989):

~~~spl
1:25.triangularArray { :x :y |
	gcd(x - y + 1, y) - 1
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/triangularArray-C.svg)

The multiplication table read by antidiagonals,
OEIS [A003991](https://oeis.org/A003991):

~~~spl
1:13.triangularArray { :x :y |
	(x + 1 - y) * y
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-B.svg)

A Conway sequence,
OEIS [A004001](https://oeis.org/A004001):

~~~spl
let a = Map { :n |
	(n <= 2).if {
		1
	} {
		a[a[n - 1]] + a[n - a[n - 1]]
	}
};
a[1:75].scatterPlot
~~~

![](sw/spl/Help/Image/Map-A.svg)

Theta series of planar hexagonal lattice _A2_,
OEIS [A004016](https://oeis.org/A004016):

~~~spl
1:73.collect { :n |
	(n = 1).if {
		1
	} {
		6 * n.divisorSum { :x |
			x.kroneckerSymbol(3)
		}
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-B.svg)

Number of ways of writing _n_ as a sum of two squares,
OEIS [A004018](https://oeis.org/A004018):

~~~spl
1:100.collect { :n |
	2.squaresR(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/squaresR-A.svg)

Integer reverse,
OEIS [A004086](https://oeis.org/A004086):

~~~spl
0:400.integerReverse.linePlot
~~~

![](sw/spl/Help/Image/integerReverse-E.svg)

Sum of digits of Fibonacci numbers,
OEIS [A004090](https://oeis.org/A004090):

~~~spl
0:85.fibonacci.collect { :n |
	n.integerDigits.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-O.svg)

The factorial numbers with trailing zeros omitted,
OEIS [A004154](https://oeis.org/A004154):

~~~spl
let n = 0:65.!;
let a = n / (10 ^ n.integerExponent(10));
a.log.scatterPlot
~~~

![](sw/spl/Help/Image/factorial-C.svg)

_k&(n-k)_,
OEIS [A004198](https://oeis.org/A004198):

~~~spl
0:15.triangularArray { :n :k |
	k.bitAnd(n - k)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/bitAnd-M.svg)

The multiplication table,
read by antidiagonals,
OEIS [A004247](https://oeis.org/A004247):

~~~spl
0:13.antidiagonalArray(*)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/antidiagonalArray-C.svg)

Exponentiation table,
read by antidiagonals,
OEIS [A004248](https://oeis.org/A004248):

~~~spl
0:21.antidiagonalArray(
	power:/2
).catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/power-G.svg)

_n⊗3_,
OEIS [A004468](https://oeis.org/A004468):

~~~spl
0:255.nimMultiplication(3).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-G.svg)

_n⊗4_,
OEIS [A004469](https://oeis.org/A004469):

~~~spl
0:255.nimMultiplication(4).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-H.svg)

_n⊗5_,
OEIS [A004470](https://oeis.org/A004470):

~~~spl
0:255.nimMultiplication(5).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-I.svg)

_n⊗6_,
OEIS [A004471](https://oeis.org/A004471):

~~~spl
0:255.nimMultiplication(6).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-J.svg)

_n⊗7_,
OEIS [A004472](https://oeis.org/A004472):

~~~spl
0:255.nimMultiplication(7).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-K.svg)

_n⊗8_,
OEIS [A004473](https://oeis.org/A004473):

~~~spl
0:255.nimMultiplication(8).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-L.svg)

_n⊗9_,
OEIS [A004474](https://oeis.org/A004474):

~~~spl
0:255.nimMultiplication(9).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-M.svg)

Tersum _n+n_,
OEIS [A004488](https://oeis.org/A004488):

~~~spl
0:80.collect { :n |
	let d = n.integerDigits(3);
	(3 - d % 3).fromDigits(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-E.svg)

_P(n)%n_
OEIS [A004648](https://oeis.org/A004648):

~~~spl
1:135.collect { :n |
	n.prime % n
}.scatterPlot
~~~

![](sw/spl/Help/Image/prime-Q.svg)

_P(n)%(n+1)_
OEIS [A004650](https://oeis.org/A004650):

~~~spl
1:135.collect { :n |
	n.prime % (n + 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/prime-R.svg)

The Danish composer Per Nørgård’s infinity sequence,
OEIS [A004718](https://oeis.org/A004718):

~~~spl
0:65.collect { :n |
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
	p - q
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-C.svg)

Per Nørgård’s infinity sequence,
discrete plot,
OEIS [A004718](https://oeis.org/A004718):

~~~spl
99.noergaardInfinitySequence
.discretePlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-A.svg)

Per Nørgård’s infinity sequence,
scatter plot,
OEIS [A004718](https://oeis.org/A004718):

~~~spl
333.noergaardInfinitySequence
.scatterPlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-B.svg)

Start counting again and again,
backwards,
OEIS [A004736](https://oeis.org/A004736):

~~~spl
1:17.collect { :i |
	i.iota(i, -1)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/iota-B.svg)

Cube free numbers,
OEIS [A004709](https://oeis.org/A004709):

~~~spl
1:100.select(isCubeFree:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/isCubeFree-A.svg)

Alcuin’s sequence,
OEIS [A005044](https://oeis.org/A005044):

~~~spl
1:35.collect { :n |
	n.isEven.if {
		n ^ 2
	} {
		((n + 3) ^ 2)
	} / 48
}.round.stepPlot
~~~

![](sw/spl/Help/Image/isEven-F.svg)

Squarefree numbers,
OEIS [A005117](https://oeis.org/A005117):

~~~spl
1:99.select(isSquareFree:/1).linePlot
~~~

![](sw/spl/Help/Image/isSquareFree-A.svg)

Recamáns sequence,
line plot,
OEIS [A005132](https://oeis.org/A005132):

~~~spl
300.recamanSequence.linePlot
~~~

![](sw/spl/Help/Image/recamanSequence-A.svg)

Recamáns sequence,
scatter plot,
OEIS [A005132](https://oeis.org/A005132):

~~~spl
300.recamanSequence.scatterPlot
~~~

![](sw/spl/Help/Image/recamanSequence-B.svg)

Characteristic function of nonprimes,
OEIS [A005171](https://oeis.org/A005171):

~~~spl
1:75.collect { :n |
	n.isPrime.not.boole
}.discretePlot
~~~

![](sw/spl/Help/Image/nonPrime-A.svg)

The Hofstadter Q-sequence,
scatter plot of first few terms,
OEIS [A005185](https://oeis.org/A005185):

~~~spl
200.hofstadterQSequence.scatterPlot
~~~

![](sw/spl/Help/Image/hofstadterQSequence-A.svg)

The Hofstadter Q-sequence,
scatter plot of the terms in _(6000, 6200)_,
OEIS [A005185](https://oeis.org/A005185):

~~~spl
6200.hofstadterQSequence
.last(200)
.scatterPlot
~~~

![](sw/spl/Help/Image/hofstadterQSequence-B.svg)

_|a(n-1)+2a(n-2)-n|_,
OEIS [A005210](https://oeis.org/A005210):

~~~spl
{ :a :n |
	(a[n - 1] + (2 * a[n - 2]) - n).abs
}.recurrenceTable([1 1], 85).discretePlot
~~~

![](sw/spl/Help/Image/recurrenceTable-F.svg)

Mallows’ sequence,
OEIS [A005229](http://oeis.org/A005229):

~~~spl
99.mallowsSequence.linePlot
~~~

![](sw/spl/Help/Image/mallowsSequence-A.svg)

Barriers for _ω(n)_,
OEIS [A005236](https://oeis.org/A005236):

~~~spl
2:150.select { :n |
	let m = n - 1;
	1:m.allSatisfy { :x |
		x + x.primeNu <= n
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-C.svg)

Regarded as base two and then evaluated,
OEIS [A005351](https://oeis.org/A005351):

~~~spl
0:341.negabinaryExpansion
.collect { :n |
	n.fromDigits(2)
}.stepPlot
~~~

![](sw/spl/Help/Image/negabinaryExpansion-A.svg)

Product of exponents of prime factorization of _n_,
OEIS [A005361](https://oeis.org/A005361):

~~~spl
1:65.collect { :n |
	n.primeSignature.product
}.discretePlot
~~~

![](sw/spl/Help/Image/primeSignature-H.svg)

Partial sums of alternating sum of reverse of binary expansion of _n_,
OEIS [A005536](https://oeis.org/A005536):

~~~spl
0:1023.collect { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum
}.prefixSum.linePlot
~~~

![](sw/spl/Help/Image/alternatingSum-E.svg)

Running sum of every third term in the _+1,-1_-version of Thue-Morse sequence,
OEIS [A005599](https://oeis.org/A005599):

~~~spl
0:200.collect { :n |
	0:n.sum { :k |
		-1 ^ (3 * k).hammingWeight
	}
}.linePlot
~~~

![](sw/spl/Help/Image/hammingWeight-R.svg)

_⌊(tan(n)²)_,
OEIS [A005657](https://oeis.org/A005657):

~~~spl
0:150.tan.square.floor.log.scatterPlot
~~~

![](sw/spl/Help/Image/tan-E.svg)

Number of fractions in Farey series of order _n_,
OEIS [A005728](https://oeis.org/A005728):

~~~spl
1:65.collect { :n |
	n.fareySequence.size
}.discretePlot
~~~

![](sw/spl/Help/Image/fareySequence-L.svg)

Number of ones in binary reflected Gray code of _n_,
OEIS [A005811](https://oeis.org/A005811):

~~~spl
0:250.collect { :n |
	n.grayEncode.digitCount(2, 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-D.svg)

Number of runs in binary expansion of _n_,
OEIS [A005811](https://oeis.org/A005811):

~~~spl
1:255.collect { :n |
	n.integerDigits(2)
	.split(=)
	.collect(size:/1)
	.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-G.svg)

Cantor numbers,
OEIS [A005823](https://oeis.org/A005823):

~~~spl
192.cantorNumbers.scatterPlot
~~~

![](sw/spl/Help/Image/cantorNumbers-A.svg)

The Cantor numbers,
OEIS [A005823](https://oeis.org/A005823):

~~~spl
0:3000.select { :n |
	n.digitCount(3, 1) = 0
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-C.svg)

Numbers whose base three representation contains no two,
a Stanley sequence,
OEIS [A005836](https://oeis.org/A005836):

~~~spl
0:2186.select { :n |
	n.digitCount(3, 2) = 0
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-M.svg)

Euler transform of _-3,-3,-2_,
OEIS [A005928](https://oeis.org/A005928):

~~~spl
0:115.collect(
	[-3 -3 -2].periodicFunction
	.eulerTransform
).discretePlot
~~~

![](sw/spl/Help/Image/eulerTransform-A.svg)

Euler transform of _-3,-3,-2_,
OEIS [A005928](https://oeis.org/A005928):

~~~spl
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

The Doudna sequence,
OEIS [A005940](https://oeis.org/A005940):

~~~spl
75.doudnaSequence.scatterPlot
~~~

![](sw/spl/Help/Image/doudnaSequence-A.svg)

The Doudna sequence,
log-scale plot,
OEIS [A005940](https://oeis.org/A005940):

~~~spl
250.doudnaSequence.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/doudnaSequence-B.svg)

_n⊗2_,
OEIS [A006015](https://oeis.org/A006015):

~~~spl
0:255.nimMultiplication(2).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-F.svg)

The Nim-square of _n_,
_n⊗n_,
OEIS [A006042](https://oeis.org/A006042):

~~~spl
0:255.collect(nimSquare:/1).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-E.svg)

The number of odd elements in the first _n_ rows of Pascal’s triangle,
OEIS [A006046](https://oeis.org/A006046):

~~~spl
let b = { :k | k.digitCount(2, 1) };
1:100.functionPlot { :n |
	(0 .. n - 1).collect { :k |
		2 ^ b(k)
	}.sum
}
~~~

![](sw/spl/Help/Image/digitCount-B.svg)

Partial sums of Gould’s sequence,
scatter plot,
OEIS [A006046](https://oeis.org/A006046):

~~~spl
96.gouldsSequence
.prefixSum
.scatterPlot
~~~

![](sw/spl/Help/Image/gouldsSequence-B.svg)

Gray decode,
OEIS [A006068](https://oeis.org/A006068):

~~~spl
0:127.grayDecode.scatterPlot
~~~

![](sw/spl/Help/Image/grayDecode-A.svg)

The Josephus problem at _k=2_,
OEIS [A006257](https://oeis.org/A006257):

~~~spl
0:85.collect { :n |
	n.josephusProblem(2)
}.discretePlot
~~~

![](sw/spl/Help/Image/josephusProblem-A.svg)

The Schröder numbers,
OEIS [A006318](https://oeis.org/A006318):

~~~spl
25.schroderSequence.log.discretePlot
~~~

![](sw/spl/Help/Image/schroderSequence-A.svg)

Differences of _⌊(n*√2+½)_,
OEIS [A006338](https://oeis.org/A006338):

~~~spl
let a = 1:85.collect { :n |
	(n * 2.sqrt + 0.5).floor
}.differences;
(a - 1).discretePlot
~~~

![](sw/spl/Help/Image/sqrt-E.svg)

An _eta-sequence_,
the differences of the rounded multiples of φ,
OEIS [A006340](https://oeis.org/A006340):

~~~spl
let x = 0:93.collect(goldenRatio:/1);
(x.round.differences - 1).discretePlot
~~~

![](sw/spl/Help/Image/goldenRatio-L.svg)

Coefficients in expansion of Eisenstein series _E2_,
OEIS [A006352](https://oeis.org/A006352):

~~~spl
(
	-24 * 1:65.collect { :n |
		1.divisorSigma(n)
	}
).discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-W.svg)

Expansion of a modular form related to Apery numbers,
OEIS [A006353](https://oeis.org/A006353):

~~~spl
let a = [0 5 4 6 4 5];
1:85.collect { :n |
	n.divisorSum { :d |
		d * a[d % 6 + 1]
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSum-G.svg)

The amusical permutation,
OEIS [A006368](https://oeis.org/A006368):

~~~spl
0:65.amusicalPermutation.discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-A.svg)

The amusical permutation,
OEIS [A006368](https://oeis.org/A006368):

~~~spl
0:65.collect { :n |
	n.isEven.if {
		3 * n / 2
	} {
		((3 * n + 2) / 4).floor
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/floor-K.svg)

Nearest integer to _4n/3_ unless that is an integer and then _2n/3_,
OEIS [A006369](https://oeis.org/A006369):

~~~spl
0:65.collect { :n |
	n.divisible(3).if {
		2 * n / 3
	} {
		(4 * n / 3).round
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/round-G.svg)

Cald’s sequence,
OEIS [A006509](https://oeis.org/A006509):

~~~spl
let y = [1];
1.toDo(135) { :n |
	let b = y.last;
	let p = y.size.prime;
	let x = (
		b > p & {
			y.includes(b - p).not
		}
	).if {
		b - p
	} {
		y.includes(b + p).if {
			0
		} {
			b + p
		}
	};
	y.add(x)
};
y.discretePlot
~~~

![](sw/spl/Help/Image/prime-N.svg)

The highest power of two dividing _n_,
OEIS [A006519](https://oeis.org/A006519):

~~~spl
1:127.collect(evenPart:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/evenPart-A.svg)

The greatest prime factors of the integers from two up to two hundred,
log-scale plot,
OEIS [A006530](https://oeis.org/A006530):

~~~spl
2:200.collect(greatestPrimeFactor:/1)
.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/greatestPrimeFactor-A.svg)

Number of different cycles of digits in the decimal expansions of reciprocals of primes,
OEIS [A006556](https://oeis.org/A006556):

~~~spl
4:150.prime.collect { :n |
	(n - 1) / 10.multiplicativeOrder(n)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-D.svg)

Unique cusp form of weight two for congruence group _Γ1(11)_,
OEIS [A006571](https://oeis.org/A006571):

~~~spl
let f = { :p :e |
	let a0 = 1;
	let a1 = 0 - (0 .. p - 1).sum { :x |
		kroneckerSymbol(
			[
				4 * x.cube,
				-4 * x.square,
				1
			].sum,
			p
		)
	};
	let y = a1;
	2.toDo(e) { :i |
		let x = (y * a1) - (p * a0);
		a0 := a1;
		a1 := x
	};
	a1
};
1:100.collect { :n |
	n.factorInteger.product { :x |
		(x[1] = 1).if {
			1
		} {
			f(x[1], x[2])
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-G.svg)

Number of halving and tripling steps to reach one in _3x+1_ problem,
OEIS [A006577](https://oeis.org/A006577):

~~~spl
1:200.collect { :each |
	each.collatzSequence.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-A.svg)

Number of tripling or halving steps to reach one from _n_ in the _3x+1_ problem,
also called the Collatz problem,
OEIS [A006577](https://oeis.org/A006577):

~~~spl
1:250.collect { :n |
	n.collatzSequence.size - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-L.svg)

Number of halving steps to reach one from _n_ in the _3x+1_ problem,
also called the Collatz problem,
OEIS [A006666](https://oeis.org/A006666):

~~~spl
1:250.collect { :n |
	n.collatzSequence.count(isEven:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-M.svg)

Number of tripling steps to reach one from _n_ in the _3x+1_ problem,
OEIS [A006667](https://oeis.org/A006667),
also
OEIS [A078719](https://oeis.org/A078719)
when one is added:

~~~spl
1:250.collect { :n |
	n.collatzSequence
	.differences
	.count(isPositive:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-K.svg)

The Somos four sequence,
discrete log plot,
OEIS [A006720](https://oeis.org/A006720):

~~~spl
4.somosSequence(35).log.discretePlot
~~~

![](sw/spl/Help/Image/somosSequence-A.svg)

The Somos seven sequence,
discrete log plot,
OEIS [A006723](https://oeis.org/A006723):

~~~spl
7.somosSequence(35).log.discretePlot
~~~

![](sw/spl/Help/Image/somosSequence-B.svg)

The numerators of the sequences in turn,
OEIS [A006842](https://oeis.org/A006842):

~~~spl
1:9.collect { :n |
	n.fareySequence.numerator
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/fareySequence-J.svg)

The denominators of the sequences in turn,
OEIS [A006843](https://oeis.org/A006843):

~~~spl
1:9.collect { :n |
	n.fareySequence.denominator
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/fareySequence-K.svg)

The squarefree semiprimes,
OEIS [A006881](https://oeis.org/A006881):

~~~spl
1:250.select { :n |
	n.isSemiprime & {
		n.isSquareFree
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/isSemiprime-C.svg)

Numbers whose binary expansion is palindromic,
OEIS [A006995](https://oeis.org/A006995):

~~~spl
0:1000.select { :n |
	n.integerDigits(2).isPalindrome
}.scatterPlot
~~~

![](sw/spl/Help/Image/isPalindrome-A.svg)

Trajectory of 1 under the morphism _1→12,2→123_ &etc,
OEIS [A007001](https://oeis.org/A007001):

~~~spl
{ :c |
	c.collect { :n |
		[1 .. n + 1]
	}.catenate
}.iterate([1], 5).stepPlot
~~~

![](sw/spl/Help/Image/iterate-D.svg)

The main diagonal of Kimberling’s expulsion array
OEIS [A007063](https://oeis.org/A007063):

~~~spl
let k = { :i :j |
	(j < (2 * i - 3)).if {
		j.isEven.if {
			k(i - 1, i - (j / 2) - 1)
		} {
			k(i - 1, i + ((j - 1) / 2))
		}
	} {
		i + j - 1
	}
};
1:200.collect { :n |
	k(n, n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/isEven-D.svg)

Numerators of Farey (or Stern-Brocot) tree fractions,
OEIS [A007305](https://oeis.org/A007305):

~~~spl
8.sternBrocotTree
.levelOrderValues
.numerator
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotTree-A.svg)

Denominators of Farey tree fractions,
OEIS [A007306](https://oeis.org/A007306):

~~~spl
1:77.collect { :n |
	0:n.sum { :k |
		(n + k - 1).binomial(2 * k) % 2
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/binomial-S.svg)

Denominators of Farey tree fractions,
OEIS [A007306](https://oeis.org/A007306):

~~~spl
let a = Map { :n |
	(n < 2).if {
		1
	} {
		let m = 2 ^ (n - 1).bitLength;
		a[n - (m / 2)] + a[m - n + 1]
	}
};
a[0:260].scatterPlot
~~~

![](sw/spl/Help/Image/bitLength-G.svg)

Pascal’s triangle,
row-order sequence,
log scaled scatter plot,
OEIS [A007318](https://oeis.org/A007318):

~~~spl
21.pascalTriangle
.catenate
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-A.svg)

Pascal’s triangle,
linear discrete plot,
OEIS [A007318](https://oeis.org/A007318):

~~~spl
11.pascalTriangle
.catenate
.discretePlot
~~~

![](sw/spl/Help/Image/pascalTriangle-B.svg)

The signature sequence of √2,
OEIS [A007336](https://oeis.org/A007336):

~~~spl
2.sqrt.signatureSequence(200)
.scatterPlot
~~~

![](sw/spl/Help/Image/sqrt-B.svg)

The _b=10_ Champernowne sequence,
OEIS [A007376](https://oeis.org/A007376):

~~~spl
10.champernowneSequence(65).stepPlot
~~~

![](sw/spl/Help/Image/champernowneSequence-A.svg)

Parity of number of primes dividing _n_,
OEIS [A007421](https://oeis.org/A007421):

~~~spl
1:75.collect { :n |
	(n.liouvilleLambda + 3) / 2
}.stepPlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-B.svg)

Sum of σ of `divisors` of _n_,
OEIS [A007425](https://oeis.org/A007425):

~~~spl
1:100.collect { :n |
	n.divisors.sum { :d |
		0.divisorSigma(d)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-O.svg)

Moebius transform applied twice to the sequence one then zero,
OEIS [A007427](https://oeis.org/A007427):

~~~spl
1:81.collect { :n |
	n.divisorSum { :d |
		let a = moebiusMu(d);
		let b = moebiusMu(n / d);
		a * b
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSum-D.svg)

Triplicate Moebius transform of the _10000…_ sequence,
OEIS [A007428](https://oeis.org/A007428):

~~~spl
[1].padRight([64], 0)
.moebiusTransform
.moebiusTransform
.moebiusTransform
.discretePlot
~~~

![](sw/spl/Help/Image/moebiusTransform-A.svg)

Inverse Moebius transform applied twice to natural numbers,
OEIS [A007429](https://oeis.org/A007429):

~~~spl
1:65.collect { :n |
	1.divisorSigma(n.divisors).sum
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-N.svg)

Moebius transform applied thrice to natural numbers,
OEIS [A007432](https://oeis.org/A007432):

~~~spl
[1 .. 115].moebiusTransform
.moebiusTransform
.moebiusTransform
.discretePlot
~~~

![](sw/spl/Help/Image/moebiusTransform-F.svg)

Jordan function,
OEIS [A007434](https://oeis.org/A007434):

~~~spl
1:165.collect(
	dirichletConvolve(
		{ :k | k.moebiusMu },
		{ :k | k ^ 2 }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-B.svg)

Jordan function _k=2_,
OEIS [A007434](https://oeis.org/A007434):

~~~spl
2.jordanTotient(1:150).scatterPlot
~~~

![](sw/spl/Help/Image/jordanTotient-A.svg)

Moebius transform of squares,
OEIS [A007434](https://oeis.org/A007434):

~~~spl
1:115.square
.moebiusTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/moebiusTransform-H.svg)

Inverse Moebius transform of triangular numbers,
OEIS [A007437](http://oeis.org/A007437):

~~~spl
1:100.collect { :n |
	let a = 1.divisorSigma(n);
	let b = 2.divisorSigma(n);
	(a + b) / 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/triangularNumber-B.svg)

Moebius transform of triangular numbers,
OEIS [A007438](https://oeis.org/A007438):

~~~spl
1:115.triangularNumber
.moebiusTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/moebiusTransform-G.svg)

The inverse binomial transform of the prime numbers,
OEIS [A007442](https://oeis.org/A007442):

~~~spl
1:65.prime
.inverseBinomialTransform
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/inverseBinomialTransform-B.svg)

Moebius transform of primes,
OEIS [A007444](https://oeis.org/A007444):

~~~spl
1:150.prime
.moebiusTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/moebiusTransform-B.svg)

Inverse Moebius transform of primes,
OEIS [A007445](https://oeis.org/A007445):

~~~spl
1:150.collect { :n |
	n.divisorSum(prime:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/prime-O.svg)

Shifts left under _and_-convolution with itself,
OEIS [A007461](https://oeis.org/A007461):

~~~spl
let a = Map { :n |
	(n < 2).if {
		1
	} {
		let m = n - 1;
		0:m.sum { :k |
			bitAnd(a[k], a[n - k -1])
		}
	}
};
a[0:75].discretePlot
~~~

![](sw/spl/Help/Image/bitAnd-K.svg)

Primes whose reversal in base ten is also prime,
sometimes called reversible primes,
OEIS [A007500](https://oeis.org/A007500):

~~~spl
1:600.prime.select { :n |
	n.integerReverse.isPrime
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-A.svg)

Smallest pseudoprime _>n_ to base _n_,
OEIS [A007535](https://oeis.org/A007535):

~~~spl
1:175.collect { :n |
	let k = n + 1;
	{
		k.isPrime | {
			n.powerMod(k - 1, k) != 1
		}
	}.whileTrue {
		k := k + 1
	};
	k
}.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-E.svg)

A self-generating sequence,
there are _a(n)_ threes between successive twos,
OEIS [A007538](https://oeis.org/A007538):

~~~spl
let m = 1 + 3.sqrt;
let a = 1:65.collect { :n |
	(n * m).floor - ((n - 1) * m).floor
};
(a - 2).discretePlot
~~~

![](sw/spl/Help/Image/sqrt-D.svg)

Period of base four representation of _1/n_,
OEIS [A007735](https://oeis.org/A007735):

~~~spl
1:200.collect { :n |
	4.multiplicativeOrder(
		n / (2 ^ n.integerExponent(2))
	)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-J.svg)

Powers of two in successive integers,
the binary carry sequence,
also called the ruler sequence,
OEIS [A007814](https://oeis.org/A007814):

~~~spl
1:127.functionPlot { :n |
	n.integerExponent(2)
}
~~~

![](sw/spl/Help/Image/integerExponent-A.svg)

Number of ways of writing _n_ as _p*q_ where _p<=q_ and _gcd(p,q)=1_,
OEIS [A007875](https://oeis.org/A007875):

~~~spl
1:65.collect { :n |
	(2 ^ n.primeNu).eulerPhi
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-F.svg)

Number of ones (terms) in the Zeckendorf representation of _n_,
OEIS [A007895](https://oeis.org/A007895):

~~~spl
0:125.collect { :n |
	n.zeckendorfRepresentation
	.occurrencesOf(1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-B.svg)

The square-free part of _n_,
OEIS [A007913](https://oeis.org/A007913):

~~~spl
1:65.squareFreePart.discretePlot
~~~

![](sw/spl/Help/Image/squareFreePart-A.svg)

Numbers written in the dyadic system,
OEIS [A007931](https://oeis.org/A007931):

~~~spl
1:94.collect { :n |
	let a = (n + 1).integerDigits(2);
	(a + 1).allButFirst.fromDigits
}.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-N.svg)

Radical of the integer _n_,
OEIS [A007947](https://oeis.org/A007947):

~~~spl
1:150.radical.scatterPlot
~~~

![](sw/spl/Help/Image/radical-A.svg)

Radical of the integer _n_,
log plot,
OEIS [A007947](https://oeis.org/A007947):

~~~spl
1:300.radical.log.scatterPlot
~~~

![](sw/spl/Help/Image/radical-B.svg)

_b=3_,
greatest _k_ such that _3^k_ divides _n_,
OEIS [A007949](https://oeis.org/A007949):

~~~spl
1:150.integerExponent(3).discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-N.svg)

Binary sieve,
OEIS [A007950](https://oeis.org/A007950):

~~~spl
let a = [1 .. 200];
1:6.do { :n |
	let k = 2 ^ n;
	let i = Range(k, a.size, k);
	a.removeAtAll(i)
};
a.discretePlot
~~~

![](sw/spl/Help/Image/removeAtAll-A.svg)

Ternary sieve,
OEIS [A007951](https://oeis.org/A007951):

~~~spl
let a = [1 .. 150];
1:6.do { :n |
	let k = 3 ^ n;
	let i = Range(k, a.size, k);
	a.removeAtAll(i)
};
a.discretePlot
~~~

![](sw/spl/Help/Image/removeAtAll-B.svg)

The sum of the digits of _n_,
where _b=10_,
OEIS [A007953](http://oeis.org/A007953):

~~~spl
1:100.collect(digitSum:/1).discretePlot
~~~

![](sw/spl/Help/Image/digitSum-A.svg)

Product of decimal digits of _n_,
OEIS [A007954](https://oeis.org/A007954):

~~~spl
1:150.collect { :n |
	n.integerDigits.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-J.svg)

Product of the proper divisors of _n_,
OEIS [A007956](https://oeis.org/A007956):

~~~spl
1:200.collect { :n |
	n ^ (0.divisorSigma(n) / 2 - 1)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-K.svg)

The triangle of signed Stirling numbers of the first kind,
OEIS [A008275](http://oeis.org/A008275):

~~~spl
1:17.triangularArray(stirlingS1:/2)
.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/stirlingS1-E.svg)

Triangle of _s(n,n-k+1)_,
OEIS [A008276](https://oeis.org/A008276):

~~~spl
1:11.triangularArray { :n :k |
	stirlingS1(n, n - k + 1)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/stirlingS1-D.svg)

The triangle of Stirling numbers of the second kind,
OEIS [A008277](https://oeis.org/A008277):

~~~spl
1:17.triangularArray(stirlingS2:/2)
.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/stirlingS2-C.svg)

The first few terms of the Seidel–Entringer–Arnold triangle,
log scale scatter plot,
OEIS [A008280](https://oeis.org/A008280):

~~~spl
13.seidelEntringerArnoldTriangle
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/seidelEntringerArnoldTriangle-A.svg)

The Entringer triangle,
log scale scatter plot,
OEIS [A008281](https://oeis.org/A008281):

~~~spl
13.entringerTriangle
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/entringerTriangle-A.svg)

The Entringer triangle,
log scale scatter plot of first few terms,
OEIS [A008282](https://oeis.org/A008282):

~~~spl
1:11.triangularArray(
 	entringerNumber:/2
).catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/entringerNumber-A.svg)

Initial triangle of _P(n,k)_,
OEIS [A008284](https://oeis.org/A008284):

~~~spl
1:15.triangularArray(
	partitionFunctionP:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/partitionFunctionP-B.svg)

Square array of Delannoy numbers read by antidiagonals,
OEIS [A008288](https://oeis.org/A008288):

~~~spl
0:17.antidiagonalArray(
	delannoyNumber:/2
).catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/delannoyNumber-B.svg)

Table of non-zero values of _Q(n,k)_,
OEIS [A008289](https://oeis.org/A008289):

~~~spl
1:21.collect { :n |
	1:n.collect { :k |
		n.partitionFunctionQ(k)
	}.select { :i |
		i > 0
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/partitionFunctionQ-A.svg)

Table of non-zero values of _Q(n,k)_,
log scaled,
OEIS [A008289](https://oeis.org/A008289):

~~~spl
1:43.collect { :n |
	1:n.collect { :k |
		n.partitionFunctionQ(k)
	}.select { :i |
		i > 0
	}
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/partitionFunctionQ-B.svg)

The Euler triangle,
without trailing zero,
log scale scatter plot,
OEIS [A008292](https://oeis.org/A008292):

~~~spl
(0L .. 20L).triangularArray(
	eulerianNumber:/2, -1
).catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/eulerianNumber-A.svg)

Signed form of Lah numbers,
OEIS [A008297](https://oeis.org/A008297):

~~~spl
0:11.triangularArray { :n :k |
	(-1 ^ n) * lahNumber(n, k)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/lahNumber-B.svg)

Table of Mahonian numbers,
read by rows,
OEIS [A008302](https://oeis.org/A008302):

~~~spl
6.mahonianNumbers
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/mahonianNumbers-A.svg)

Number of permutations of _1:n_ with order dividing _k_,
read by antidiagonals,
OEIS [A008307](https://oeis.org/A008307):

~~~spl
let t = { :n :k |
	(n >= 0 & { k >= 0 }).if {
		k.divisors.sum { :d |
			(n.! / (n - d + 1).!)
			*
			t(n - d, k)
		}
	} {
		1
	}
};
1:13.triangularArray { :n :k |
	t(n - k, k)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/divisors-J.svg)

Triangle of arctangent numbers,
OEIS [A008309](https://oeis.org/A008309):

~~~spl
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

_φ(p(n)-1)_,
number of primitive roots in the field with _p_ elements,
OEIS [A008330](https://oeis.org/A008330):

~~~spl
1:200.collect { :n |
	(n.prime - 1).eulerPhi
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-K.svg)

_Σ{i=0…n-1}-1^i*p(n-i)_,
OEIS [A008347](https://oeis.org/A008347):

~~~spl
-.swap.foldList(0, 1:200.prime).scatterPlot
~~~

![](sw/spl/Help/Image/prime-M.svg)

Number of ordered ways of writing _n_ as the sum of two triangular numbers,
OEIS [A008441](https://oeis.org/A008441):

~~~spl
0:65.collect { :n |
	[1 1].frobeniusSolve(n)
	.count { :x |
		x.allSatisfy { :i |
			(8 * i + 1).isPerfectSquare
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-A.svg)

Sum of the distinct prime factors of _n_,
OEIS [A008472](https://oeis.org/A008472):

~~~spl
1:75.collect { :n |
	n.distinctPrimeFactors.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/distinctPrimeFactors-A.svg)

Product of the sums of the prime and exponent of the factors of _n_,
OEIS [A008473](https://oeis.org/A008473):

~~~spl
2:200.collect { :n |
	n.factorInteger
	.collect(sum:/1)
	.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-L.svg)

The minimal number _m_ such that the symmetric group _Sm_ has an element of order _n_,
OEIS [A008475](https://oeis.org/A008475):

~~~spl
2:73.collect { :n |
	n.factorInteger.collect { :f |
		f[1] ^ f[2]
	}.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/factorInteger-G.svg)

Molien series of binary octahedral group of order 48,
OEIS [A008647](http://oeis.org/A008647):

~~~spl
linearRecurrence(
	[0 0 1 1 0 0 -1],
	[1 0 0 0 1 0 1],
	7 * 12
).stepPlot
~~~

![](sw/spl/Help/Image/linearRecurrence-B.svg)

The Möbius sequence,
OEIS [A008683](https://oeis.org/A008683):

~~~spl
1:100.moebiusMu.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-A.svg)

Number of ones in twos complement representation of _-n_,
OEIS [A008687](https://oeis.org/A008687):

~~~spl
let a = Map { :n |
	(n < 2).if {
		n
	} {
		let m = n % 2;
		m + a[m + (n / 2).floor]
	}
};
a[0:115].scatterPlot
~~~

![](sw/spl/Help/Image/floor-H.svg)

_⌊(n/10)-(n%10)_,
OEIS [A008687](https://oeis.org/A008687):

~~~spl
0:199.collect { :n |
	(n / 10).floor - (n % 10)
}.scatterPlot
~~~

![](sw/spl/Help/Image/floor-I.svg)

Molien series for three-dimensional group _[2,n]=*22n_,
OEIS [A008728](https://oeis.org/A008728):

~~~spl
0:65.collect { :n |
	let m = n + 10;
	0:m.sum { :j |
		(j / 10).floor
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-K.svg)

The Liouville λ sequence,
OEIS [A008836](https://oeis.org/A008836):

~~~spl
1:115.liouvilleLambda.discretePlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-A.svg)

The Collatz sequence orbit for twenty-seven,
which has one-hundred and twelve places,
OEIS [A008884](https://oeis.org/A008884):

~~~spl
27.collatzSequence.linePlot
~~~

![](sw/spl/Help/Image/collatzSequence-C.svg)

The Aliquot sequence starting at 276,
OEIS [A008892](https://oeis.org/A008892):

~~~spl
276.aliquotSequence(23).log.stepPlot
~~~

![](sw/spl/Help/Image/aliquotSequence-B.svg)

The final nonzero digit of _n!_,
OEIS [A008904](https://oeis.org/A008904):

~~~spl
let n = 0:65.!.withoutTrailingZeroes;
(n % 10).stepPlot
~~~

![](sw/spl/Help/Image/withoutTrailingZeroes-A.svg)

Leading digit of _n!_,
OEIS [A008905](https://oeis.org/A008905):

~~~spl
let n = 0:85.!;
(n // (10 ^ n.log10.floor))
.discretePlot
~~~

![](sw/spl/Help/Image/factorial-B.svg)

Bernoulli’s triangle,
in row-order sequence,
log scaled scatter plot,
OEIS [A008949](https://oeis.org/A008949):

~~~spl
20.bernoulliTriangle
.catenate
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliTriangle-A.svg)

The characteristic function of square free numbers,
OEIS [A008966](https://oeis.org/A008966):

~~~spl
1:115.collect(
	isSquareFree:/1
).boole.discretePlot
~~~

![](sw/spl/Help/Image/isSquareFree-F.svg)

Triangle of distribution of rank sums,
OEIS [A008967](https://oeis.org/A008967):

~~~spl
2:9.collect { :n |
	let m = 2 * n - 1;
	3:m.collect { :k |
		1:n.subsets { :x | x.size = 2 }
		.select { :x | x.sum = k }
		.size
	}
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/subsets-A.svg)

Expansion of exponential generating function _cos(x)/exp(x)_,
OEIS [A009116](https://oeis.org/A009116):

~~~spl
linearRecurrence([-2 -2], [1 -1], 110)
.logScale.discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-F.svg)

Expansion of exponential generating function _sin(x)*exp(x)_,
also Lucas _U(2,2)_ sequence,
OEIS [A009545](https://oeis.org/A009545):

~~~spl
linearRecurrence([2 -2], [0 1], 110)
.logScale.discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-E.svg)

Characteristic function of prime numbers,
OEIS [A010051](https://oeis.org/A010051):

~~~spl
1:100.isPrime.boole.discretePlot
~~~

![](sw/spl/Help/Image/isPrime-E.svg)

The characteristic function of the square numbers,
OEIS [A010052](https://oeis.org/A010052):

~~~spl
0:81.collect(isPerfectSquare:/1)
.boole
.discretePlot
~~~

![](sw/spl/Help/Image/isPerfectSquare-B.svg)

The characteristic function of the triangular numbers,
one if _n_ is a triangular number otherwise zero,
OEIS [A010054](https://oeis.org/A010054):

~~~spl
0:200.collect { :n |
	1.squaresR(8 * n + 1) / 2
}.discretePlot
~~~

![](sw/spl/Help/Image/squaresR-B.svg)

_ω(n)≤1_,
OEIS [A010055](https://oeis.org/A010055):

~~~spl
2:85.collect { :n |
	(n.primeNu <= 1).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/primeNu-I.svg)

Characteristic function of Fibonacci numbers,
OEIS [A010056](https://oeis.org/A010056):

~~~spl
let a = 1:12.fibonacci;
let k = a.max;
1:k.collect { :n |
	a.includes(n).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-N.svg)

The characteristic function of the cubic numbers,
one if _n_ is a cube else zero,
OEIS [A010057](https://oeis.org/A010057):

~~~spl
1:750.collect { :n |
	(n ^ (1 / 3)).isInteger(1E-14)
}.boole.discretePlot
~~~

![](sw/spl/Help/Image/isInteger-B.svg)

Characteristic function of numbers with an even number of ones in their binary expansion,
OEIS [A010059](https://oeis.org/A010059):

~~~spl
0:85.select { :n |
	n.digitCount(2, 1).isEven
}.characteristicFunction.discretePlot
~~~

![](sw/spl/Help/Image/digitCount-S.svg)

The Thue-Morse sequence,
OEIS [A010060](http://oeis.org/A010060):

~~~spl
99.thueMorseSequence.discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-A.svg)

Shortest representation of _-n_ in twos-complement format,
OEIS [A010078](https://oeis.org/A010078):

~~~spl
1:85.collect { :n |
	2 ^ (n.log2 + 1).ceiling - n
}.scatterPlot
~~~

![](sw/spl/Help/Image/ceiling-C.svg)

Triangular array of floor of division,
OEIS [A010766](https://oeis.org/A010766):

~~~spl
1:17.triangularArray { :n :k |
	(n / k).floor
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/floor-F.svg)

From Euler’s pentagonal theorem,
also number of different partitions of _n_ into parts of -1 different kinds,
OEIS [A010815](https://oeis.org/A010815):

~~~spl
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

Number of different partitions of _n_ into parts of -3 different kinds,
OEIS [A010816](https://oeis.org/A010816):

~~~spl
0:200.collect { :n |
	let m = 8 * n + 1;
	m.divisors.size.isOdd.if {
		let y = m.sqrt;
		y * -4.kroneckerSymbol(y)
	} {
		0
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-C.svg)

Remainder of _n_ and five,
OEIS [A010874](https://oeis.org/A010874):

~~~spl
0:40.collect { :n |
	n.quotientRemainder(5).second
}.discretePlot
~~~

![](sw/spl/Help/Image/quotientRemainder-B.svg)

An integer sequence modulo an integer,
_n%8_,
i.e. with a fixed modulus,
OEIS [A010877](https://oeis.org/A010877):

~~~spl
(0:65 % 8).discretePlot
~~~

![](sw/spl/Help/Image/mod-A.svg)

The base ten digital root of _n_,
OEIS [A010888](https://oeis.org/A010888):

~~~spl
1:50.functionPlot { :n |
	n.digitalRoot(10)
}
~~~

![](sw/spl/Help/Image/digitalRoot-A.svg)

Legendre symbol _(n,17)_,
OEIS [A011584](https://oeis.org/A011584):

~~~spl
0:85.jacobiSymbol(17).discretePlot
~~~

![](sw/spl/Help/Image/jacobiSymbol-D.svg)

Legendre symbol _(n,29)_,
OEIS [A011587](https://oeis.org/A011587):

~~~spl
0:85.jacobiSymbol(29).discretePlot
~~~

![](sw/spl/Help/Image/jacobiSymbol-E.svg)

The number of ones in the binary expansion of _3ⁿ_,
scatter plot,
OEIS [A011754](https://oeis.org/A011754):

~~~spl
(3L ^ 0:99).digitCount(2, 1)
.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-G.svg)

Smallest number _m_ such that _m(m+1)/2_ is divisible by _n_,
OEIS [A011772](https://oeis.org/A011772):

~~~spl
1:85.collect { :n |
	1:Infinity.detect { :m |
		(m * (m + 1) / 2).divisible(n)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisible-L.svg)

Levine’s triangle,
OEIS [A012257](https://oeis.org/A012257):

~~~spl
{ :x |
	x.reverse
	.withIndexCollect(List:/2)
	.catenate
}.nestList([1 1], 6)
.catenate
.stepPlot
~~~

![](sw/spl/Help/Image/nestList-D.svg)

Table of the first few cyclotomic polynomials,
OEIS [A013595](https://oeis.org/A013595):

~~~spl
1:17.collect { :n |
	n.cyclotomic.coefficientList
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/cyclotomic-H.svg)

Differences between _bⁿ_ and it’s next prime,
_b=2_,
OEIS [A013597](https://oeis.org/A013597):

~~~spl
let b = 2;
0:40.collect { :n |
	let x = b ^ n;
	x.nextPrime - x
}.stepPlot
~~~

![](sw/spl/Help/Image/nextPrime-B.svg)

Squareful numbers,
OEIS [A013929](https://oeis.org/A013929):

~~~spl
1:99.reject(isSquareFree:/1).linePlot
~~~

![](sw/spl/Help/Image/isSquareFree-B.svg)

Number of occurrences of _11_ in the binary expansion of _n_,
OEIS [A014081](http://oeis.org/A014081):

~~~spl
0:65.collect { :n |
	n.binaryExpansion
	.sequenceCount([1 1])
}.discretePlot
~~~

![](sw/spl/Help/Image/sequenceCount-D.svg)

Number of occurrences of _111_ in the binary expansion of _n_,
OEIS [A014082](http://oeis.org/A014082):

~~~spl
0:150.collect { :n |
	n.binaryExpansion
	.sequenceCount([1 1])
}.scatterPlot
~~~

![](sw/spl/Help/Image/sequenceCount-E.svg)

Number of primes between _n^2_ and _(n+1)^2_,
OEIS [A014085](https://oeis.org/A014085):

~~~spl
(0:100 ^ 2).primePi
.differences
.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-J.svg)

Integers with hamming weight of three,
OEIS [A014311](https://oeis.org/A014311):

~~~spl
0:250.select { :n |
	n.hammingWeight = 3
}.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-C.svg)

Catalan expansions of integers,
the decimal expansions of
OEIS [A014418](https://oeis.org/A014418):

~~~spl
0:23.collect(
	catalanExpansion:/1
).++.stepPlot
~~~

![](sw/spl/Help/Image/catalanExpansion-A.svg)

Catalan expansions of integers,
read as decimal integers,
OEIS [A014418](https://oeis.org/A014418):

~~~spl
0:124.collect { :n |
	n.catalanExpansion
	.fromDigits
}.stepPlot
~~~

![](sw/spl/Help/Image/catalanExpansion-B.svg)

Catalan un-ranking algorithm,
OEIS [A014486](https://oeis.org/A014486):

~~~spl
0:250.collect(catalanUnrank:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/catalanUnrank-A.svg)

`gcd` of _n_ and _2^n-1_,
OEIS [A014491](https://oeis.org/A014491):

~~~spl
(
	1:100.collect { :n |
		n.gcd(2L ^ n - 1)
	} - 1
).discretePlot
~~~

![](sw/spl/Help/Image/gcd-K.svg)

Recurrence plot of regular paperfolding sequence,
OEIS [A014577](https://oeis.org/A014577):

~~~spl
100.regularPaperfoldingSequence
.recurrenceMatrix(1, 1, 'Manhattan', 0.1)
.Bitmap
~~~

![](sw/spl/Help/Image/regularPaperfoldingSequence-B.png)

The regular paperfolding sequence,
OEIS [A014577](https://oeis.org/A014577):

~~~spl
85.regularPaperfoldingSequence
.discretePlot
~~~

![](sw/spl/Help/Image/regularPaperfoldingSequence-C.svg)

Order of two modulo the _n_-th prime,
OEIS [A014664](https://oeis.org/A014664):

~~~spl
2:150.collect { :n |
	2.multiplicativeOrder(n.prime)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-G.svg)

First differences of the lower Wythoff sequence,
a Fibonacci word,
OEIS [A014675](https://oeis.org/A014675):

~~~spl
1:65.wythoffLower
.differences
.stepPlot
~~~

![](sw/spl/Help/Image/wythoffLower-C.svg)

Second differences of the lower Wythoff sequence,
essentially
OEIS [A014677](https://oeis.org/A014677):

~~~spl
1:65.wythoffLower
.differences(2)
.discretePlot
~~~

![](sw/spl/Help/Image/wythoffLower-D.svg)

Second differences of the upper Wythoff sequence,
essentially
OEIS [A014677](https://oeis.org/A014677):

~~~spl
1:65.wythoffUpper
.differences(2)
.discretePlot
~~~

![](sw/spl/Help/Image/wythoffUpper-B.svg)

The regular paper-folding sequence,
OEIS [A014707](https://oeis.org/A014707):

~~~spl
let a = { :n |
	[
		{ n % 4 = 0 } -> { 0 },
		{ n % 4 = 2 } -> { 1 },
		{ n % 2 = 1 } -> {
			let m = (n - 1) // 2;
			a(m)
		}
	].which
};
0:92.collect(a:/1).discretePlot
~~~

![](sw/spl/Help/Image/which-A.svg)

Seidel’s triangle,
log scale scatter plot,
OEIS [A014781](https://oeis.org/A014781):

~~~spl
13.seidelTriangle
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/seidelTriangle-A.svg)

The continued fraction of the natural logarithm of two,
OEIS [A016730](https://oeis.org/A016730):

~~~spl
'Ln(2)'
.namedConstant
.continuedFraction(78)
.scatterPlot
~~~

![](sw/spl/Help/Image/namedConstant-B.svg)

Pillais arithmetical function,
[A018804](https://oeis.org/A018804):

~~~spl
{ :n |
	(n < 1).if {
		0
	} {
		n.divisorSum { :d |
			d.eulerPhi / d
		} * n
	}
}.table(1:99).discretePlot
~~~

![](sw/spl/Help/Image/eulerPhi-C.svg)

Smallest number whose square is divisible by _n_,
OEIS [A019554](https://oeis.org/A019554):

~~~spl
1:99.collect { :n |
	1:n.detect { :x |
		x.square.divisible(n)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-C.svg)

Squarefree numbers ordered lexicographically by prime factorization,
OEIS [A019565](https://oeis.org/A019565):

~~~spl
0:135.collect { :n |
	n.integerDigits(2)
	.reverse
	.indicesOf(1)
	.prime
	.product
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/indicesOf-A.svg)

Values of successive cyclotomic polynomials at _x=1_,
OEIS [A020500](https://oeis.org/A020500):

~~~spl
1:65.collect { :n |
	n.cyclotomic.at(1)
}.discretePlot
~~~

![](sw/spl/Help/Image/cyclotomic-G.svg)

Cyclotomic polynomials evaluated at _x=-1_,
OEIS [A020513](https://oeis.org/A020513):

~~~spl
1:65.collect { :n |
	cyclotomic(n).at(-1)
}.discretePlot
~~~

![](sw/spl/Help/Image/cyclotomic-F.svg)

Least prime factors of the integers from two up to one hundred,
log-scale plot,
OEIS [A020639](https://oeis.org/A020639):

~~~spl
2:100.leastPrimeFactor
.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-A.svg)

`min` of `primeFactors` is called the _least prime factor_,
OEIS [A020639](https://oeis.org/A020639):

~~~spl
{ :n |
	n.primeFactors.min
}.table(2:43).discretePlot
~~~

![](sw/spl/Help/Image/primeFactors-A.svg)

Least prime factors,
log scale plot,
OEIS [A020639](https://oeis.org/A020639):

~~~spl
{ :n |
	n.primeFactors.min
}.table(2:300).log.scatterPlot
~~~

![](sw/spl/Help/Image/primeFactors-B.svg)

Numerators in canonical bijection from positive integers to positive rationals,
OEIS [A020652](http://oeis.org/A020652):

~~~spl
let a = [];
1.toDo(23) { :d |
	1.toDo(d - 1) { :n |
		(gcd(n, d) = 1).ifTrue {
			a.add(n)
		}
	}
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/gcd-G.svg)

Numerators in canonical bijection from positive integers to positive rationals,
OEIS [A020652](https://oeis.org/A020652):

~~~spl
let y = [];
1.toDo(23) { :d |
	1.toDo(d - 1) { :n |
		n.isCoprime(d).ifTrue {
			y.add(n)
		}
	}
};
y.scatterPlot
~~~

![](sw/spl/Help/Image/isCoprime-B.svg)

Numerators in canonical bijection from positive integers to positive rationals,
OEIS [A020652](https://oeis.org/A020652):

~~~spl
1:200.collect(
	oeisFunction('A020652')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-A.svg)

Denominators in canonical bijection from positive integers to positive rationals,
OEIS [A020653](http://oeis.org/A020653):

~~~spl
1:23.collect { :n |
	let m = n - 1;
	1:m.collect { :i |
		i % n
	}.gcd(n)
	.indicesOf(1)
	.reverse
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/gcd-H.svg)

Denominators in canonical bijection from positive integers to positive rationals,
OEIS [A020653](https://oeis.org/A020653):

~~~spl
1:200.collect(
	oeisFunction('A020653')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-B.svg)

The smallest number _k_ such that _fusc(k)=n_,
OEIS [A020946](https://oeis.org/A020946):

~~~spl
0:50.collect { :n |
	0:Infinity.detect { :i |
		i.sternBrocotNumber = n
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sternBrocotNumber-B.svg)

The smallest number _k_ such that _fusc(k)=n_,
OEIS [A020946](https://oeis.org/A020946):

~~~spl
let k = 10000;
let a = k.sternBrocotSequence;
0:200.collect { :n |
	1:k.detect { :i |
		a[i] = n
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-F.svg)

The Rudin–Shapiro sequence,
OEIS [A020985](http://oeis.org/A020985):

~~~spl
0:85.collect(rudinShapiro:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/rudinShapiro-C.svg)

Triangle of coefficients of Laguerre polynomials _n!*Ln(x)_,
OEIS [A021009](https://oeis.org/A021009):

~~~spl
0:13.triangularArray { :n :k |
	(-1 ^ k) * n.! * binomial(n, k) / k.!
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-I.svg)

Count zeroes in binary expansion,
OEIS [A023416](https://oeis.org/A023416),
also
OEIS [A080791](https://oeis.org/A080791)
if initial terms is zero:

~~~spl
0:200.digitCount(2, 0)
.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-E.svg)

_i=j_,
OEIS [A023531](https://oeis.org/A023531):

~~~spl
0:11.triangularArray(=)
.catenate.boole.discretePlot
~~~

![](sw/spl/Help/Image/triangularArray-K.svg)

Characteristic function of tetrahedral numbers,
OEIS [A023533](https://oeis.org/A023533):

~~~spl
0:22.tetrahedralNumber
.characteristicFunction
.discretePlot
~~~

![](sw/spl/Help/Image/tetrahedralNumber-B.svg)

Sum of the nonprime divisors of _n_,
OEIS [A023890](https://oeis.org/A023890):

~~~spl
1:275.collect { :n |
	n.divisors.reject(isPrime:/1).sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisors-E.svg)

Dirichlet inverse of the Euler totient function,
also called the reciprocity balance of _n_,
OEIS [A023900](https://oeis.org/A023900):

~~~spl
1:115.collect(
	eulerPhi:/1.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-B.svg)

Right-truncatable primes,
every prefix is prime,
OEIS [A024770](https://oeis.org/A024770):

~~~spl
1:10000.prime.select { :n |
	n.integerDigits
	.prefixes
	.allSatisfy { :x |
		x.fromDigits
		.isPrime
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/prefixes-D.svg)

Least prime factor of _n_-th prime power,
OEIS [A025473](https://oeis.org/A025473):

~~~spl
1:240.select(isPrimePower:/1)
.collect(leastPrimeFactor:/1)
.stepPlot
~~~

![](sw/spl/Help/Image/isPrimePower-A.svg)

A sequence related to the Josephus problem,
OEIS [A025480](https://oeis.org/A025480):

~~~spl
1:84.collect { :n |
	let m = n.integerExponent(2);
	bitShiftRight(n, m + 1)
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-R.svg)

_n-k_,
count backwards and count again,
OEIS [A025581](https://oeis.org/A025581):

~~~spl
0:9.triangularArray(-).catenate.stepPlot
~~~

![](sw/spl/Help/Image/triangularArray-I.svg)

The maximum value in each orbit of the Collatz sequence:
OEIS [A025586](https://oeis.org/A025586):

~~~spl
1:200.collect { :each |
	each.collatzSequence.max
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-B.svg)

Initial triangle of _P(n,1:k)_,
OEIS [A026820](https://oeis.org/A026820):

~~~spl
1:10.triangularArray { :n :k |
	1:k.sum { :i |
		n.partitionFunctionP(i)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/partitionFunctionP-C.svg)

Tribonacci array,
OEIS [A027023](https://oeis.org/A027023):

~~~spl
let t = { :n :k |
	(k < 3 | { k = (2 * n) }).if {
		1
	} {
		1:3.sum { :i |
			t(n - 1, k - i)
		}
	}
};
0:7.collect { :n |
	let m = 2 * n;
	0:m.collect { :k |
		t(n, k)
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/collect-B.svg)

Number of ones when _n_ is written in base negative two,
OEIS [A027615](https://oeis.org/A027615):

~~~spl
0:85.collect { :n |
	n.negabinaryExpansion
	.occurrencesOf(1)
}.discretePlot
~~~

![](sw/spl/Help/Image/negabinaryExpansion-C.svg)

Absolute value of numerators of Bernoulli numbers,
`log` scale plot,
the unsigned variant of
OEIS [A027641](https://oeis.org/A027641):

~~~spl
0:50.bernoulliNumber
.numerator
.abs
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliNumber-A.svg)

Numerators of Bernoulli numbers,
`log` scale plot,
OEIS [A027641](https://oeis.org/A027641):

~~~spl
0:50.bernoulliNumber
.numerator
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliNumber-B.svg)

Numerators of Bernoulli sequence,
OEIS [A027641](https://oeis.org/A027641):

~~~spl
99.bernoulliSequence
.numerator
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliSequence-A.svg)

Denominators of Bernoulli numbers,
`log` scale plot,
OEIS [A027642](https://oeis.org/A027642):

~~~spl
0:50.bernoulliNumber
.denominator
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/bernoulliNumber-C.svg)

Denominators of Bernoulli sequence,
OEIS [A027642](https://oeis.org/A027642):

~~~spl
99.bernoulliSequence
.denominator
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliSequence-B.svg)

Irregular triangle of distinct prime factors,
OEIS [A027748](https://oeis.org/A027748):

~~~spl
2:115.collect(distinctPrimeFactors:/1)
.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/distinctPrimeFactors-B.svg)

Triangle read by rows listing the divisors of _n_,
OEIS [A027750](https://oeis.org/A027750):

~~~spl
1:23.divisors.catenate.discretePlot
~~~

![](sw/spl/Help/Image/divisors-M.svg)

Irregular triangle of the proper divisors of _n_,
OEIS [A027751](https://oeis.org/A027751):

~~~spl
2:31.collect { :n |
	n.divisors.allButLast
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/divisors-O.svg)

Highest power of smallest prime dividing _n_,
OEIS [A028233](https://oeis.org/A028233):

~~~spl
1:86.collect { :n |
	let [p, e] = n.factorInteger.first;
	p ^ e
}.discretePlot
~~~

![](sw/spl/Help/Image/first-A.svg)

Iterate the amusical permutation map starting at eight,
OEIS [A028393](https://oeis.org/A028393):

~~~spl
amusicalPermutation:/1
.nestList(8, 65)
.discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-C.svg)

Iterate the amusical permutation map starting at eight,
log scale scatter plot,
OEIS [A028393](https://oeis.org/A028393):

~~~spl
amusicalPermutation:/1
.nestList(8, 250)
.log
.linePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-D.svg)

Iterate the amusical permutation map starting at fourteen,
OEIS [A028395](https://oeis.org/A028395):

~~~spl
amusicalPermutation:/1
.nestList(14, 250)
.log
.linePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-E.svg)

The smallest number in the trajectory of the amusical permutation map,
OEIS [A028397](https://oeis.org/A028397):

~~~spl
0:150.collect { :n |
	amusicalPermutation:/1
	.nestList(n, 100).min
}.scatterPlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-B.svg)

Left inverse of binary expansions,
OEIS [A028897](https://oeis.org/A028897):

~~~spl
let a = { :n |
	(n < 10).if {
		n
	} {
		(n % 10 != 0).if {
			a(n - 1) + 1
		} {
			2 * a(n / 10)
		}
	}
};
0:200.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/mod-K.svg)

Pit harvesting sequence for winning solitaire Tchoukaillon,
OEIS [A028920](https://oeis.org/A028920):

~~~spl
0:150.collect { :n |
	1:Infinity.detect { :m |
		let p = (n % (m + 1)) = 0;
		n := n * m // (m + 1);
		p
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/detect-A.svg)

Ordinal transform of
pit harvesting sequence for winning solitaire Tchoukaillon,
OEIS [A028920](https://oeis.org/A028920):

~~~spl
0:150.collect { :n |
	1:Infinity.detect { :m |
		let p = (n % (m + 1)) = 0;
		n := n * m // (m + 1);
		p
	}
}.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/detect-B.svg)

Interleave _n_ and _2n_,
OEIS [A029578](https://oeis.org/A029578):

~~~spl
let n = 0:35;
[n, 2 * n].interleave.discretePlot
~~~

![](sw/spl/Help/Image/interleave-E.svg)

The _(1,2)_-Pascal triangle,
_C(n,k)+C(n-1,k-1)_,
OEIS [A029635](https://oeis.org/A029635):

~~~spl
0:9.triangularArray { :n :k |
	(n + k = 0).if {
		2
	} {
		binomial(n, k)
		+
		binomial(n - 1, k - 1)
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/binomial-R.svg)

`bitLength` is a kind of staircase function,
OEIS [A029837](https://oeis.org/A029837):

~~~spl
(-25:25).bitLength.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-A.svg)

`bitLength` up to _2^9_,
OEIS [A029837](https://oeis.org/A029837):

~~~spl
let n = 2 ^ 9;
0:n.bitLength.stepPlot
~~~

![](sw/spl/Help/Image/bitLength-E.svg)

First differences of the Thue–Morse sequence,
OEIS [A029883](https://oeis.org/A029883):

~~~spl
99.thueMorseSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-B.svg)

Least number that is not a sum of distinct divisors of _n_,
OEIS [A030057](https://oeis.org/A030057):

~~~spl
1:100.collect { :n |
	let m = 1.divisorSigma(n) + 1;
	let d = n.divisors;
	let b = d.powerSet.collect(sum:/1);
	1:m.detect { :n |
		b.includes(n).not
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/divisors-I.svg)

The semi-Fibonacci sequence,
OEIS [A030067](https://oeis.org/A030067):

~~~spl
125.fibonacciSequence(
	'Semi-Fibonacci'
).log.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacciSequence-B.svg)

Log plot of the semi-Fibonacci sequence,
OEIS [A030067](https://oeis.org/A030067):

~~~spl
let a = Map { :n |
	(n = 1).if {
		1
	} {
		n.isEven.if {
			a[n / 2]
		} {
			a[n - 1] + a[n - 2]
		}
	}
};
a[1:125].log.scatterPlot
~~~

![](sw/spl/Help/Image/isEven-A.svg)

Binary reversal,
OEIS [A030101](https://oeis.org/A030101):

~~~spl
0:200.collect { :i |
	i.integerDigits(2)
	.reverse
	.fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-A.svg)

Numerators of binary van der Corput sequence,
OEIS [A030101](https://oeis.org/A030101):

~~~spl
0:300.vanDerCorputNumber(2)
.numerator
.scatterPlot
~~~

![](sw/spl/Help/Image/vanDerCorputNumber-G.svg)

Digital root of Fibonacci numbers,
OEIS [A030132](https://oeis.org/A030132):

~~~spl
0:65.fibonacci
.digitalRoot(10)
.discretePlot
~~~

![](sw/spl/Help/Image/digitalRoot-B.svg)

Next term is sum of the digits of the sum of the previous two terms,
OEIS [A030133](https://oeis.org/A030133):

~~~spl
{ :a :n |
	(a[n - 1] + a[n - 2]).digitSum
}.recurrenceTable([2 1], 48).discretePlot
~~~

![](sw/spl/Help/Image/recurrenceTable-E.svg)

The _b=2_ Champernowne sequence,
OEIS [A030190](https://oeis.org/A030190):

~~~spl
2.champernowneSequence(65)
.discretePlot
~~~

![](sw/spl/Help/Image/champernowneSequence-B.svg)

Euler transform of _-1,-1,-2_,
OEIS [A030203](https://oeis.org/A030203):

~~~spl
0:115.collect(
	[-1 -1 -2].periodicFunction
	.eulerTransform
).discretePlot
~~~

![](sw/spl/Help/Image/eulerTransform-B.svg)

Write _n_ in base three and reverse order of digits,
OEIS [A030341](https://oeis.org/A030341):

~~~spl
0:40.collect { :n |
	n.integerDigits(3).reverse
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/integerDigits-T.svg)

Scatter plot of the additive persistences of the first few positive integers,
OEIS [A031286](https://oeis.org/A031286):

~~~spl
1:200.collect { :n |
	n.additivePersistence(10)
}.scatterPlot
~~~

![](sw/spl/Help/Image/additivePersistence-A.svg)

The multiplicative persistences of the first few positive integers,
OEIS [A031346](https://oeis.org/A031346):

~~~spl
1:100.collect { :n |
	n.multiplicativePersistence(10)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativePersistence-A.svg)

Multiplicative persistence,
OEIS [A031346](https://oeis.org/A031346):

~~~spl
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

~~~spl
1:65.collect { :n |
	{ :x |
		(x.integerDigits ^ 2).product
	}.nestWhileList(n) { :x |
		x > 1
	}.size - 1
}.stepPlot
~~~

![](sw/spl/Help/Image/nestWhileList-C.svg)

Triangle of answers for the Josephus problem at _n=1-14_,
OEIS [A032434](https://oeis.org/A032434):

~~~spl
1:17.collect { :n |
	1:n.collect { :k |
		josephusProblem(n, k)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/josephusProblem-C.svg)

The inverse of the Euler totient function,
OEIS [A032447](https://oeis.org/A032447):

~~~spl
1:50.eulerPhiInverse
.++
.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhiInverse-A.svg)

The aliquot sequences up to twenty three that reach one,
OEIS [A032451](https://oeis.org/A032451):

~~~spl
1:23.aliquotSequence
.select { :x | x.last = 1 }
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSequence-C.svg)

The aliquot sequences up to sixty that reach one,
OEIS [A032451](https://oeis.org/A032451):

~~~spl
1:60.aliquotSequence
.select { :x | x.last = 1 }
.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/aliquotSequence-D.svg)

Maximum divisor of _n_,
OEIS [A032742](https://oeis.org/A032742):

~~~spl
2:85.collect { :n |
	n / n.leastPrimeFactor
}.discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-F.svg)

Numbers whose ternary expansion contains no zero,
OEIS [A032924](https://oeis.org/A032924):

~~~spl
0:400.reject { :n |
	n.ternaryExpansion.includes(0)
}.scatterPlot
~~~

![](sw/spl/Help/Image/ternaryExpansion-A.svg)

Number of occurrences of _10_ in the binary expansion of _n_,
OEIS [A033264](http://oeis.org/A033264):

~~~spl
0:65.collect { :n |
	n.binaryExpansion
	.sequenceCount([1 0])
}.discretePlot
~~~

![](sw/spl/Help/Image/sequenceCount-C.svg)

Squares of primes (_e_),
or products of pairs of consecutive primes (_o_),
OEIS [A033476](https://oeis.org/A033476),
also
OEIS [A057602](https://oeis.org/A057602) without leading two:

~~~spl
let p = 1:25.prime;
let q = p.partition(2, 1);
let e = p ^ 2;
let o = q.collect(product:/1);
e.riffle(o).scatterPlot
~~~

![](sw/spl/Help/Image/prime-P.svg)

Primes where every suffix is prime,
OEIS [A033664](https://oeis.org/A033664):

~~~spl
1:200.prime.select { :n |
	n.integerDigits
	.allButFirst
	.suffixes
	.collect(fromDigits:/1)
	.allSatisfy(isPrime:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-L.svg)

Largest divisor of _n_,
_≤√n_,
OEIS [A033676](https://oeis.org/A033676):

~~~spl
1:100.collect { :n |
	let m = n.sqrt;
	n.divisors.select { :x |
		x <= m
	}.last
}.stepPlot
~~~

![](sw/spl/Help/Image/divisors-F.svg)

_|a_4(n)|_,
OEIS [A033715](https://oeis.org/A033715):

~~~spl
0:103.collect { :n |
	(n < 1).if {
		(n = 0).boole
	} {
		2 * n.divisorSum { :m |
			-2.kroneckerSymbol(m)
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-F.svg)

Making numbers into palindromic numbers,
OEIS [A033865](https://oeis.org/A033865):

~~~spl
0:87.collect { :n |
	{ :i |
		let j = i.integerDigits;
		i + j.reverse.fromDigits
	}.nestWhile(n) { :i |
		let j = i.integerDigits;
		j.isPalindrome.not
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-K.svg)

Dirichlet inverse of the deficiency of _n_,
OEIS [A033879](https://oeis.org/A033879):

~~~spl
1:115.collect(
	{ :n |
		(2 * n) - 1.divisorSigma(n)
	}.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-D.svg)

Deficiency of _n_,
OEIS [A033879](https://oeis.org/A033879):

~~~spl
1:115.collect { :n |
	(2 * n) - 1.divisorSigma(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-P.svg)

Abundance of _n_,
OEIS [A033880](https://oeis.org/A033880):

~~~spl
let n = 1:70;
(1.divisorSigma(n) - (2 * n)).discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-V.svg)

Integers on the positive x-axis of clockwise spiral on a square lattice,
OEIS [A033953](https://oeis.org/A033953):

~~~spl
let k = 105;
let m = (k ^ 2) + (10 * k);
let a = 0:m.collect(
	integerDigits:/1
).catenate;
0:k.collect { :n |
	(n = 0).if {
		0
	} {
		a[
			(4 * (n ^ 2))
			+
			(3 * n) + 1
		]
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/integerDigits-R.svg)

_-1^n_,
the _1,-1_ sequence,
OEIS [A033999](https://oeis.org/A033999):

~~~spl
[1 -1].repeat(30).discretePlot
~~~

![](sw/spl/Help/Image/repeat-C.svg)

Record positions of aliquot sums,
OEIS [A034090](https://oeis.org/A034090):

~~~spl
1:250.aliquotSum
.recordPositions
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-B.svg)

Record values of aliquot sums,
OEIS [A034091](https://oeis.org/A034091):

~~~spl
1:250.aliquotSum
.recordValues
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-C.svg)

Sum of primes _≤n_,
OEIS [A034387](https://oeis.org/A034387):

~~~spl
1:250.collect { :n |
	n * n.isPrime.boole
}.prefixSum.stepPlot
~~~

![](sw/spl/Help/Image/isPrime-I.svg)

_σ⃰ₖ(n)_ where _k=1_,
OEIS [A034448](https://oeis.org/A034448):

~~~spl
1:250.collect { :n |
	1.unitaryDivisorSigma(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/unitaryDivisorSigma-A.svg)

_uσ(n)-n_,
OEIS [A034460](https://oeis.org/A034460),
also but for first term
OEIS [A063919](https://oeis.org/A063919):

~~~spl
1:100.collect { :n |
	1.unitaryDivisorSigma(n) - n
}.discretePlot
~~~

![](sw/spl/Help/Image/unitaryDivisorSigma-C.svg)

_σ⃰ₖ(n)_ where _k=2_,
OEIS [A034676](https://oeis.org/A034676):

~~~spl
1:20.collect { :n |
	2.unitaryDivisorSigma(n)
}.stepPlot
~~~

![](sw/spl/Help/Image/unitaryDivisorSigma-B.svg)

Losanitsch’s triangle,
OEIS [A034851](https://oeis.org/A034851):

~~~spl
0:10.triangularArray { :n :k |
	let p = qBinomial(n, k);
	(p[1] + p[-1]) / 2
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/qBinomial-C.svg)

Pascal’s triangle modulo four,
OEIS [A034931](https://oeis.org/A034931):

~~~spl
(14.pascalTriangle % 4)
.catenate
.stepPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-J.svg)

Kronecker symbol _-1,n_,
the regular paperfolding sequence,
OEIS [A034947](https://oeis.org/A034947):

~~~spl
1:85.collect { :n |
	-1.kroneckerSymbol(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-K.svg)

Minimal number of factorials that add to _n_,
OEIS [A034968](https://oeis.org/A034968):

~~~spl
0:143.collect { :n |
	n.factorialExpansion.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/factorialExpansion-A.svg)

Coefficients of Dedekind zeta function for the quadratic number field of discriminant seventeen,
OEIS [A035199](https://oeis.org/A035199):

~~~spl
1:115.collect { :n |
	n.divisorSum { :d |
		17.kroneckerSymbol(d)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-J.svg)

The complement of the period doubling sequence,
OEIS [A035263](https://oeis.org/A035263):

~~~spl
(1 - 105.periodDoublingSequence)
.discretePlot
~~~

![](sw/spl/Help/Image/periodDoublingSequence-D.svg)

The trajectory of 1 under the morphism _0→11,1→10_,
OEIS [A035263](https://oeis.org/A035263):

~~~spl
[
	0 -> [1 1],
	1 -> [1 0]
].substitutionSystem([1], 6)
.last
.discretePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-F.svg)

Kimberling’s expulsion array read by antidiagonals,
OEIS [A035486](https://oeis.org/A035486):

~~~spl
let a = { :n :k |
	(k >= ((2 * n) - 3)).if {
		n + k - 1
	} {
		let [q, r] = quotientRemainder(
			k + 1,
			2
		);
		a(
			n - 1,
			n - 1 + ((1 - (2 * r)) * q)
		)
	}
};
23.antidiagonalArray(a:/2)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/quotientRemainder-C.svg)

Relevant part of deck in Guy’s shuffling problem,
OEIS [A035491](https://oeis.org/A035491):

~~~spl
guyShuffle:/1.nestList([], 15)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/guyShuffle-A.svg)

The infinite Stolarsky array,
read by antidiagonals,
OEIS [A035506](https://oeis.org/A035506):

~~~spl
13.antidiagonalArray(
	stolarskyArray:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/stolarskyArray-B.svg)

Wythoff array read by falling antidiagonals,
OEIS [A035513](https://oeis.org/A035513):

~~~spl
10.antidiagonalArray(
	wythoffArray:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffArray-A.svg)

Summands for each entry,
OEIS [A035517](https://oeis.org/A035517):

~~~spl
0:50.collect { :n |
	let z = n.zeckendorfRepresentation;
	let i = z.reverse.indicesOf(1);
	(i + 1).fibonacci
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-D.svg)

All the parts of all reversed partitions,
sorted first by length and then lexicographically.
OEIS [A036036](https://oeis.org/A036036):

~~~spl
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedReflectedColexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-A.svg)

Partitions in graded colexicographical ordering,
OEIS [A036037](https://oeis.org/A036037):

~~~spl
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedColexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-E.svg)

Write in binary, complement, reverse,
OEIS [A036044](https://oeis.org/A036044):

~~~spl
0:63.collect { :n |
	(1 - n.binaryExpansion)
	.reverse
	.binaryContraction
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-F.svg)

Table,
read by upward antidiagonals,
where the leading row lists the primes,
and following rows list the absolute values of the differences of the previous row,
OEIS [A036262](https://oeis.org/A036262):

~~~spl
let m = 12;
let t = { :x |
	x.differences.abs
}.nestList(1:m.prime, m);
1:m.triangularArray { :n :k |
	t[n - k + 1][k]
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/differences-G.svg)

Second differences of primes,
OEIS [A036263](https://oeis.org/A036263):

~~~spl
1:85.prime.differences(2).discretePlot
~~~

![](sw/spl/Help/Image/differences-H.svg)

_a(n)+a(n-1)=p(n)_,
OEIS [A036467](https://oeis.org/A036467):

~~~spl
0:200.collect { :n |
	2:n.sum { :k |
		k.prime * (-1 ^ (k + 1))
	} + 1
}.abs.scatterPlot
~~~

![](sw/spl/Help/Image/prime-L.svg)

Hamming weight of _3n_,
OEIS [A036555](https://oeis.org/A036555):

~~~spl
(0:250 * 3).hammingWeight.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-D.svg)

Genocchi numbers,
OEIS [A036968](https://oeis.org/A036968):

~~~spl
0:27.genocchiNumber
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/genocchiNumber-A.svg)

The Fredholm-Rueppel sequence,
OEIS [A036987](https://oeis.org/A036987):

~~~spl
0:6.collect { :k |
	[1].padRight([2 ^ k], 0)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/padRight-B.svg)

Numbers where the run lengths of the binary expansion do not increase,
OEIS [A037014](https://oeis.org/A037014):

~~~spl
0:500.select { :n |
	n.integerDigits(2)
	.split(=)
	.collect(size:/1)
	.differences
	.allSatisfy { :x |
		x >= 0
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/split-B.svg)

Numbers where,
in the binary expansion,
run lengths do not decrease,
OEIS [A037016](https://oeis.org/A037016):

~~~spl
0:250.select { :n |
	n.integerDigits(2)
	.split(=)
	.collect(size:/1)
	.reverse
	.isSorted
}.scatterPlot
~~~

![](sw/spl/Help/Image/isSorted-B.svg)

Count nonsingular complex Hermitian matrices,
OEIS [A037227](https://oeis.org/A037227):

~~~spl
1:120.collect { :n |
	2 * n.integerExponent(2) + 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-E.svg)

Count nonsingular complex Hermitian matrices,
OEIS [A037227](https://oeis.org/A037227):

~~~spl
1:102.collect { :n |
	n.divisors.sum { :d |
		(-1^ (d + 1))
		*
		d.moebiusMu
		*
		0.divisorSigma(n / d)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/moebiusMu-C.svg)

Number of infinitary divisors of _n_,
OEIS [A037445](https://oeis.org/A037445):

~~~spl
1:85.collect { :n |
	n.primeSignature.collect { :e |
		2 ^ e.hammingWeight
	}.product
}.stepPlot
~~~

![](sw/spl/Help/Image/primeSignature-J.svg)

_|⌊(cot(n))_,
OEIS [A037448](https://oeis.org/A037448):

~~~spl
1:200.cot.floor.abs
.log.scatterPlot
~~~

![](sw/spl/Help/Image/cot-C.svg)

_⌊(cot(n))_,
OEIS [A037448](https://oeis.org/A037448):

~~~spl
1:200.cot.floor
.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/cot-D.svg)

Number of occurrences of _01_ in the binary expansion of _n_,
OEIS [A037800](http://oeis.org/A037800):

~~~spl
0:65.collect { :n |
	n.binaryExpansion
	.sequenceCount([0 1])
}.discretePlot
~~~

![](sw/spl/Help/Image/sequenceCount-B.svg)

The difference between the number of zeroes and ones in the base-two representation _n_,
OEIS [A037861](https://oeis.org/A037861):

~~~spl
0:95.collect { :n |
	let b = n.binaryExpansion;
	let k = b.size;
	let i = b.occurrencesOf(0);
	i - (k - i)
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-K.svg)

Range of digits of _n_,
OEIS [A037904](https://oeis.org/A037904):

~~~spl
0:250.collect { :n |
	let d = n.integerDigits;
	d.max - d.min
}.scatterPlot
~~~

![](sw/spl/Help/Image/min-A.svg)

An array of numbers for a ternary numeration system read by antidiagonals,
OEIS [A038150](https://oeis.org/A038150):

~~~spl
let phi = 1.goldenRatio;
let t = { :n :j |
	(j = 1).if {
		((n - 1) * phi).floor + 1
	} {
		(phi.square * t(n, j - 1)).floor + 1
	}
};
1:11.triangularArray { :n :m |
	t(n - m + 1, m)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/goldenRatio-J.svg)

_C(i,j)*2^(i-j)_,
OEIS [A038207](https://oeis.org/A038207):

~~~spl
0:9.triangularArray { :i :j |
	binomial(i, j) * (2 ^ (i - j))
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/binomial-O.svg)

The Ehrenfeucht-Mycielski sequence,
OEIS [A038219](https://oeis.org/A038219):

~~~spl
105.ehrenfeuchtMycielskiSequence
.discretePlot
~~~

![](sw/spl/Help/Image/ehrenfeuchtMycielskiSequence-A.svg)

Number of divisors of _n_ that are at most _√n_,
OEIS [A038548](http://oeis.org/A038548):

~~~spl
1:85.collect { :n |
	(0.divisorSigma(n) + 1) / 2
}.floor.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-E.svg)

Replace each pair of adjacent bits with their sum,
OEIS [A038554](https://oeis.org/A038554):

~~~spl
0:250.collect { :n |
	let a = (n / 2).floor.bitXor(n);
	a - (2 ^ a.log2.floor)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-F.svg)

Derivative of _n_,
OEIS [A038554](https://oeis.org/A038554):

~~~spl
0:115.collect { :n |
	n.grayEncode - (2 ^ n.log2.floor)
}.discretePlot
~~~

![](sw/spl/Help/Image/grayEncode-J.svg)

Derivative of _n_ in base three,
OEIS [A038555](https://oeis.org/A038555):

~~~spl
0:200.collect { :n |
	n.integerDigits(3)
	.partition(2, 1)
	.collect { :x |
		x.sum % 3
	}.fromDigits(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/partition-B.svg)

Periodic derivative of _n_,
OEIS [A038556](https://oeis.org/A038556):

~~~spl
0:76.collect { :n |
	let b = n.integerDigits(2);
	b.bitXor(b.rotateLeft).fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/rotateLeft-A.svg)

Numerators in canonical bijection from positive integers to positive rationals _≤1_,
OEIS [A038566](http://oeis.org/A038566):

~~~spl
1:23.collect { :n |
	1:n.select { :i |
		n.gcd(i) = 1
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/gcd-J.svg)

Numerators in canonical bijection from positive integers to positive rationals,
OEIS [A038568](http://oeis.org/A038568):

~~~spl
1:200.collect(
	oeisFunction('A038568')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-C.svg)

Denominators in canonical bijection from positive integers to positive rationals,
OEIS [A038569](http://oeis.org/A038569):

~~~spl
1:200.collect(
	oeisFunction('A038569')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-D.svg)

Prefix sum of primes modulo four minus two,
OEIS [A038698](https://oeis.org/A038698):

~~~spl
+.foldList(
	0,
	2:267.prime % 4 - 2
).scatterPlot
~~~

![](sw/spl/Help/Image/prime-E.svg)

Riesel problem,
OEIS [A038699](https://oeis.org/A038699):

~~~spl
1:99.collect { :n |
	let m = 0;
	let x = nil;
	{
		x := n * (2 ^ m) - 1;
		x.isPrime
	}.whileFalse {
		m := m + 1
	};
	x
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/isPrime-C.svg)

Exclusive or of adjacent integers,
_n⊕(n-1)_,
OEIS [A038712](https://oeis.org/A038712):

~~~spl
1:125.collect { :n |
	n.bitXor(n - 1)
}.log.discretePlot
~~~

![](sw/spl/Help/Image/bitXor-M.svg)

Select _n_ where alternating sum of reverse of binary expansion is zero,
OEIS [A039004](https://oeis.org/A039004):

~~~spl
0:200.select { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum = 0
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-G.svg)

Odd-numbered columns of triangle of expansions of powers of _x_ in terms of Chebyshev polynomials _Un(x)_,
OEIS [A039598](https://oeis.org/A039598):

~~~spl
0:15.triangularArray { :n :k |
	binomial(2 * n, n - k)
	-
	binomial(2 * n, n - k - 2)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-P.svg)

Fixed point of _n←(n-1)/2_ until result is prime,
OEIS [A039634](https://oeis.org/A039634):

~~~spl
1:150.collect { :n |
	{ :x |
		(x.isPrime | { x = 1 }).if {
			x
		} {
			(x - 1) // 2
		}
	}.fixedPoint(n, =)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fixedPoint-A.svg)

Smallest number _m>1_ such that _m^(p-1)-1_ is divisible by _p^2_,
OEIS [A039678](https://oeis.org/A039678):

~~~spl
1:150.collect { :n |
	let p = n.prime;
	2:Infinity.detect { :a |
		a.powerMod(p - 1, p ^ 2) = 1
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-G.svg)

The signed Fibonacci numbers,
OEIS [A039834](https://oeis.org/A039834):

~~~spl
1:65.fibonacci
.inverseBinomialTransform
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/inverseBinomialTransform-A.svg)

Parity of the partition numbers,
OEIS [A040051](https://oeis.org/A040051):

~~~spl
0:115.collect { :n |
	n.partitionFunctionP
	.isOdd.boole
}.discretePlot
~~~

![](sw/spl/Help/Image/partitionFunctionP-D.svg)

Absolute values of differences between digits of _n+10_,
OEIS [A040114](https://oeis.org/A040114):

~~~spl
1:125.collect { :n |
	n.integerDigits.differences.abs
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/differences-E.svg)

Join absolute values of differences between digits of _n_,
OEIS [A040115](https://oeis.org/A040115):

~~~spl
0:125.collect { :n |
	n.integerDigits
	.differences
	.abs
	.fromDigits
}.discretePlot
~~~

![](sw/spl/Help/Image/differences-F.svg)

Absolute value of the first digit of _n_ minus the last digit,
OEIS [A040163](https://oeis.org/A040163):

~~~spl
1:125.collect { :n |
	let d = n.integerDigits;
	(d.first - d.last).abs
}.discretePlot
~~~

![](sw/spl/Help/Image/abs-D.svg)

Absolute value of the first digit of _n_ minus the sum of the remaining digits,
OEIS [A040997](https://oeis.org/A040997):

~~~spl
50:175.collect { :n |
	let d = n.integerDigits;
	(d.first - d.allButFirst.sum).abs
}.discretePlot
~~~

![](sw/spl/Help/Image/abs-E.svg)

The length of the first few aliquot sequences,
OEIS [A044050](https://oeis.org/A044050):

~~~spl
1:85.collect { :n |
 	n.aliquotSequence.size
}.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSequence-A.svg)

Least _k_ such that sum of first _k_ primes is _n_ times a prime,
OEIS [A045985](https://oeis.org/A045985):

~~~spl
let m = 15000;
let p = 1:m.prime.prefixSum;
let t = [1:m, p].transpose;
1:250.collect { :n |
	t.detect { :x |
		(x[2] / n).isPrime
	}.first
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/prime-K.svg)

Least _k>1_ with _k=Σ(d(k^n))_,
OEIS [A046017](https://oeis.org/A046017):

~~~spl
1:47.collect { :n |
	let k = 2L;
	{
		k = (k ^ n).integerDigits.sum
	}.whileFalse {
		k := k + 1
	};
	k
}.stepPlot
~~~

![](sw/spl/Help/Image/integerDigits-Q.svg)

Least inverse of the Kempner function,
OEIS [A046021](https://oeis.org/A046021):

~~~spl
2:150.collect { :n |
	let p = n.greatestPrimeFactor;
	let m = ((n - 1).log / p.log).floor;
	let q = 1:m.sum { :k |
		((n - 1) / (p ^ k)).floor
	};
	p ^ (1 + q)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/greatestPrimeFactor-C.svg)

Least size of generators for multiplicative group of integers modulo _n_,
OEIS [A046072](https://oeis.org/A046072):

~~~spl
3:102.collect { :n |
	n.primeNu + n.isOdd.if {
		0
	} {
		(n / 4).isInteger.not.if {
			-1
		} {
			(n / 8).isInteger.not.if {
				0
			} {
				1
			}
		}
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-G.svg)

Number of squares in multiplicative group modulo _n_,
OEIS [A046073](https://oeis.org/A046073):

~~~spl
1:86.collect { :n |
	n.eulerPhi / 1:n.sum { :k |
		(k.square % n = 1).boole
		+
		(n = 1).boole
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/eulerPhi-L.svg)

The digits of Calabi’s constant,
scatter plot,
OEIS [A046095](https://oeis.org/A046095):

~~~spl
1.calabisConstant(101)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/calabisConstant-A.svg)

Cubeful numbers,
OEIS [A046099](https://oeis.org/A046099):

~~~spl
1:500.reject(isCubeFree:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/isCubeFree-B.svg)

Number of Gaussian integers _x+yi_ having absolute value _n_,
OEIS [A046109](https://oeis.org/A046109):

~~~spl
0:47.collect { :n |
	j:/2.table(-n:n, -n:n)
	.catenate
	.select { :x |
		x.abs = n
	}.size
}.stepPlot
~~~

![](sw/spl/Help/Image/j-A.svg)

Smallest primitive root modulo _n_ or 0 if no root exists,
OEIS [A046145](https://oeis.org/A046145):

~~~spl
1:85.collect { :n |
	let r = n.primitiveRootList;
	r.ifEmpty { 0 } { r.min }
}.discretePlot
~~~

![](sw/spl/Help/Image/primitiveRootList-G.svg)

Largest primitive root modulo _n_ or 0 if no root exists,
OEIS [A046146](https://oeis.org/A046146):

~~~spl
1:85.collect { :n |
	let r = n.primitiveRootList;
	r.ifEmpty { 0 } { r.max }
}.discretePlot
~~~

![](sw/spl/Help/Image/primitiveRootList-H.svg)

Primitive roots of _n_
OEIS [A046147](https://oeis.org/A046147):

~~~spl
2:43.collect(primitiveRootList:/1)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/primitiveRootList-A.svg)

The smallest number with the same prime signature as _n_,
OEIS [A046523](https://oeis.org/A046523):

~~~spl
2:100.collect { :n |
	let s = n.primeSignature;
	2:n.detect { :x |
		x.primeSignature = s
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeSignature-B.svg)

Number of distinct cubic residues modulo _n_,
OEIS [A046530](https://oeis.org/A046530):

~~~spl
1:200.collect { :p |
	1:p.select { :q |
		isCubicResidue(q, p)
	}.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/isCubicResidue-B.svg)

Dirichlet series,
square is zeta function,
[A046644](https://oeis.org/A046644):

~~~spl
let a = { :n |
	n.divisors.collect { :d |
		n * d.eulerPhi / d
	}.sum
};
let d = { :n |
	n.divisors.allButFirstAndLast
};
let f = { :n |
	(n = 1).if {
		1
	} {
		1/2 * (
			a(n) - d(n).collect { :d |
				f(d) * f(n / d)
			}.sum
		)
	}
};
1:99.collect { :n |
	f(n).denominator
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-D.svg)

Sum of _2e-w(2e)_ of prime signature of _n_,
OEIS [A046645](https://oeis.org/A046645):

~~~spl
2:100.collect { :n |
	n.primeSignature.sum { :e |
		(2 * e) - (2 * e).digitCount(2, 1)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/digitCount-I.svg)

Dirichlet inverse of the σ function,
OEIS [A046692](https://oeis.org/A046692):

~~~spl
1:115.collect(
	{ :n |
		1.divisorSigma(n)
	}.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-C.svg)

Dirichlet inverse of sigma function,
OEIS [A046692](http://oeis.org/A046692):

~~~spl
1:200.collect { :n |
	let k = 0;
	1.toDo(n) { :d |
		(n % d = 0).ifTrue {
			let a = d.moebiusMu;
			let b = (n / d).moebiusMu;
			k := k + (d * a * b)
		}
	};
	k
}.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-E.svg)

Period of Fibonacci three-step sequence modulo _n_,
OEIS [A046738](https://oeis.org/A046738):

~~~spl
2:52.collect(
	tribonacciPisanoPeriod:/1
).discretePlot
~~~

![](sw/spl/Help/Image/tribonacciNumber-A.svg)

`max` of `min` of all summands of _n_,
OEIS [A046805](https://oeis.org/A046805):

~~~spl
let f = { :n |
	(n = 0).if {
		Infinity
	} {
		n.isPerfectSquare.if {
			n.sqrt
		} {
			let a = n.sqrt.floor;
			let u = 1;
			{
				a > u
			}.whileTrue {
				let b = a;
				{
					b <= (n / a)
				}.whileTrue {
					let v = a.min(
						f(n - (a * b))
					);
					u := u.max(v);
					b := b + 1
				};
				a := a - 1
			};
			u
		}
	}
};
1:115.collect(f:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isPerfectSquare-A.svg)

Number of ways to express _2n+1_ as _p+2q_ where _p_ and _q_ are primes,
OEIS [A046927](https://oeis.org/A046927):

~~~spl
0:150.collect { :n |
	[1 2].frobeniusSolve(2 * n + 1)
	.count { :x |
		x.allSatisfy(isPrime:/1)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-B.svg)

The width of the moat of composite numbers surrounding the n-th prime,
OEIS [A046929](https://oeis.org/A046929):

~~~spl
let k = 65;
1:k.prime
.partition(3, 1)
.collect { :m |
	m.differences.min - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/prime-C.svg)

Size of sea of composite numbers surrounding _n_-th prime,
OEIS [A046930](https://oeis.org/A046930):

~~~spl
1:150.collect { :n |
	(n + 2).prime - n.prime - 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/prime-H.svg)

Largest quadratic residues,
OEIS [A047210](https://oeis.org/A047210):

~~~spl
2:75.collect { :p |
	p.quadraticResidues.last
}.stepPlot
~~~

![](sw/spl/Help/Image/quadraticResidues-B.svg)

Denominators of Farey (or Stern-Brocot) tree fractions,
OEIS [A047679](https://oeis.org/A047679):

~~~spl
8.sternBrocotTree
.levelOrderValues
.denominator
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotTree-B.svg)

A variant of the look and say sequence describing the digit count,
OEIS [A047842](https://oeis.org/A047842):

~~~spl
0:49.collect { :n |
	0:9.collect { :k |
		[n.digitCount(10, k), k]
	}.select { :d |
		d[1] > 0
	}.catenate
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/lookAndSay-A.svg)

_φ(m)*m^k*k!/n_ where _m=n/k_,
OEIS [A047917](https://oeis.org/A047917):

~~~spl
1:11.triangularArray { :n :k |
	n.divisible(k).if {
		let m = n / k;
		m.eulerPhi * (m ^ k) * k.! / n
	} {
		0
	}
}.catenate.log.discretePlot
~~~

![](sw/spl/Help/Image/eulerPhi-N.svg)

Smallest positive Fibonacci number divisible by _n_,
OEIS [A047930](https://oeis.org/A047930):

~~~spl
let x = 1:250.fibonacci;
1:100.collect { :n |
	x.detect { :x |
		x.divisible(n)
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/fibonacci-K.svg)

Number of integers less than _n_ but with the same number of divisors,
OEIS [A047983](https://oeis.org/A047983):

~~~spl
1:150.collect { :n |
	let tau = 0.divisorSigma(n);
	let m = n - 1;
	1:m.count { :x |
		0.divisorSigma(x) = tau
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-H.svg)

Circular binomial coefficients,
OEIS [A047996](https://oeis.org/A047996):

~~~spl
0:12.triangularArray { :n :k |
	([n k] = [0 0]).if {
		1
	} {
		n.gcd(k).divisorSum { :d |
			d.eulerPhi
			*
			binomial(n / d, k / d)
		} / n
	}
}.catenate.log.discretePlot
~~~

![](sw/spl/Help/Image/binomial-G.svg)

Sierpiński’s triangle,
matrix plot,
OEIS [A047999](https://oeis.org/A047999):

~~~spl
(24.pascalTriangle % 2)
.padRight
.matrixPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-C.svg)

Sierpiński’s triangle,
row-order discrete plot,
OEIS [A047999](https://oeis.org/A047999):

~~~spl
(11.pascalTriangle % 2)
.catenate
.discretePlot
~~~

![](sw/spl/Help/Image/pascalTriangle-D.svg)

Sierpiński’s triangle,
OEIS [A047999](https://oeis.org/A047999):

~~~spl
(16.pascalTriangle % 2)
.triangularArrayPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-F.svg)

Count of non-unitary divisors of _n_,
OEIS [A048105](https://oeis.org/A048105):

~~~spl
1:100.collect { :n |
	0.divisorSigma(n) - (2 ^ n.primeNu)
}.discretePlot
~~~

![](sw/spl/Help/Image/primeNu-E.svg)

Quadratic residue triangle,
OEIS [A048152](https://oeis.org/A048152):

~~~spl
1:22.triangularArray { :q :p |
	p.square % q
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/mod-I.svg)

Number of odd divisors minus number of even divisors,
OEIS [A048272](https://oeis.org/A048272):

~~~spl
1:115.collect { :n |
	n.divisors.sum { :d |
		(-1 ^ d).negate
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisors-Q.svg)

_k!×S1(n,k)_,
OEIS [A048594](https://oeis.org/A048594):

~~~spl
1:12.triangularArray { :n :k |
	k.! * stirlingS1(n, k)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/stirlingS1-G.svg)

Write _n_ in quaternary and swap digits one and three,
OEIS [A048647](https://oeis.org/A048647):

~~~spl
0:255.collect { :n |
	let d = n.integerDigits(4);
	let e = d.collect { :i |
		(i = 0).if { 0 } { 4 - i }
	};
	e.fromDigits(4)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-F.svg)

Table for binary multiplication without carries,
OEIS [A048720](https://oeis.org/A048720):

~~~spl
let inverse = { :n |
	(1 + (1 + (8 * n)).sqrt / 2).floor
};
let multiply = { :n :m |
	let s = 0;
	{ n > 0 }.whileTrue {
		(1 = (n % 2)).ifTrue {
			s := s.bitXor(m)
		};
		n := (n / 2).floor;
		m := m * 2
	};
	s
};
0:250.collect { :n |
	let i = n.inverse;
	let a = (i - 1) * (i / 2 + 1) - n;
	let b = n - ((i * (i - 1)) / 2);
	multiply(a, b)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-G.svg)

Multiplication table for base two,
read by antidiagonals,
OEIS [A048720](https://oeis.org/A048720):

~~~spl
0:21.antidiagonalArray(
	carryLessMultiplication:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/carryLessMultiplication-A.svg)

Exponentiation table for base two,
read by antidiagonals,
OEIS [A048723](https://oeis.org/A048723):

~~~spl
0L:21.antidiagonalArray(
	carryLessPower:/2
).catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/carryLessMultiplication-B.svg)

_n⊻(n≪1)_,
OEIS [A048724](https://oeis.org/A048724):

~~~spl
0:115.collect { :n |
	n.bitXor(n << 1)
}.discretePlot
~~~

![](sw/spl/Help/Image/bitShiftLeft-B.svg)

Exclusive or of _n_ and _2n_,
reversing binary representation of _-n_,
OEIS [A048724](https://oeis.org/A048724),
also
OESI [A048726](https://oeis.org/A048726) when multiplied by two:

~~~spl
0:127.collect { :n |
	n.bitXor(2 * n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-S.svg)

Exclusive or of _n_ and _4n_,
OEIS [A048725](https://oeis.org/A048725):

~~~spl
0:127.collect { :n |
	n.bitXor(4 * n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-T.svg)

Difference betwen _3n_ and exclusive or of _n_ and _2n_,
OEIS [A048728](https://oeis.org/A048728):

~~~spl
0:127.collect { :n |
	(3 * n) - n.bitXor(2 * n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-V.svg)

_n&⌊(n/2)_,
OEIS [A048735](https://oeis.org/A048735):

~~~spl
0:127.collect { :n |
	n.bitAnd((n / 2).floor)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitAnd-L.svg)

Highest power of two dividing _n_-th Catalan number,
OEIS [A048881](https://oeis.org/A048881):

~~~spl
0L:104.catalanNumber
.integerExponent(2)
.discretePlot
~~~

![](sw/spl/Help/Image/catalanNumber-A.svg)

_3^w(n)_,
OEIS [A048883](https://oeis.org/A048883):

~~~spl
0:250.collect { :n |
	3 ^ n.digitCount(2, 1)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-H.svg)

Working in base two replace _n_ with the concatenation of its prime divisors in increasing order,
OEIS [A048985](https://oeis.org/A048985):

~~~spl
2:200.collect { :n |
	n.primeFactors
	.binaryExpansion
	.catenate
	.binaryContraction
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-I.svg)

The sum of the digits in the decimal expansion of _1/n_ up to the point where it repeats for the first time,
OEIS [A048997](https://oeis.org/A048997):

~~~spl
Fraction(1, 1:75).collect { :n |
	Decimal(n, 200)
	.integerDigits
	.allButLast
	.findTransientRepeat(2)
	.catenate
	.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/findTransientRepeat-B.svg)

`lcm` of all divisors _d_ of _n_ such that _d+1_ is a prime power,
OEIS [A049073](https://oeis.org/A049073):

~~~spl
1:65.collect { :n |
	n.divisors.select { :d |
		(d + 1).primeNu = 1
	}.lcm
}.stepPlot
~~~

![](sw/spl/Help/Image/primeNu-D.svg)

Iterations of φ needed to reach one starting at _n_,
OEIS [A049108](https://oeis.org/A049108):

~~~spl
1:105.collect { :n |
	eulerPhi:/1
	.nestWhileList(n) { :x |
		x != 1
	}.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-I.svg)

First differences of 11-rough numbers,
this sequence has period 48,
OEIS [A049296](https://oeis.org/A049296):

~~~spl
1:450.select { :each |
	each.isRoughNumber(11)
}.differences.scatterPlot
~~~

![](sw/spl/Help/Image/isRoughNumber-A.svg)

Triangle of coefficients of Chebyshev’s _S_-polynomials,
OEIS [A049310](https://oeis.org/A049310):

~~~spl
0:19.collect { :n |
	let p = n.chebyshevU;
	let c = p.coefficientList;
	c / (2 ^ 0:n)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/chebyshevU-D.svg)

Generalized Stirling number triangle of first kind,
OEIS [A049444](https://oeis.org/A049444):

~~~spl
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

Stern’s diatomic array,
discrete plot,
OEIS [A049456](https://oeis.org/A049456):

~~~spl
6.sternsDiatomicArray
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-A.svg)

Stern’s diatomic array,
scatter plot,
OEIS [A049456](https://oeis.org/A049456):

~~~spl
8.sternsDiatomicArray
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-B.svg)

Table _|n-k|_,
read by upwards antidiagonals,
OEIS [A049581](https://oeis.org/A049581):

~~~spl
1:9.antidiagonalArray { :n :k |
	(n - k).abs
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/antidiagonalArray-B.svg)

Count number of restricted knight’s walks,
OEIS [A049581](https://oeis.org/A049581):

~~~spl
let t = { :n :k |
	(n < 2 | { k < 2 }).if {
		1
	} {
		t(n + 1, k - 2) + t(n - 2, k + 1)
	}
};
0:11.triangularArray { :s :n |
	t(n, s - n)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/triangularArray-J.svg)

Π of _σ+1_ of the prime signature,
OEIS [A049599](https://oeis.org/A049599):

~~~spl
1:115.collect { :n |
	n.primeSignature.product { :i |
		0.divisorSigma(i) + 1
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeSignature-F.svg)

Bit-reversal permutations,
OEIS [A049773](https://oeis.org/A049773):

~~~spl
0:7.collect(bitReversalPermutation:/1)
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/bitReversalPermutation-A.svg)

Sum of _n_ modulo _2^k_ for _k_ in `bitLength` of _n_,
OEIS [A049802](https://oeis.org/A049802):

~~~spl
1:100.collect { :n |
	let m = n.bitLength - 1;
	1:m.sum { :k |
		n % (2 ^ k)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitLength-C.svg)

Sum of _n_ `mod` powers of two,
see `bitLength` for a simpler definiton,
OEIS [A049802](https://oeis.org/A049802):

~~~spl
1:200.collect { :n |
	let m = n.log2.floor;
	n * m - 1:m.sum { :k |
		(n * (2 ^ -k)).floor * (2 ^ k)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/log2-B.svg)

A sequence by Clark Kimberling,
OEIS [A050057](https://oeis.org/A050057):

~~~spl
let a = Map { :n |
	(n < 4).if {
		[1 3 1].at(n)
	} {
		let m = n - 2;
		a[n - 1] + a[bitIff(m, m) + 3 - n]
	}
};
a[1:85].log.scatterPlot
~~~

![](sw/spl/Help/Image/bitIff-B.svg)

Fermi-Dirac primes,
numbers of the form _p^(2^k)_ where _p_ is prime and _k≥0_,
OEIS [A050376](https://oeis.org/A050376):

~~~spl
let m = 300;
let t = [];
let k = 1;
let n = nil;
{
	n := m ^ (1 / k);
	n > 2
}.whileTrue {
	t.addAll(2:n.primePi.prime ^ k);
	k := 2 * k
};
t.unique.scatterPlot
~~~

![](sw/spl/Help/Image/unique-B.svg)

Every term of the ruler function repeated,
equal to absolute value of first differences,
OEIS [A050603](https://oeis.org/A050603):

~~~spl
1:85.collect(rulerFunction:/1)
.differences
.abs
.discretePlot
~~~

![](sw/spl/Help/Image/rulerFunction-C.svg)

Smallest positive multiplier _m_ such that _m*n_ is palindromic,
or zero if no such _m_ exists,
OEIS [A050782](https://oeis.org/A050782):

~~~spl
1:80.collect { :n |
	let i = 1;
	(n / 10).isInteger.if {
		0
	} {
		{
			(i * n).isPalindrome
		}.whileFalse {
			i := i + 1
		};
		i
	}
}.log.discretePlot
~~~

![](sw/spl/Help/Image/isPalindrome-D.svg)

Sequence of regular numbers,
OEIS [A051037](https://oeis.org/A051037):

~~~spl
1:999.select { :n |
	n.isSmoothNumber(5)
}.linePlot
~~~

![](sw/spl/Help/Image/isSmoothNumber-A.svg)

The table of _n%k_ read by downward antidiagonals,
OEIS [A051126](https://oeis.org/A051126):

~~~spl
1:11.collect { :n |
	n:1:-1.collect { :k |
		(n - k + 1) % k
	}
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/mod-P.svg)

The number of times _n_ appears in the Conway sequence
OEIS [A004001](https://oeis.org/A004001),
OEIS [A051135](https://oeis.org/A051135):

~~~spl
let n = 55;
let m = (n + 2) * 2;
let a = 'A004001'.oeisTerms(m);
let b = List(a.max, 0);
a.do { :i |
	b[i] := b[i] + 1
};
b.first(n).discretePlot
~~~

![](sw/spl/Help/Image/oeisTerms-A.svg)

Triangle read by rows where _q=-1_,
OEIS [A051159](https://oeis.org/A051159):

~~~spl
0:12.triangularArray { :n :k |
	qBinomial(n, k, -1)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/qBinomial-B.svg)

Smallest number _m_ such that _2*m-p_ is composite for the first _n_ primes,
OEIS [A051169](https://oeis.org/A051169):

~~~spl
let k = 30;
let p = 1:k.prime;
1:k.collect { :n |
	1:50000.detect { :x |
		p.take(n).allSatisfy { :y |
			(2 * x - y).isComposite
		}
	}
}.log.stepPlot
~~~

![](sw/spl/Help/Image/isComposite-B.svg)

The two-adic valuation of the Hardy-Ramanujan integers,
OEIS [A051282](https://oeis.org/A051282):

~~~spl
let m = 4000;
let a = [1];
let l = [];
2.toDo(m) { :n |
	let e = n.factorInteger.column(2).sort;
	l.includes(e).ifFalse {
		l.add(e);
		a.add(n)
	}
};
(2 .. a.size).collect { :n |
	a[n].factorInteger[1][2]
}.discretePlot
~~~

![](sw/spl/Help/Image/factorInteger-H.svg)

The two-adic valuation of the Hardy-Ramanujan integers,
further terms,
OEIS [A051282](https://oeis.org/A051282):

~~~spl
OeisEntry('A051282').then { :e |
	e.bFileData
	.first(300)
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/factorInteger-I.svg)

An accumulation array,
OEIS [A051340](https://oeis.org/A051340):

~~~spl
1:15.collect { :n |
	[n].padLeft([n], 1)
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/padLeft-A.svg)

Quotients of consecutive values of `lcm`,
OEIS [A051417](https://oeis.org/A051417):

~~~spl
1:60.collect { :n |
	(2 * n + 1).cyclotomic.at(1)
}.discretePlot
~~~

![](sw/spl/Help/Image/cyclotomic-E.svg)

Smallest _k_ such that _σ(k)=n_, or zero if there is no such _k_,
OEIS [A051444](https://oeis.org/A051444):

~~~spl
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

Period of the decimal representation of _1/n_,
log scale plot
OEIS [A051626](https://oeis.org/A051626):

~~~spl
Fraction(1, 1:200)
.collect(decimalPeriod:/1)
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalPeriod-A.svg)

Variant of Pascal’s triangle,
OEIS [A051632](https://oeis.org/A051632):

~~~spl
0:13.triangularArray { :n :k |
	let a = (2 * k + 1 - n) / (k + 1);
	let b = 1 - n + (2 * (-k + n));
	let c = (b / (1 - k + n));
	let d = a * binomial(n, k);
	let e = c * binomial(n, -k + n);
	0 - d + e
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-H.svg)

Row sums of Pascal’s triangle modulo three,
OEIS [A051638](https://oeis.org/A051638):

~~~spl
(85.pascalTriangle % 3)
.collect(sum:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-H.svg)

Square-pyramid-tree numbers,
OEIS [A051678](https://oeis.org/A051678):

~~~spl
1:9.triangularArray { :n :m |
	let a = (n ^ 2) * (n ^ 2 - 1) / 12;
	let b = m * (m + 1) * (2 * m + 1) / 6;
	a + b
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-F.svg)

Greatest common divisor of _n!_ and _n^n_,
OEIS [A051696](http://oeis.org/A051696):

~~~spl
(1L .. 200L).collect { :n |
	gcd(n.!, n ^ n)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/gcd-I.svg)

Distance from _n_ to closest prime,
OEIS [A051699](http://oeis.org/A051699):

~~~spl
0:150.collect(primeDistance:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/primeDistance-A.svg)

`numerator` of `differences` of _n/((n+1)(n+2))_,
OEIS [A051712](https://oeis.org/A051712):

~~~spl
1:125.collect { :n |
	n \ ((n + 1) * (n + 2))
}.differences
.negate
.numerator
.scatterPlot
~~~

![](sw/spl/Help/Image/differences-C.svg)

Numerators,
read by antidiagonals,
OEIS [A051714](https://oeis.org/A051714):

~~~spl
0:21.antidiagonalArray(
	akiyamaTanigawaNumber:/2
).numerator
.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/akiyamaTanigawaNumber-A.svg)

Denominators,
read by antidiagonals,
OEIS [A051715](https://oeis.org/A051715):

~~~spl
0:21.antidiagonalArray(
	akiyamaTanigawaNumber:/2
).denominator
.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/akiyamaTanigawaNumber-B.svg)

Numerator of _n/12_,
OEIS [A051724](https://oeis.org/A051724):

~~~spl
Fraction(0:36, 12).numerator.stepPlot
~~~

![](sw/spl/Help/Image/numerator-A.svg)

One if _k_ divides _n_ else zero,
OEIS [A051731](https://oeis.org/A051731):

~~~spl
1:17.triangularArray { :n :k |
	n.divisible(k).boole
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/divisible-J.svg)

Number of torus knots with _n_ crossings,
OEIS [A051764](https://oeis.org/A051764):

~~~spl
1:75.collect { :n |
	let t = n.integerSquareRoot;
	n.divisors.count { :k |
		k > t & {
			k.gcd(n / k + 1) = 1
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisors-H.svg)

Nim multiplication table,
read by antidiagonals,
from `zero`,
OEIS [A051775](https://oeis.org/A051775):

~~~spl
0:17.antidiagonalArray(
	nimMultiplication:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-A.svg)

Nim multiplication table,
read by antidiagonals,
from `one`,
OEIS [A051776](https://oeis.org/A051776):

~~~spl
1:16.antidiagonalArray(
	nimMultiplication:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-B.svg)

Triangle of descending moduli,
OEIS [A051778](https://oeis.org/A051778):

~~~spl
3:23.collect { :n |
	let m = n - 1;
	m:2:-1.collect { :i |
		n % i
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/mod-R.svg)

Eighth-order linear recurrence for fourth-order alternating sum,
OEIS [A051793](https://oeis.org/A051793):

~~~spl
[0 -1 0 -1 0 1 0 1].linearRecurrence(
	[1 1 1 1 0 1 1 1],
	115
).logScale.discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-D.svg)

Twelfth-order linear recurrence for sixth-order alternating sum,
OEIS [A051794](https://oeis.org/A051794):

~~~spl
linearRecurrence(
	[0 -1 0 -1 0 -1 0 1 0 1 0 1],
	[1 1 1 1 1 1 0 1 1 1 1 1],
	100
).logScale.discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-C.svg)

Nim multiplication table,
lower left triangle,
read by rows,
from `zero`
OEIS [A051910](https://oeis.org/A051910):

~~~spl
0:15.triangularArray(
	nimMultiplication:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-C.svg)

Nim multiplication table,
lower left triangle,
read by rows,
from `one`
OEIS [A051911](https://oeis.org/A051911):

~~~spl
1:15.triangularArray(
	nimMultiplication:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-D.svg)

Inverse of _n_ under Nim multiplication,
_n⊗m=1_,
OEIS [A051917](https://oeis.org/A051917):

~~~spl
1:255.collect { :n |
	1:255.detect { :m |
		n.nimMultiplication(m) = 1
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-P.svg)

Nim-sum table,
lower left triangle,
read by rows,
OEIS [A051933](https://oeis.org/A051933):

~~~spl
0:19.triangularArray(bitXor:/2)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-P.svg)

Cototient function,
OEIS [A051953](https://oeis.org/A051953):

~~~spl
1:200.collect { :n |
	n - n.eulerPhi
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-J.svg)

Numbers that cubed have only even digits,
OEIS [A052004](https://oeis.org/A052004):

~~~spl
0:5000.select { :n |
	(n ^ 3).integerDigits
	.allSatisfy(isEven:/1)
}.stepPlot
~~~

![](sw/spl/Help/Image/integerDigits-M.svg)

Sum of digits in ascending and descending sequence,
OEIS [A052008](https://oeis.org/A052008):

~~~spl
0:200.collect { :n |
	let d = n.integerDigits.sort;
	d.fromDigits + d.reverse.fromDigits
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-B.svg)

Greatest prime divisor of all composite numbers between _P(n)_ and the next prime,
OEIS [A052248](https://oeis.org/A052248):

~~~spl
2:150.collect { :n |
	let a = n.prime + 1;
	let b = (n + 1).prime - 1;
	(a .. b).collect(
		greatestPrimeFactor:/1
	).max
}.scatterPlot
~~~

![](sw/spl/Help/Image/greatestPrimeFactor-D.svg)

The difference between the next prime of _n²_ and _n²_,
OEIS [A053000](https://oeis.org/A053000):

~~~spl
0:200.collect { :n |
	let m = n.square;
	m.nextPrime - m
}.scatterPlot
~~~

![](sw/spl/Help/Image/nextPrime-D.svg)

Log scale plot of succesive coefficients,
including zeroes,
OEIS [A053120](https://oeis.org/A053120):

~~~spl
0:13.collect { :n |
	n.chebyshevT
	.coefficientList
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/chebyshevT-E.svg)

Pascal’s triangle,
excluding first and last two elements of each row,
read by rows,
row _n_ read mod _n_,
OEIS [A053202](https://oeis.org/A053202):

~~~spl
4:23.collect { :n |
	let m = n - 2;
	2:m.collect { :k |
		binomial(n, k) % n
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/binomial-D.svg)

First differences of _σ₁(n)_,
OEIS [A053222](https://oeis.org/A053222):

~~~spl
1.divisorSigma(1:85)
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-Y.svg)

Differences between numbers _k_ for which _σ(k)<σ(k+1)_,
OEIS [A053230](https://oeis.org/A053230):

~~~spl
1:400.select { :n |
	1.divisorSigma(n)
	<
	1.divisorSigma(n + 1)
}.differences.stepPlot
~~~

![](sw/spl/Help/Image/differences-D.svg)

First differences between numbers _k_ for which _σ(k)>σ(k+1)_,
OEIS [A053238](https://oeis.org/A053238):

~~~spl
1:350.select { :n |
	1.divisorSigma(n)
	>
	1.divisorSigma(n + 1)
}.differences.stepPlot
~~~

![](sw/spl/Help/Image/divisorSigma-G.svg)

First differences of aliquot sums,
OEIS [A053246](https://oeis.org/A053246):

~~~spl
2:115.aliquotSum.differences
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-D.svg)

Second differences of aliquot sums,
OEIS [A053246](https://oeis.org/A053246):

~~~spl
1:115.aliquotSum.differences(2)
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-E.svg)

Minimal number of coins needed to pay _n_ cents using coins of 1, 5, 10 and 25 cents,
OEIS [A053344](https://oeis.org/A053344):

~~~spl
1:150.collect { :n |
	[1 5 10 25].frobeniusSolve(n)
	.collect(sum:/1)
	.min
}.scatterPlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-E.svg)

Maximal number of linearly independent smooth nowhere-zero vector fields on a _2n+1_-sphere,
OEIS [A053381](https://oeis.org/A053381):

~~~spl
1:102.collect { :n |
	let n0 = 2 * n;
	let b = 1:Infinity.detect { :unused |
		n0 := n0 / 2;
		n0.bitAnd(1) != 0
	};
	let c = b.bitAnd(3);
	let d = (b - c) / 4;
	let rho = (2 ^ c) + (8 * d);
	rho - 1
}.discretePlot
~~~

![](sw/spl/Help/Image/bitAnd-H.svg)

Nim-values from game of Kopper’s Nim,
OEIS [A053398](https://oeis.org/A053398):

~~~spl
19.antidiagonalArray { :x :y |
	let z = (x - 1).bitOr(y - 1);
	(z + 1).integerExponent(2)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitOr-G.svg)

Smallest prime not dividing _n_,
OEIS [A053669](https://oeis.org/A053669):

~~~spl
1:65.collect { :n |
	1:Infinity.detect { :k |
		n.gcd(k.prime) = 1
	}.prime
}.discretePlot
~~~

![](sw/spl/Help/Image/Infinity-A.svg)

Least number coprime to _n_ and _n+1_,
OEIS [A053670](https://oeis.org/A053670):

~~~spl
1:65.collect { :n |
	2:Infinity.detect { :k |
		k.isCoprime(n) & {
			k.isCoprime(n + 1)
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/Infinity-B.svg)

Least number coprime to _n_, _n+1_ and _n+2_,
OEIS [A053671](https://oeis.org/A053671):

~~~spl
1:65.collect { :n |
	5:Infinity.detect { :k |
		[0 1 2].allSatisfy { :i |
			k.isCoprime(n + i)
		}
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/Infinity-C.svg)

Least number coprime to _n+0:3_,
OEIS [A053672](https://oeis.org/A053672):

~~~spl
1:65.collect { :n |
	5:Infinity.detect { :i |
		(n + 0:3).allSatisfy { :j |
			j.isCoprime(i)
		}
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/isCoprime-C.svg)

Dirichlet inverse of the _σ(3)_ function,
OEIS [A053825](https://oeis.org/A053825):

~~~spl
1:115.collect(
	{ :n |
		3.divisorSigma(n)
	}.dirichletInverse
).logScale.discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-F.svg)

The sum of the digits of _n_,
where _b=8_,
OEIS [A053829](http://oeis.org/A053829):

~~~spl
1:250.collect { :n |
	n.digitSum(8)
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitSum-C.svg)

Count number of partitions combining with _inclusive or_,
OEIS [A054244](https://oeis.org/A054244):

~~~spl
let f = { :n |
	0:n.sum { :k |
		let a = binomial(n, k);
		let b = 2 ^ (2 ^ (n - k));
		(-1 ^ k) * a * b
	} / 2
};
1:200.collect { :n |
	f(n.digitCount(2, 1))
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/sum-C.svg)

First differences of Kolakoski sequence,
OEIS [A054354](https://oeis.org/A054354):

~~~spl
115.kolakoskiSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-H.svg)

A sequence by Tidjani Negadi,
OEIS [A054398](https://oeis.org/A054398):

~~~spl
let a = Map { :n |
	(n =0).if {
		[1]
	} {
		let p = a[n - 1];
		let m = (2 * n) + 1;
		let q = (2 ^ m + 1) / 3;
		p ++ [q] ++ p
	}
};
a[0:5].catenate.log.discretePlot
~~~

![](sw/spl/Help/Image/power-H.svg)

Simple self-inverse permutation of natural numbers,
OEIS [A054429](https://oeis.org/A054429):

~~~spl
1:63.collect { :n |
	3 * (2 ^ (n.bitLength - 1)) - n - 1
}.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-F.svg)

_μ(n/k)_ if _k_ divides _n_ else zero,
OEIS [A054525](https://oeis.org/A054525):

~~~spl
1:17.triangularArray { :n :k |
	n.divisible(k).if {
		(n / k).moebiusMu
	} {
		0
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-L.svg)

Sum of the _n_-th powers of the _k_-th primitive roots of unity,
OEIS [A054532](https://oeis.org/A054532):

~~~spl
1:15.triangularArray(
	ramanujansSum:/2
).catenate.discretePlot
~~~

![](sw/spl/Help/Image/ramanujansSum-A.svg)

Triangular array giving Ramanujan’s sum,
OEIS [A054533](https://oeis.org/A054533):

~~~spl
1:15.triangularArray(
	ramanujansSum:/2.swap
).catenate.discretePlot
~~~

![](sw/spl/Help/Image/ramanujansSum-B.svg)

Ramanujan’s sum read by falling antidiagonals,
OEIS [A054534](https://oeis.org/A054534):

~~~spl
15.antidiagonalArray(
	ramanujansSum:/2
).catenate.discretePlot
~~~

![](sw/spl/Help/Image/ramanujansSum-C.svg)

Ramanujan’s sum read by rising antidiagonals,
OEIS [A054535](https://oeis.org/A054535):

~~~spl
15.antidiagonalArray(
	ramanujansSum:/2
).collect(reverse:/1).catenate.discretePlot
~~~

![](sw/spl/Help/Image/ramanujansSum-D.svg)

The _b=8_ Champernowne sequence,
OEIS [A054634](https://oeis.org/A054634):

~~~spl
8.champernowneSequence(128)
.scatterPlot
~~~

![](sw/spl/Help/Image/champernowneSequence-D.svg)

The _b=3_ Champernowne sequence,
OEIS [A054635](https://oeis.org/A054635):

~~~spl
3.champernowneSequence(65)
.stepPlot
~~~

![](sw/spl/Help/Image/champernowneSequence-C.svg)

Earliest sequence with _a(a(n))=6n_,
OEIS [A054786](https://oeis.org/A054786):

~~~spl
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

The Josephus problem at _k=3_,
OEIS [A054995](https://oeis.org/A054995):

~~~spl
1:85.collect { :n |
	n.josephusProblem(3)
}.discretePlot
~~~

![](sw/spl/Help/Image/josephusProblem-B.svg)

A version of Josephus problem,
OEIS [A054995](https://oeis.org/A054995):

~~~spl
1:115.collect { :n |
	{ :x |
		x.rotateLeft(2).allButFirst
	}.iterate([1 .. n], n - 1)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/rotateLeft-B.svg)

Alternating sum of reverse of decimal expansion of _n_,
OEIS [A055017](https://oeis.org/A055017):

~~~spl
0:300.collect { :n |
	n.integerDigits
	.reverse
	.alternatingSum
}.scatterPlot
~~~

![](sw/spl/Help/Image/alternatingSum-A.svg)

_n_ repeating _1+⌊(n/2)_ times,
OEIS [A055086](https://oeis.org/A055086):

~~~spl
0:20.collect { :n |
	let k = (n / 2).floor + 1;
	k # [n]
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/floor-E.svg)

_a(n)_ is the smallest positive integer not already in the sequence such that _a(n)+a(n-1)_ is prime,
OEIS [A055265](https://oeis.org/A055265):

~~~spl
let m = 130;
let a = [1];
m.timesRepeat {
	let i = a.last;
	let j = 0;
	{
		j := j + 1
	}.doWhileFalse {
		(i + j).isPrime & {
			a.includes(j).not
		}
	};
	a.add(j)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/isPrime-D.svg)

_π(L(n))_,
OEIS [A055396](https://oeis.org/A055396):

~~~spl
1:85.leastPrimeFactor
.primePi
.discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-C.svg)

The `gcd` of _n_ and the reverse of _n_,
log scatter plot,
OEIS [A055483](https://oeis.org/A055483):

~~~spl
1:120.collect { :n |
	gcd(n, n.integerReverse)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-B.svg)

_μ(n)×n_,
OEIS [A055615](https://oeis.org/A055615):

~~~spl
let n = 1:85;
(n.moebiusMu * n).discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-M.svg)

Count number of zero digits in _n_,
OEIS [A055641](https://oeis.org/A055641):

~~~spl
0:150.digitCount(10, 0).discretePlot
~~~

![](sw/spl/Help/Image/digitCount-Q.svg)

Number of ones in the base-φ representation of _n_,
OEIS [A055778](https://oeis.org/A055778):

~~~spl
let phi = 1.goldenRatio;
2:104.collect { :n |
	let e = n.betaExpansion(phi, 32);
	e[1].sum
}.stepPlot
~~~

![](sw/spl/Help/Image/betaExpansion-B.svg)

First differences of Gray encoding,
log scale scatter plot,
OEIS [A055975](https://oeis.org/A055975):

~~~spl
0:250.grayEncode
.differences
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-F.svg)

Step plot of sequence by K.A. Rasmussen,
OEIS [A056239](https://oeis.org/A056239):

~~~spl
1:111.collect { :n |
	n.primeFactors.primePi.sum
}.stepPlot
~~~

![](sw/spl/Help/Image/primePi-C.svg)

Absolute first differences of alternating sum of reverse of binary expansion of _n_,
OEIS [A056832](https://oeis.org/A056832):

~~~spl
0:65.collect { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum
}.differences.abs.stepPlot
~~~

![](sw/spl/Help/Image/alternatingSum-F.svg)

The reverse and add sequence,
OEIS [A056964](https://oeis.org/A056964):

~~~spl
0:100.collect { :n |
	n + n.integerReverse
}.stepPlot
~~~

![](sw/spl/Help/Image/integerReverse-H.svg)

Number of occurrences of _00_ in the binary expansion of _n_,
OEIS [A056973](http://oeis.org/A056973):

~~~spl
0:65.collect { :n |
	n.binaryExpansion
	.sequenceCount([0 0])
}.discretePlot
~~~

![](sw/spl/Help/Image/sequenceCount-A.svg)

Scaled Chebyshev U-polynomials evaluated at _√3/2_,
OEIS [A057083](https://oeis.org/A057083):

~~~spl
[3L -3].linearRecurrence([1 3], 66)
.logScale.discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-I.svg)

Length of the continued fraction for _⌊(F(n)*φ)/F(n)_,
where _F_ is the Fibonacci function,
OEIS [A057083](https://oeis.org/A057083):

~~~spl
[0 1 0 1 0 -1].linearRecurrence(
	[1 1 2 2 4 2 6 4], 65
).discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-J.svg)

Square array of polygonal numbers read by antidiagonals upwards,
OEIS [A057145](https://oeis.org/A057145):

~~~spl
2:13.collect { :n |
	let m = n - 1;
	1:m.collect { :k |
		k * (3 - (k * k) - n + (k * n)) / 2
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/collect-A.svg)

A self-inverse permutation of natural numbers,
_A080300_ of _A036044_ of _A014486_ of _n_,
OEIS [A057164](https://oeis.org/A057164):

~~~spl
0:197.collect(
	[
		'A014486'
		'A036044'
		'A080300'
	].oeisFunction.composeRight
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-E.svg)

Next larger integer with same binary weight as _n_,
OEIS [A057168](https://oeis.org/A057168):

~~~spl
1:71.collect { :n |
	let u = bitAnd(n, -n);
	let v = u + n;
	v.bitXor(n) // u // 4 + v
}.stepPlot
~~~

![](sw/spl/Help/Image/bitAnd-J.svg)

_W(G(C(n)))/2_,
OEIS [A057514](https://oeis.org/A057514):

~~~spl
0:200.collect { :n |
	n.catalanUnrank
	.grayEncode
	.digitCount(2, 1) / 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/catalanUnrank-B.svg)

Number of terms before entering cycle in trajectory of _p(n)_,
the indirect Collatz sequence,
OEIS [A057691](https://oeis.org/A057691):

~~~spl
2:76.prime.collect { :p |
	let [x, y] = p.collatzSequence(
		p,
		'Indirect'
	);
	x.indexOf(y) - 1
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-H.svg)

Bijective bit-reverse of _n_,
OEIS [A057889](https://oeis.org/A057889):

~~~spl
0:200.collect { :n |
	let m = n.integerReverse(2);
	m * (2 ^ n.integerExponent(2))
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-F.svg)

Number of prime factors of the number of divisors of _n_,
OEIS [A058061](https://oeis.org/A058061):

~~~spl
1:85.collect { :n |
	0.divisorSigma(n).primeOmega
}.discretePlot
~~~

![](sw/spl/Help/Image/primeOmega-G.svg)

Where _σ(m)_ rises by at least _n_,
OEIS [A058197](https://oeis.org/A058197):

~~~spl
let sigma = 0.divisorSigma(1:5100);
let d = sigma.differences;
1:30.collect { :n |
	d.detectIndex { :x |
		x >= n
	}
}.log.stepPlot
~~~

![](sw/spl/Help/Image/divisorSigma-L.svg)

_n⊗(n+1)_,
OEIS [A058734](https://oeis.org/A058734):

~~~spl
0:254.collect { :n |
	n.nimMultiplication(n + 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-O.svg)

Anti-divisor sums of _n_,
OEIS [A058838](https://oeis.org/A058838):

~~~spl
let a = 1:50.antiDivisors;
(a.collect(sum:/1) + 1).stepPlot
~~~

![](sw/spl/Help/Image/antiDivisors-C.svg)

Renyi’s beta expansion of 1 in base 3/2,
OEIS [A058840](https://oeis.org/A058840):

~~~spl
let r = 3/2;
let x = 1;
let y = 2:104.collect { :n |
	let rx = r * x;
	x := (rx > 1).if { rx - 1 } { rx };
	(r * x).floor
};
([1 1] ++ y).discretePlot
~~~

![](sw/spl/Help/Image/floor-D.svg)

Run lengths of zeroes in _β(2,3/2)_,
equal but for the initial places to
OEIS [A058841](https://oeis.org/A058841):

~~~spl
betaExpansion(2, 3/2, 430)
.first
.runLengthsOf(0)
.discretePlot
~~~

![](sw/spl/Help/Image/betaExpansion-A.svg)

The number of positive integers less than or equal to _n_,
with the same number of prime factors as _n_,
counted with multiplicity,
OEIS [A058933](https://oeis.org/A058933):

~~~spl
let m = Map();
let f = { :x |
	let y = m.atIfAbsent(x) { 0 };
	m.atPut(x, y + 1)
};
1:200.collect { :n |
	f(n.primeOmega)
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeOmega-B.svg)

Total number of zeroes in binary expansions,
a form of the Takagi curve,
OEIS [A059015](https://oeis.org/A059015):

~~~spl
0:63.digitCount(2, 0)
.accumulate
.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-F.svg)

Representation of _n_ in base three using digits _-1,0,1_,
OEIS [A059095](https://oeis.org/A059095):

~~~spl
let f = { :n |
	let ct = [0 0; 0 1; 1 -1];
	(n = 0).if {
		[]
	} {
		let [c, t] = ct[n % 3 + 1];
		f(n // 3 + c) ++ [t]
	}
};
1:30.collect(f:/1)
.catenate
.discretePlot
~~~

![](sw/spl/Help/Image/quotient-D.svg)

Numbers _m_ for which the number of divisors, _τ(m)_, is divisible by three,
OEIS [A059269](https://oeis.org/A059269):

~~~spl
1:230.select { :n |
	0.divisorSigma(n).divisible(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/select-A.svg)

Jordan function _k=3_,
OEIS [A059376](https://oeis.org/A059376):

~~~spl
3.jordanTotient(1:100).scatterPlot
~~~

![](sw/spl/Help/Image/jordanTotient-B.svg)

Array of values of Jordan function _Jₖ(n)_ read by antidiagonals,
OEIS [A059379](https://oeis.org/A059379):

~~~spl
1:13.antidiagonalArray(
	jordanTotient:/2
).catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/jordanTotient-C.svg)

The first few items of `bFileData` for a sequence that is non-trivial to calculate,
OEIS [A059471](https://oeis.org/A059471):

~~~spl
OeisEntry('A059471').then { :e |
	e.bFileData
	.first(125)
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/OeisEntry-C.svg)

Mertens conjectured that _|M(n)|<√(n)_,
now known to be false,
OEIS [A059571](https://oeis.org/A059571):

~~~spl
1:85.collect { :n |
	n.sqrt.floor - 1:n.moebiusMu.sum.abs
}.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-K.svg)

Fixed point of dividing the digits according to parity and multiplying the parts,
OEIS [A059707](https://oeis.org/A059707):

~~~spl
0:250.collect { :i |
	{ :n |
		let d = n.integerDigits;
		let e = d.select(isEven:/1);
		let o = d.select(isOdd:/1);
		(o.size.min(e.size) > 0).if {
			o.fromDigits * e.fromDigits
		} {
			n
		}
	}.fixedPoint(i)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/isEven-C.svg)

Fixed point of dividing the digits according to parity and adding the parts,
OEIS [A059717](https://oeis.org/A059717):

~~~spl
0:250.collect { :i |
	{ :n |
		let d = n.integerDigits;
		let e = d.select(isEven:/1);
		let o = d.select(isOdd:/1);
		(o.size.min(e.size) > 0).if {
			o.fromDigits + e.fromDigits
		} {
			n
		}
	}.fixedPoint(i)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/isOdd-B.svg)

The second in a series of arrays counting standard tableaux by partition type,
OEIS [A059797](https://oeis.org/A059797):

~~~spl
let t = { :n :k |
	(n < 0 | { k < 0 | { k > n } }).if {
		0
	} {
		t(n - 1, k - 1)
		+
		t(n - 1, k)
		+
		binomial(n + 2, k + 1)
	}
};
0:13.triangularArray(t:/2)
.catenate
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-E.svg)

A ternary tribonacci triangle,
OEIS [A059832](https://oeis.org/A059832):

~~~spl
[1 -> [2], 2 -> [3], 3 -> [1 2 3]]
.substitutionSystem([1], 7)
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-I.svg)

Self-inverse permutation given by reversing the order of all but the most significant bit in binary expansion of _n_,
OEIS [A059893](https://oeis.org/A059893):

~~~spl
1:64.collect { :n |
	let d = n.integerDigits(2);
	let x = d.first;
	let y = d.allButFirst;
	([x] ++ y.reverse).fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/reverse-A.svg)

Expected time until the _n_-th possible sequence of coin tosses,
OEIS [A059943](https://oeis.org/A059943):

~~~spl
1:126.collect { :n |
	let a = (n + 1).integerDigits(2);
	let b = a.drop(1) + 1;
	let c = [];
	1.toDo(b.size) { :k |
		let d = b.first(k) = b.last(k);
		c.addFirst(d.boole)
	};
	2 * c.fromDigits(2)
}.stepPlot
~~~

![](sw/spl/Help/Image/integerDigits-O.svg)

_n^n_ using Nim multiplication,
OEIS [A059971](https://oeis.org/A059971):

~~~spl
0:87.collect { :n |
	n.nimPower(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/nimMultiplication-X.svg)

The initial part of the triangle _Q(n,k)_,
OEIS [A060016](https://oeis.org/A060016):

~~~spl
1:11.triangularArray(
	partitionFunctionQ:/2
).++.discretePlot
~~~

![](sw/spl/Help/Image/partitionFunctionQ-C.svg)

Number of partitions of _n_ into _k_ distinct parts,
OEIS [A060016](https://oeis.org/A060016):

~~~spl
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

Triangle _(n,k)_ indicating if the _k_-th prime is a square modulo the _n_-th prime,
OEIS [A060038](https://oeis.org/A060038):

~~~spl
2:17.collect { :n |
	let m = n - 1;
	let p = n.prime;
	let r = p.quadraticResidues;
	1:m.collect { :k |
		r.includes(k.prime).not.boole
	}
}.triangularArrayPlot
~~~

![](sw/spl/Help/Image/prime-F.svg)

Ordered set with zero and where if _x_ is in then both _2x+1_ and _4x_ are also in,
OEIS [A060142](https://oeis.org/A060142):

~~~spl
let a:/1 = { :n |
	(n < 3).if {
		(n < 2)
	} {
		n.isOdd.if {
			a(n // 2)
		} {
			n % 4 = 0 & {
				a(n / 4)
			}
		}
	}
}.memoize(true);
0:300.select(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isOdd-C.svg)

Table of dimensions of integer partitions in ascending order,
OEIS [A060240](https://oeis.org/A060240):

~~~spl
1:8.collect { :n |
	n.integerPartitions
	.collect(hookLengthFormula:/1)
	.sort
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/hookLengthFormula-B.svg)

Table of dimensions of integer partitions in ascending order,
OEIS [A060240](https://oeis.org/A060240):

~~~spl
1:11.collect { :n |
	n.integerPartitionsDimensions
	.sort
}.catenate.log.stepPlot
~~~

![](sw/spl/Help/Image/integerPartitionsDimensions-B.svg)

Square roots of unity modulo _m_,
OEIS [A060594](https://oeis.org/A060594):

~~~spl
1:103.collect { :n |
	1:n.sum { :i |
		((i.square - 1) % n = 0).boole
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/square-B.svg)

_2^w(⌊(n/2))_,
OEIS [A060632](https://oeis.org/A060632):

~~~spl
let n = 0:85;
let a = 2 ^ (n / 2).floor.digitCount(2, 1);
a.discretePlot
~~~

![](sw/spl/Help/Image/digitCount-P.svg)

Largest difference between consecutive divisors of _n_,
OEIS [A060681](https://oeis.org/A060681):

~~~spl
1:200.collect { :n |
	n - (n / n.leastPrimeFactor)
}.scatterPlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-G.svg)

Number of non-Abelian groups of order _n_,
log scale plot,
OEIS [A060689](https://oeis.org/A060689):

~~~spl
let n = 200;
let a = 1:n.finiteGroupCount;
let b = 1:n.finiteAbelianGroupCount;
(a - b).log.scatterPlot
~~~

![](sw/spl/Help/Image/finiteAbelianGroupCount-C.svg)

Triangle in which _n_-th row lists all primitive roots modulo the _n_-th prime,
OEIS [A060749](https://oeis.org/A060749):

~~~spl
1:23.collect { :n |
	n.prime.primitiveRootList
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/primitiveRootList-F.svg)

_2^(n-w(n))_,
OEIS [A060818](https://oeis.org/A060818):

~~~spl
0:50.collect { :n |
	2 ^ (n - n.hammingWeight)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-N.svg)

List in which _n_ appears _τ(n)_ times,
OEIS [A061017](https://oeis.org/A061017):

~~~spl
1:17.collect { :n |
	List(0.divisorSigma(n), n)
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/divisorSigma-X.svg)

Wavelengths in hydrogen spectrum are given by Rydberg’s formula,
OEIS [A061036](https://oeis.org/A061036):

~~~spl
1L:16.collect { :n |
	let a = 1 / (n ^ 2);
	n:1:-1.collect { :m |
		let b = 1 / (m ^ 2);
		(b - a).denominator
	}
}.++.scatterPlot
~~~

![](sw/spl/Help/Image/denominator-A.svg)

Numerator of _1/4-1/n^2_,
OEIS [A061037](https://oeis.org/A061037):

~~~spl
2L:85.collect { :n |
	1/4 - (1 / (n ^ 2))
}.numerator.discretePlot
~~~

![](sw/spl/Help/Image/numerator-D.svg)

Numerator of _1/4-1/n^2_,
from Balmer spectrum of hydrogen,
OEIS [A061037](https://oeis.org/A061037):

~~~spl
(1/4 - (2:125 ^ 2/1)./)
.numerator
.scatterPlot
~~~

![](sw/spl/Help/Image/solidus-A.svg)

Denominator of _1/4-1/n^2_,
OEIS [A061038](https://oeis.org/A061038):

~~~spl
2L:85.collect { :n |
	1/4 - (1 / (n ^ 2))
}.denominator.discretePlot
~~~

![](sw/spl/Help/Image/denominator-B.svg)

Numerator of _1/16-1/n^2_,
from Brackett spectrum of hydrogen,
OEIS [A061041](https://oeis.org/A061041):

~~~spl
(Fraction(1, 16) - Fraction(1, 4:90 ^ 2))
.numerator
.discretePlot
~~~

![](sw/spl/Help/Image/numerator-C.svg)

The inverse binomial transform of the Lucas numbers,
OEIS [A061084](https://oeis.org/A061084):

~~~spl
65.lucasSequence
.inverseBinomialTransform
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/inverseBinomialTransform-D.svg)

`primePi` of `greatestPrimeFactor`,
OEIS [A061395](https://oeis.org/A061395):

~~~spl
2:76.collect { :n |
	n.greatestPrimeFactor.primePi
}.stepPlot
~~~

![](sw/spl/Help/Image/greatestPrimeFactor-B.svg)

Characteristic function of primes multiplied by _n_,
OEIS [A061397](https://oeis.org/A061397):

~~~spl
1:99.collect { :n |
	n * n.isPrime.boole
}.discretePlot
~~~

![](sw/spl/Help/Image/isPrime-H.svg)

Least _m_ such that the alternating sum of _m_ is _n_,
OEIS [A061479](https://oeis.org/A061479):

~~~spl
0:22.collect { :n |
	0:Infinity.detect { :m |
		let d = m.integerDigits;
		d.alternatingSum = n
	}
}.log.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-C.svg)

Sequence of _p_ where _a(n)_ is the smallest prime _q_ so that _n=(p+1)/(q+1)_ with _p_ prime,
OEIS [A062251](https://oeis.org/A062251):

~~~spl
1:137.collect { :n |
	let q = 2;
	let r = nil;
	{
		r := n * (q + 1) - 1;
		r.isPrime
	}.whileFalse {
		q := q.nextPrime
	};
	r
}.scatterPlot
~~~

![](sw/spl/Help/Image/nextPrime-C.svg)

Denominators of _k=1_ Sobol sequence,
discrete plot,
[A062383](https://oeis.org/A062383):

~~~spl
63.sobolSequence(1).denominator.discretePlot
~~~

![](sw/spl/Help/Image/sobolSequence-F.svg)

Denominators of _k=1_ Sobol sequence,
step plot,
[A062383](https://oeis.org/A062383):

~~~spl
255.sobolSequence(1).denominator.stepPlot
~~~

![](sw/spl/Help/Image/sobolSequence-H.svg)

Nodes in rooted index-functional forest for _n_,
OEIS [A062537](https://oeis.org/A062537):

~~~spl
let k = 75;
let a = List(k, 0);
2.toDo(k) { :n |
	a[n] := n.factorInteger.sum { :f |
		a[f[1].primePi] + a[f[2]] + 1
	}
};
a.stepPlot
~~~

![](sw/spl/Help/Image/primePi-K.svg)

_n_ divided by the largest power of the squarefree kernel of _n_ which divides it,
OEIS [A062760](https://oeis.org/A062760):

~~~spl
2:200.collect { :n |
	let p = n.divisors;
	let q = p.select(isSquareFree:/1).last;
	n / (q ^n.integerExponent(q))
}.log.discretePlot
~~~

![](sw/spl/Help/Image/radical-K.svg)

Moebius transform of the cototient function,
OEIS [A062790](https://oeis.org/A062790):

~~~spl
1:115.collect(
	dirichletConvolve(
		{ :n | n.moebiusMu },
		{ :n | n - n.eulerPhi }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-E.svg)

_n_ minus the product of the nonzero digits of _n_,
OEIS [A063543](https://oeis.org/A063543):

~~~spl
1:250.collect { :n |
	let d = n.integerDigits;
	n - d.reject(isZero:/1).product
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-E.svg)

Count the number steps to reach a particular stop condition when iterating a map,
OEIS [A063574](https://oeis.org/A063574):

~~~spl
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

Moebius transform of Dedekind ψ function,
OEIS [A063659](https://oeis.org/A063659):

~~~spl
1:200.dedekindPsi
.moebiusTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/moebiusTransform-E.svg)

A variant of Recamáns sequence,
OEIS [A063733](https://oeis.org/A063733):

~~~spl
{ :a :n |
	let m = n - 1;
	let x = a[m] - m;
	(x > 0 & { a.includes(x).not } ).if {
		x
	} {
		a[m] + m
	}
}.recurrenceTable([1], 85)
.discretePlot
~~~

![](sw/spl/Help/Image/recamanSequence-G.svg)

Triangle in which _n_-th row gives quadratic non-residues modulo the _n_-th prime,
OEIS [A063988](https://oeis.org/A063988):

~~~spl
2:12.collect { :n |
	let p = n.prime;
	let q = p - 1;
	1:q.select { :m |
		jacobiSymbol(m, p) = -1
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/jacobiSymbol-C.svg)

Shift prime exponents of _2n-1_ to the previous prime or to `one`,
OEIS [A064216](https://oeis.org/A064216):

~~~spl
1:85.collect { :n |
	(2 * n - 1).factorInteger.product { :f |
		(f[1] <= 2).if {
			1
		} {
			f[1].nextPrime(-1) ^ f[2]
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/nextPrime-E.svg)

Height of terms of Recamán’s sequence,
OEIS [A064289](https://oeis.org/A064289):

~~~spl
let r = 150.recamanSequence;
r.addFirst(0);
r.differences.sign.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/recamanSequence-F.svg)

The _1,3_ Kolakoski sequence,
OEIS [A064353](https://oeis.org/A064353):

~~~spl
(85.kolakoskiSequence([1 3]) - 1)
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-D.svg)

Additive function defined by the recursion _a(p^k)=a(k)_ for any prime _p_,
OEIS [A064372](https://oeis.org/A064372):

~~~spl
let a = Map { :n |
	(n = 1).if {
		1
	} {
		a.atAll(n.primeSignature).sum
	}
};
a[1:105].stepPlot
~~~

![](sw/spl/Help/Image/primeSignature-G.svg)

A variant of Recamáns sequence,
_k_ begins at _n_ and then flips signs and increments until a value is located,
OEIS [A064389](https://oeis.org/A064389):

~~~spl
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

Number of partitions of _n_ with crank _k_ for _k_ in _-n:n_,
OEIS [A064391](https://oeis.org/A064391):

~~~spl
1:9.collect { :n |
	let p = n.integerPartitions;
	let c = p.collect(dysonCrank:/1);
	-n:n.collect { :k |
		c.occurrencesOf(k)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/dysonCrank-A.svg)

The Ekg sequence,
step plot,
OEIS [A064413](https://oeis.org/A064413):

~~~spl
37.ekgSequence.stepPlot
~~~

![](sw/spl/Help/Image/ekgSequence-A.svg)

The Ekg sequence,
scatter plot,
OEIS [A064413](https://oeis.org/A064413):

~~~spl
125.ekgSequence.scatterPlot
~~~

![](sw/spl/Help/Image/ekgSequence-B.svg)

Least excluded sequence such that the `gcd` of adjacent terms is _≠1_,
called the Ekg sequence,
OEIS [A064413](https://oeis.org/A064413):

~~~spl
[1 2]
.leastExcludedSequence(185) { :a :n :m |
	m.gcd(a[n - 1]) != 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/leastExcludedSequence-B.svg)

Least excluded sequence such that the `gcd` of adjacent terms is _≥3_,
OEIS [A064417](https://oeis.org/A064417):

~~~spl
[1 2 3]
.leastExcludedSequence(185) { :a :n :m |
	m.gcd(a[n - 1]) >= 3
}.scatterPlot
~~~

![](sw/spl/Help/Image/leastExcludedSequence-A.svg)

Interleave _n_ and _3n_,
OEIS [A064455](https://oeis.org/A064455):

~~~spl
let n = 1:35;
[n, 3 * n].interleave.discretePlot
~~~

![](sw/spl/Help/Image/interleave-B.svg)

Interleave _3(n-1)+1_ and _n_,
OEIS [A123684](https://oeis.org/A123684):

~~~spl
let n = 1:35;
[3 * (n - 1) + 1, n].interleave.discretePlot
~~~

![](sw/spl/Help/Image/interleave-C.svg)

_a(n+1)=a(n)+σ(a(n))_,
OEIS [A064491](https://oeis.org/A064491):

~~~spl
{ :x |
	x + 0.divisorSigma(x)
}.nestList(1, 47).scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-I.svg)

Sum of binary digits in the exponents of the prime factorization of _n_,
OEIS [A064547](https://oeis.org/A064547):

~~~spl
1:85.collect { :n |
	n.primeSignature.sum { :e |
		e.hammingWeight
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/primeSignature-K.svg)

Exchange two and three in the prime factorization of _n_,
OEIS [A064614](https://oeis.org/A064614):

~~~spl
1:60.collect { :n |
	[
		n,
		3/2 ^ n.integerExponent(2),
		2/3 ^ n.integerExponent(3)
	].product
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-K.svg)

Regard the Ekg sequence as giving a permutation of the positive integers,
calculate the inverse permutation,
OEIS [A064664](https://oeis.org/A064664),
or equivalently but for offset the term at which _n_ appears,
OEIS [A064421](https://oeis.org/A064421):

~~~spl
let e = 500.ekgSequence;
let u = 1:Infinity;
let k = e.minimumExcludedValue(u);
e.ordering.take(k).scatterPlot
~~~

![](sw/spl/Help/Image/ekgSequence-D.svg)

Square of Gray code,
OEIS [A064706](https://oeis.org/A064706):

~~~spl
0:127.grayEncode.grayEncode.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-G.svg)

Square of Gray decode,
OEIS [A064707](https://oeis.org/A064707):

~~~spl
0:127.grayDecode.grayDecode.scatterPlot
~~~

![](sw/spl/Help/Image/grayDecode-B.svg)

The number of positive integers up to _n_ with the same prime signature as _n_,
OEIS [A064839](https://oeis.org/A064839):

~~~spl
2:99.collect { :n |
	let p = n.primeSignature;
	let q = 2:n.collect(primeSignature:/1);
	q.occurrencesOf(p)
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeSignature-D.svg)

Working in base two replace _n_ with the concatenation of its prime divisors in increasing order,
OEIS [A064841](https://oeis.org/A064841):

~~~spl
1:25.collect { :n |
	n.primeFactors
	.binaryExpansion
	.catenate
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-J.svg)

The characteristic function of the semiprime numbers,
OEIS [A064911](https://oeis.org/A064911):

~~~spl
1:115.collect(isSemiprime:/1)
.boole
.discretePlot
~~~

![](sw/spl/Help/Image/isSemiprime-B.svg)

Prime instigated arithmetic series,
OEIS [A064924](https://oeis.org/A064924):

~~~spl
2:250.collect { :n |
	n.isPrime.if {
		n
	} {
		let p = n.previousPrime;
		p * (n - p + 1)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/previousPrime-A.svg)

Sum of divisors scaled by reverse index,
OEIS [A064945](https://oeis.org/A064945):

~~~spl
1:85.collect { :n |
	let d = n.divisors;
	let k = d.size;
	(k:1:-1 * d).sum
}.discretePlot
~~~

![](sw/spl/Help/Image/divisors-P.svg)

Shift prime exponents to the previous prime or to `one`,
OEIS [A064989](https://oeis.org/A064989):

~~~spl
1:85.collect { :n |
	n.factorInteger.product { :f |
		(f[1] <= 2).if {
			1
		} {
			f[1].previousPrime ^ f[2]
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/factorInteger-Q.svg)

Characteristic function of the numbers with an even number of prime factors,
counted with multiplicity,
OEIS [A065043](https://oeis.org/A065043):

~~~spl
1:105.collect { :n |
	(n.liouvilleLambda + 1) / 2
}.discretePlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-F.svg)

Alternating sum of reverse of binary expansion of the _n_-th prime,
OEIS [A065081](https://oeis.org/A065081):

~~~spl
1:85.prime.collect { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-I.svg)

Triangular array of means of two odd primes,
OEIS [A065305](https://oeis.org/A065305):

~~~spl
2:17.triangularArray { :n :k |
	(n.prime + k.prime) / 2
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prime-I.svg)

The Goldbach permutation,
OEIS [A065306](https://oeis.org/A065306):

~~~spl
let a = 2:23.triangularArray { :n :k |
	(n.prime + k.prime) / 2
}.catenate;
let b = a.deleteDuplicates - 2;
a.scatterPlot
~~~

![](sw/spl/Help/Image/prime-J.svg)

_a(n)=(p%4)*a(n/p)_,
OEIS [A065338](https://oeis.org/A065338):

~~~spl
let a = Map { :n |
	(n = 1).if {
		1
	} {
		let p = n.leastPrimeFactor;
		(p % 4) * a[n / p]
	}
};
a[1:65].discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-B.svg)

_-1^π(n)_,
OEIS [A065357](https://oeis.org/A065357):

~~~spl
(-1 ^ 0:65.primePi).discretePlot
~~~

![](sw/spl/Help/Image/primePi-R.svg)

The Jacob’s Ladder sequence,
partial sums of _-1^π(n)_,
OEIS [A065358](https://oeis.org/A065358):

~~~spl
let p = 1:65.primePi;
(-1 ^ p).prefixSum.discretePlot
~~~

![](sw/spl/Help/Image/primePi-Q.svg)

Alternating sum of reverse of binary expansion of _n_,
OEIS [A065359](https://oeis.org/A065359):

~~~spl
0:100.collect { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-D.svg)

Alternating sum of reverse of negabinary expansion of _n_,
OEIS [A065360](https://oeis.org/A065360):

~~~spl
0:99.collect { :n |
	n.negabinaryExpansion
	.reverse
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/negabinaryExpansion-B.svg)

Rebase _n_ from three to two,
OEIS [A065361](https://oeis.org/A065361):

~~~spl
0:115.ternaryExpansion.binaryContraction
.scatterPlot
~~~

![](sw/spl/Help/Image/ternaryExpansion-B.svg)

Rebase _n_ from four to two,
OEIS [A065362](https://oeis.org/A065362):

~~~spl
1:115.integerDigits(4).fromDigits(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-G.svg)

Alternating sum of reverse of ternary expansion of _n_,
OEIS [A065368](https://oeis.org/A065368):

~~~spl
0:65.collect { :n |
	n.integerDigits(3)
	.reverse
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-H.svg)

Number of hill-free Dyck paths of length _2n_ having height of first peak equal to _k_,
OEIS [A065602](https://oeis.org/A065602):

~~~spl
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

_a(2n)=2a(n)_ and _a(2n+1)=-2a(n)+1),
OEIS [A065620](https://oeis.org/A065620):

~~~spl
let a = { :n |
	(n = 0).if {
		0
	} {
		n.isOdd.if {
			1 - (2 * a((n - 1) / 2))
		} {
			2 * a(n / 2)
		}
	}
};
0:150.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isOdd-A.svg)

Reversing binary representation of _n_,
OEIS [A065621](https://oeis.org/A065621):

~~~spl
0:127.collect { :n |
	n.bitXor(2 * n + 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-U.svg)

Integer compositions in reverse lexicographic order,
OEIS [A066099](https://oeis.org/A066099):

~~~spl
1:5.collect { :n |
	n.integerCompositions
	.reverseLexicographicSort
}.catenate.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/reverseLexicographicSort-A.svg)

Characteristic function of composite numbers,
OEIS [A066247](https://oeis.org/A066247):

~~~spl
1:100.isComposite.boole.discretePlot
~~~

![](sw/spl/Help/Image/isComposite-C.svg)

Anti-divisor counts of _n_,
OEIS [A066272](https://oeis.org/A066272):

~~~spl
3:50.antiDivisors
.collect(size:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/antiDivisors-B.svg)

The number of anti-divisors of _n_,
OEIS [A066272](https://oeis.org/A066272):

~~~spl
1:150.collect { :n |
	let m = n - 1;
	2:m.count { :x |
		((n % x) - (x / 2)).abs < 1
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/count-A.svg)

_n-r(n)_
OEIS [A066503](https://oeis.org/A066503):

~~~spl
1:85.collect { :n |
	n - n.radical
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-F.svg)

Anti-divisor class sums of _n_,
OEIS [A066518](https://oeis.org/A066518):

~~~spl
1:100
.collect(antiDivisorsClassSum:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/antiDivisors-D.svg)

Gaps between successive numbers with an anti-divisor class sum of zero,
OEIS [A066519](https://oeis.org/A066519):

~~~spl
1:175
.collect(antiDivisorsClassSum:/1)
.indicesOf(0)
.differences
.stepPlot
~~~

![](sw/spl/Help/Image/antiDivisors-E.svg)

Indices of permutations of orders 1 or 2 when placed in lexicographic order,
OEIS [A066646](https://oeis.org/A066646):

~~~spl
[1 .. 6].permutations
.lexicographicSort
.collect(permutationOrder:/1)
.detectIndices { :x | x < 3 }
.scatterPlot
~~~

![](sw/spl/Help/Image/permutationOrder-A.svg)

Parity of _Ω(n)_,
OEIS [A066829](https://oeis.org/A066829):

~~~spl
1:65.collect { :n |
	(1 - n.liouvilleLambda) / 2
}.discretePlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-E.svg)

Parity of _Ω(n)_,
OEIS [A066829](https://oeis.org/A066829):

~~~spl
1:65.primeOmega
.collect(isOdd:/1)
.boole
.discretePlot
~~~

![](sw/spl/Help/Image/primeOmega-D.svg)

Number of different residues for the Fibonacci numbers modulo _n_,
OEIS [A066853](https://oeis.org/A066853):

~~~spl
1:125.collect { :n |
	let k = n.pisanoPeriod;
	let f = k.fibonacciSequence;
	(f % n).nub.size
}.discretePlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-B.svg)

Replace even exponents with two and odd exponents with one,
OEIS [A066990](https://oeis.org/A066990):

~~~spl
1:72.collect { :n |
	n.factorInteger.product { :x |
		let [a, b] = x;
		a ^ b.isEven.if { 2 } { 1 }
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/factorInteger-F.svg)

Ordinal transform of _τ(n)_,
OEIS [A067004](http://oeis.org/A067004):

~~~spl
0.divisorSigma(1:250)
.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-L.svg)

_Or-numbral_ multiplication table,
read by antidiagonals,
OEIS [A067138](https://oeis.org/A067138):

~~~spl
0:21.antidiagonalArray { :n :k |
	let r = 0;
	let m = n.bitLength - 1;
	0.toDo(m) { :i |
		(n.bitAt(i + 1) = 1).ifTrue {
			r := r.bitOr(
				k.bitShiftLeft(i)
			)
		}
	};
	r
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitAt-B.svg)

Number of odd unitary divisors of _n_,
OEIS [A068068](https://oeis.org/A068068):

~~~spl
1:55.collect { :n |
	n.unitaryDivisors.count(isOdd:/1)
}.discretePlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-E.svg)

Squarefree part of _n^2-1_,
OEIS [A068310](https://oeis.org/A068310):

~~~spl
2:65.collect { :n |
	let m = n.square - 1;
	let d = m.divisors;
	m / d.select(isPerfectSquare:/1).max
}.stepPlot
~~~

![](sw/spl/Help/Image/divisors-K.svg)

The second arithmetic derivative of _n_,
OEIS [A068346](https://oeis.org/A068346):

~~~spl
0:85.arithmeticDerivative
.arithmeticDerivative
.discretePlot
~~~

![](sw/spl/Help/Image/arithmeticDerivative-B.svg)

_n_-th prime minus its reversal,
OEIS [A068396](https://oeis.org/A068396):

~~~spl
1:160.prime.collect { :n |
	n - n.integerReverse
}.discretePlot
~~~

![](sw/spl/Help/Image/integerReverse-G.svg)

Number of runs of ones in the binary representation of _n_,
OEIS [A069010](https://oeis.org/A069010):

~~~spl
0:85.collect { :n |
	n.integerDigits(2)
	.split(=)
	.count { :x | x[1] = 1 }
}.discretePlot
~~~

![](sw/spl/Help/Image/split-D.svg)

Convolve identity and prime predicate,
OEIS [A069359](https://oeis.org/A069359):

~~~spl
1:115.collect(
	dirichletConvolve(
		{ :n | n },
		{ :n | n.isPrime.boole }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-C.svg)

_ω(n)=1_,
OEIS [A069513](https://oeis.org/A069513):

~~~spl
2:85.collect { :n |
	(n.primeNu = 1).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/primeNu-H.svg)

Smallest remainder of _p+q%n_,
where _p*q=n^2-1_,
OEIS [A069817](https://oeis.org/A069817):

~~~spl
1:75.collect { :n |
	(n < 5).if {
		n
	} {
		let r = n;
		let k = n ^ 2 - 1;
		let a = 0;
		k.divisors.do { :p |
			let t = (p + (k / p)) % n;
			(t < r & { p > 1 }).ifTrue {
				(p + 1 = n).if {
					a := r
				} {
					r := t
				}
			}
		};
		a
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisors-L.svg)

Hermite’s problem,
OEIS [A069981](https://oeis.org/A069981):

~~~spl
1:35.collect { :n |
	n.isEven.if {
		((n + 8) * (n - 2)) / 8
	} {
		(n ^ 2 - 1) / 8
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/isEven-E.svg)

Stern’s diatomic array,
version two,
OEIS [A070878](https://oeis.org/A070878):

~~~spl
8.sternsDiatomicArray('B')
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-C.svg)

Stern’s diatomic array,
version three,
OEIS [A070879](https://oeis.org/A070879):

~~~spl
8.sternsDiatomicArray('C')
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sternsDiatomicArray-D.svg)

_n⊻P(n)_,
OEIS [A070883](https://oeis.org/A070883):

~~~spl
1:85.collect { :n |
	n.bitXor(n.prime)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-W.svg)

Ones in the _n_-th generation of Rule 30,
OEIS [A070952](https://oeis.org/A070952):

~~~spl
let k = 100;
30.elementaryCellularAutomaton(
	[1].centerArray(k * 2, 0),
	k - 1
).collect(sum:/1).stepPlot
~~~

![](sw/spl/Help/Image/elementaryCellularAutomaton-I.svg)

First differences of Stern’s diatomic series,
discarding initial two terms,
OEIS [A070990](https://oeis.org/A070990):

~~~spl
115.sternBrocotSequence
.allButFirst(2)
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-D.svg)

Smallest _k_ such that the concatenation of _n_ and _k_ is a square,
OEIS [A071176](https://oeis.org/A071176):

~~~spl
1:150.collect { :n |
	let d = n.integerDigits;
	let k = 0;
	{
		(d ++ k.integerDigits)
		.fromDigits
		.isPerfectSquare
	}.whileFalse {
		k := k + 1
	};
	k
}.scatterPlot
~~~

![](sw/spl/Help/Image/isPerfectSquare-C.svg)

Alternating sum of all prime factors of _n_,
OEIS [A071321](https://oeis.org/A071321):

~~~spl
1:85.collect { :n |
	n.primeFactors
	.alternatingSum
}.logScale.discretePlot
~~~

![](sw/spl/Help/Image/primeFactors-G.svg)

The numerator sequence,
OEIS [A071585](https://oeis.org/A071585):

~~~spl
OeisEntry('A071585').then { :e |
	e.data.scatterPlot
}
~~~

![](sw/spl/Help/Image/fromContinuedFraction-B.svg)

The denominator sequence,
OEIS [A071766](https://oeis.org/A071766):

~~~spl
OeisEntry('A071766').then { :e |
	e.data.scatterPlot
}
~~~

![](sw/spl/Help/Image/fromContinuedFraction-C.svg)

_gcd(r(n),n/r(n))_,
OEIS [A071773](https://oeis.org/A071773):

~~~spl
1:85.collect { :n |
	let r = n.radical;
	r.gcd(n / r)
}.stepPlot
~~~

![](sw/spl/Help/Image/radical-H.svg)

_Π(R(F(n)))_,
OEIS [A071786](https://oeis.org/A071786):

~~~spl
1:250.collect { :n |
	n.primeFactors
	.product(integerReverse:/1)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-D.svg)

The first decimal selvage number,
OEIS [A071789](https://oeis.org/A071789):

~~~spl
1.decimalSelvageNumber(194)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-A.svg)

The second decimal selvage number,
OEIS [A071790](https://oeis.org/A071790):

~~~spl
2.decimalSelvageNumber(193)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-B.svg)

The third decimal selvage number,
OEIS [A071791](https://oeis.org/A071791):

~~~spl
3.decimalSelvageNumber(206)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-C.svg)

The fourth decimal selvage number,
OEIS [A071792](https://oeis.org/A071792):

~~~spl
4.decimalSelvageNumber(193)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-D.svg)

The fifth decimal selvage number,
OEIS [A071793](https://oeis.org/A071793):

~~~spl
5.decimalSelvageNumber(198)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-E.svg)

The _2,3_ Kolakoski sequence,
OEIS [A071820](https://oeis.org/A071820):

~~~spl
(107.kolakoskiSequence([2 3]) - 2)
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-E.svg)

The sixth decimal selvage number,
OEIS [A071873](https://oeis.org/A071873):

~~~spl
6.decimalSelvageNumber(198)
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalSelvageNumber-F.svg)

Least square-free _m>n_ with _gcd(m,n)>1_,
OEIS [A071888](https://oeis.org/A071888):

~~~spl
2:85.collect { :n |
	let m = n + 1;
	{
		m.isSquareFree & {
			m.gcd(n) > 1
		}
	}.whileFalse {
		m := m + 1
	};
	m
}.scatterPlot
~~~

![](sw/spl/Help/Image/isSquareFree-C.svg)

The _1,4_ Kolakoski sequence,
OEIS [A071907](https://oeis.org/A071907),
minus one:

~~~spl
(105.kolakoskiSequence([1 4]) - 1)
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-J.svg)

The _2,4_ Kolakoski sequence,
OEIS [A071928](https://oeis.org/A071928),
minus two:

~~~spl
(105.kolakoskiSequence([2 4]) - 2)
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-K.svg)

The _3,4_ Kolakoski sequence,
OEIS [A071942](https://oeis.org/A071942),
minus three:

~~~spl
(105.kolakoskiSequence([3 4]) - 3)
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-L.svg)

Wythoff pairs sequence,
OEIS [A072061](https://oeis.org/A072061):

~~~spl
1:55.collect(wythoffPair:/1)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffPair-B.svg)

Difference between number of oddly and evenly factored numbers,
OEIS [A072203](https://oeis.org/A072203):

~~~spl
1:150.collect { :n |
	1 - 1:n.sum { :i |
		-1 ^ i.primeOmega
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeOmega-C.svg)

Add one to every other term of the number of runs in the binary expansion of _n_,
OEIS [A072219](https://oeis.org/A072219):

~~~spl
0:85.collect { :n |
	n.integerDigits(2).split { :x :y |
		x = 1 & { y = 0 }
	}.occurrencesOf([1 0]) * 2 + 1
}.discretePlot
~~~

![](sw/spl/Help/Image/split-C.svg)

Number of ways to distribute _n_ indistinguishable objects in _k_ indistinguishable containers,
OEIS [A072233](https://oeis.org/A072233):

~~~spl
0:10.triangularArray { :n :k |
	n.integerPartitions([k]).size
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/integerPartitions-H.svg)

One less than the number of runs of ones in the binary representations of _n_ and _2n-1_,
OEIS [A072339](https://oeis.org/A072339):

~~~spl
let f = { :n |
	n.integerDigits(2)
	.split(=)
	.count { :x | x[1] = 1 }
};
1:85.collect { :n |
	f(n) + f(2 * n - 1) - 1
}.discretePlot
~~~

![](sw/spl/Help/Image/split-E.svg)

The shadow transform of
OEIS [A000522](https://oeis.org/A000522),
OEIS [A072453](https://oeis.org/A072453):

~~~spl
let x = { :i :j |
	i * j + j
}.foldList(0, 1L:150) + 1;
x.shadowTransform
.discretePlot
~~~

![](sw/spl/Help/Image/shadowTransform-A.svg)

Shadow transform of tetrahedral numbers,
OEIS [A072457](https://oeis.org/A072457):

~~~spl
0:115.tetrahedralNumber
.shadowTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/shadowTransform-B.svg)

Shadow transform of _σ(n)_,
OEIS [A072463](https://oeis.org/A072463):

~~~spl
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

Shadow transform of _σ(n)_,
OEIS [A072463](https://oeis.org/A072463):

~~~spl
0:115.collect { :n |
	1.divisorSigma(n)
}.shadowTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/shadowTransform-D.svg)

Numerators of rationals _≥1_ whose continued fractions consist only of ones and twos,
OEIS [A072728](https://oeis.org/A072728):

~~~spl
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

Denominators of rationals _≥1_ whose continued fractions consist only of ones and twos,
OEIS [A072729](https://oeis.org/A072729):

~~~spl
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

First differences of the Ulam sequence,
OEIS [A072832](https://oeis.org/A072832):

~~~spl
175.ulamSequence
.differences
.scatterPlot
~~~

![](sw/spl/Help/Image/ulamSequence-B.svg)

A sequence that is distinct from but similar to the period doubling sequence,
OEIS [A073059](https://oeis.org/A073059):

~~~spl
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

_2*(n-w(n))/3_ where _w_ is the one count in the base negative two expansion,
OEIS [A073504](https://oeis.org/A073504):

~~~spl
1:50.collect { :n |
	2 * (n - n.digitCount(-2, 1)) / 3
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-R.svg)

Number of ordered ways of writing n as the sum of two primes,
OEIS [A073610](https://oeis.org/A073610):

~~~spl
1:115.collect { :n |
	[1 1].frobeniusSolve(n)
	.count { :x |
		x.allSatisfy(isPrime:/1)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-C.svg)

Replace _n_ with the concatenation of its prime divisors in increasing order,
OEIS [A048985](https://oeis.org/A048985),
also apart from first term
OEIS [A073646](https://oeis.org/A073646):

~~~spl
2:200.collect { :n |
	n.primeFactors
	.decimalExpansion
	.catenate
	.decimalContraction
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/decimalExpansion-A.svg)

`gcd` of consecutive terms,
OEIS [A073734](https://oeis.org/A073734):

~~~spl
85.ekgSequence
.adjacentPairsCollect(gcd:/2)
.discretePlot
~~~

![](sw/spl/Help/Image/ekgSequence-C.svg)

Least positive integers whose convolution forms a sequence whose odd-indexed terms are twice the odd primes,
OEIS [A073739](https://oeis.org/A073739):

~~~spl
let a = Map { :n |
	(n <= 2).if {
		1
	} {
		n.isEven.if {
			0
		} {
			let m = n + 1;
			(m / 2).prime - a[n - 2]
		}
	}
};
a[0:150].scatterPlot
~~~

![](sw/spl/Help/Image/isEven-H.svg)

Self convolution of
OEIS [A073739](https://oeis.org/A073739),
OEIS [A073740](https://oeis.org/A073740):

~~~spl
let k = 150;
let a = Map { :n |
	(n <= 2).if {
		1
	} {
		n.isEven.if {
			0
		} {
			let m = n + 1;
			(m / 2).prime - a[n - 2]
		}
	}
};
let b = a[0:k];
b.convolve(b).first(k + 1).log.scatterPlot
~~~

![](sw/spl/Help/Image/convolve-E.svg)

Self convolution of
OEIS [A073739](https://oeis.org/A073739),
OEIS [A073740](https://oeis.org/A073740):

~~~spl
let b = Map { :n |
	(n <= 2).if {
		1
	} {
		n.isEven.if {
			0
		} {
			let m = n + 1;
			(m / 2).prime - b[n - 2]
		}
	}
};
let a = Map { :n |
	(n <= 2).if {
		n + 1
	} {
		n.isEven.if {
			0:n.sum { :k |
				b[k] * b[n - k]
			}
		} {
			let m = n - 1;
			2 * (m / 2 + 1).prime
		}
	}
};
a[0:150].log.scatterPlot
~~~

![](sw/spl/Help/Image/isEven-I.svg)

Semi-tribonacci numbers,
OEIS [A074364](https://oeis.org/A074364):

~~~spl
let a = Map { :n |
	(n < 2).if {
		n
	} {
		n.isEven.if {
			a[n / 2]
		} {
			a[n - 1] + a[n - 2] + a[n - 3]
		}
	}
};
a[0:150].log.scatterPlot
~~~

![](sw/spl/Help/Image/tribonacciNumber-B.svg)

The coefficient of _1/n_ in the base _n_ representation of _√n_,
OEIS [A074704](https://oeis.org/A074704):

~~~spl
1:75.collect { :n |
	(n ^ 1.5).floor - (n * (n ^ 0.5).floor)
}.scatterPlot
~~~

![](sw/spl/Help/Image/power-C.svg)

Least sequence where every term divides the product of its neighbors,
OEIS [A075075](https://oeis.org/A075075):

~~~spl
[1 2]
.leastExcludedSequence(201) { :a :n :m |
	(m * a[n - 2]).divisible(a[n - 1])
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-D.svg)

Segment of least sequence where every term divides the product of its neighbors,
OEIS [A075075](https://oeis.org/A075075):

~~~spl
let a = [1L 2L];
2:350.do { :n |
	let d = a[n] / a[n - 1];
	let m = d.numerator;
	let k = m;
	{
		a.includes(k)
	}.whileTrue {
		k := k + m
	};
	a.add(k)
};
a.drop(100).scatterPlot
~~~

![](sw/spl/Help/Image/numerator-B.svg)

_μ(r(n))_,
OEIS [A076479](https://oeis.org/A076479):

~~~spl
1:85.radical.moebiusMu.discretePlot
~~~

![](sw/spl/Help/Image/radical-C.svg)

Denominator of _((n-φ)/φ)_,
[A076512](https://oeis.org/A076512):

~~~spl
1:86.collect { :n |
	let phi = n.eulerPhi.asFraction;
	((n - phi) / phi).denominator
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-E.svg)

First differences of the upper Wythoff sequence,
a Fibonacci word,
OEIS [A076662](https://oeis.org/A076662):

~~~spl
1:65.wythoffUpper
.differences
.stepPlot
~~~

![](sw/spl/Help/Image/wythoffUpper-A.svg)

_r(P(n)-1)_,
OEIS [A077063](https://oeis.org/A077063):

~~~spl
1:115.collect { :n |
	(n.prime - 1).radical
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-L.svg)

The unitary divisors of _n_,
OEIS [A077610](https://oeis.org/A077610):

~~~spl
1:65.collect(unitaryDivisors:/1)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-A.svg)

First differences of sequence of nonsquarefree numbers,
OEIS [A078147](https://oeis.org/A078147):

~~~spl
1:150.reject(isSquareFree:/1)
.differences.discretePlot
~~~

![](sw/spl/Help/Image/isSquareFree-D.svg)

_n*r(n)+1_
OEIS [A078310](https://oeis.org/A078310):

~~~spl
1:85.collect { :n |
	n * n.radical + 1
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-E.svg)

_ω(n*r(n)+1)_
OEIS [A078313](https://oeis.org/A078313):

~~~spl
1:85.collect { :n |
	(n * n.radical + 1).primeNu
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-M.svg)

_Ω(n*r(n)+1)_
OEIS [A078314](https://oeis.org/A078314):

~~~spl
1:85.collect { :n |
	(n * n.radical + 1).primeOmega
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-N.svg)

_r(n*r(n)+1)_
OEIS [A078322](https://oeis.org/A078322):

~~~spl
1:85.collect { :n |
	(n * n.radical + 1).radical
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-D.svg)

_a(P(n))=a(n)+1_ and _a(C(n))=0_,
OEIS [A078442](https://oeis.org/A078442):

~~~spl
let a = Map { :n |
	n.isPrime.if {
		1 + a[n.primePi]
	} {
		0
	}
};
a[1:150].discretePlot
~~~

![](sw/spl/Help/Image/primePi-T.svg)

_r(n)^2_,
OEIS [A078615](https://oeis.org/A078615):

~~~spl
1:150.radical.square.scatterPlot
~~~

![](sw/spl/Help/Image/radical-J.svg)

Number of times the smallest prime factor of _n_ is the smallest prime factor for numbers _≤n_,
OEIS [A078898](https://oeis.org/A078898):

~~~spl
let m = 100;
let l = 1:m.leastPrimeFactor;
1:m.collect { :n |
	l.take(n).occurrencesOf(l[n])
}.discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-D.svg)

Number of first-quadrant cells born at stage _n_ of the Holladay-Ulam cellular automaton,
OEIS [A079314](https://oeis.org/A079314),
essentially also
OEIS [A147610](https://oeis.org/A147610):

~~~spl
let n = 1:85;
let w = n.digitCount(2, 1);
let a = 3 ^ (w - 1) + 1;
([1] ++ a).discretePlot
~~~

![](sw/spl/Help/Image/digitCount-N.svg)

_⌊(σ(n^2)/σ(n))_,
OEIS [A079553](https://oeis.org/A079553):

~~~spl
1:65.collect { :n |
	(
		0.divisorSigma(n ^ 2)
		/
		0.divisorSigma(n)
	).floor
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-R.svg)

Fixed point of morphism _0→0,1→110_,
OEIS [A079559](https://oeis.org/A079559):

~~~spl
let m = [0: [0], 1: [1 1 0]];
{ :x |
	x.collect { :i |
		m[i]
	}.catenate
}.iterate([1], 5).discretePlot
~~~

![](sw/spl/Help/Image/iterate-E.svg)

Fixed point of morphism _0→0,1→110_,
OEIS [A079559](https://oeis.org/A079559):

~~~spl
[
	0 -> [0],
	1 -> [1 1 0]
].substitutionSystem([1], 5)
.last
.discretePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-G.svg)

_2^n_ zeroes followed by _2^n_ ones,
OEIS [A079944](https://oeis.org/A079944):

~~~spl
0:65.collect { :n |
	(n + 2).binaryExpansion.second
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-M.svg)

Array giving the length of the longest carry sequence when adding _k_ to _n_ in binary,
OEIS [A080080](https://oeis.org/A080080):

~~~spl
let add = { :x :y :z |
	(y = 0).if {
		z - 1
	} {
		add(
			x.bitXor(y),
			x.bitAnd(y).bitShiftLeft(1),
			z + 1
		)
	}
};
1:13.triangularArray { :n :k |
	add(n, k, 0)
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/bitAnd-I.svg)

Bitwise logical or triangular array,
OEIS [A080098](https://oeis.org/A080098):

~~~spl
0:19.triangularArray(bitOr:/2)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitOr-H.svg)

Bitwise logical and,
triangular array,
OEIS [A080099](https://oeis.org/A080099):

~~~spl
0:19.triangularArray(bitAnd:/2)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitAnd-N.svg)

Primes having initial digits _11_ in their binary representation,
OEIS [A080166](https://oeis.org/A080166):

~~~spl
1:200.prime.select { :n |
	n.binaryExpansion.first(2) = [1 1]
}.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-G.svg)

Primes having initial and final digits _11_ in their binary representation,
OEIS [A080168](https://oeis.org/A080168):

~~~spl
1:200.prime.select { :n |
	let b = n.binaryExpansion;
	b.first(2) = [1 1] & {
		b.last(2) = [1 1]
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-H.svg)

Prefix sum of exclusive or of adjacent integers,
_n⊕(n-1)_,
OEIS [A080277](https://oeis.org/A080277):

~~~spl
1:125.collect { :n |
	n.bitXor(n - 1)
}.prefixSum.stepPlot
~~~

![](sw/spl/Help/Image/bitXor-L.svg)

Characteristic function of `one` and primes,
OEIS [A080339](https://oeis.org/A080339):

~~~spl
1:100.collect { :n |
	n.primeOmega < 2
}.boole.discretePlot
~~~

![](sw/spl/Help/Image/primeOmega-F.svg)

Interleave _2n-1_ and _3n_,
OEIS [A080512](https://oeis.org/A080512):

~~~spl
let n = 1:35;
[2 * n - 1, 3 * n].interleave.discretePlot
~~~

![](sw/spl/Help/Image/interleave-D.svg)

Partitions in graded reflected lexicographic order (Maple),
OEIS [A080576](https://oeis.org/A080576):

~~~spl
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedReflectedLexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-C.svg)

Partitions in graded reverse lexicographic ordering (Mathematica),
OEIS [A080577](https://oeis.org/A080577):

~~~spl
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedReverseLexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-B.svg)

Characteristic function of generalized pentagonal numbers,
OEIS [A080995](https://oeis.org/A080995):

~~~spl
let a = 24.generalisedPentagonalNumbers;
let k = a.max;
1:k.collect { :n |
	a.includes(n).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/generalisedPentagonalNumbers-B.svg)

The ordinal transform of _φ(n)_,
OEIS [A081373](https://oeis.org/A081373):

~~~spl
1:250.eulerPhi
.ordinalTransform
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-A.svg)

Number of numbers _≤n_ having no zero in their ternary representation,
OEIS [A081608](https://oeis.org/A081608):

~~~spl
0:200.collect { :n |
	n.ternaryExpansion.includes(0).not
}.boole.prefixSum.stepPlot
~~~

![](sw/spl/Help/Image/ternaryExpansion-C.svg)

Number of primes congruent to one modulo four dividing _n_,
OEIS [A083025](https://oeis.org/A083025):

~~~spl
1:150.collect { :n |
	n.primeFactors.select { :x |
		x % 4 = 1
	}.size
}.discretePlot
~~~

![](sw/spl/Help/Image/primeFactors-E.svg)

Pascal’s triangle modulo three,
OEIS [A083093](https://oeis.org/A083093),
offset to _-1,0,1_:

~~~spl
(16.pascalTriangle % 3 - 1)
.catenate
.discretePlot
~~~

![](sw/spl/Help/Image/pascalTriangle-G.svg)

Seieve of Eratosthenes arranged as an array,
read by antidigaonals,
OEIS [A083221](https://oeis.org/A083221):

~~~spl
let k = 12;
let a = 1:k.collect { :n |
	let p = n.prime;
	Range(p, Infinity, p).detect(k) { :x |
		x.leastPrimeFactor = p
	}
};
let b = [];
1:k.sum.antidiagonalIndicesDo { :i :j |
	b.add(a[i][j])
};
b.discretePlot
~~~

![](sw/spl/Help/Image/leastPrimeFactor-E.svg)

_2*φ(n)-n_,
OEIS [A083254](https://oeis.org/A083254):

~~~spl
1:85.collect { :n |
	2 * n.eulerPhi - n
}.discretePlot
~~~

![](sw/spl/Help/Image/eulerPhi-M.svg)

Wythoff array read by rising antidiagonals,
OEIS [A083412](https://oeis.org/A083412):

~~~spl
10.antidiagonalArray(
	wythoffArray:/2.swap
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffArray-B.svg)

Signature sequence of 1/φ,
OEIS [A084531](https://oeis.org/A084531):

~~~spl
let phi = 1.goldenRatio;
phi.signatureSequence(200)
.scatterPlot
~~~

![](sw/spl/Help/Image/goldenRatio-I.svg)

Multiplicative order of ten modulo _n_,
OEIS [A084680](https://oeis.org/A084680):

~~~spl
1:96.collect { :n |
	n.isCoprime(10).if {
		10.multiplicativeOrder(n)
	} {
		0
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-C.svg)

The terms of A071156 can be calculated from A014486 using
OEIS [A085198](https://oeis.org/A085198):

~~~spl
0:150.collect(
	oeisFunction('A085198')
).logScale.scatterPlot
~~~

![](sw/spl/Help/Image/factorialNumberSystemEncode-A.svg)

The decimal expansion of the limit of the ratio of consecutive terms in the tetranacci sequence,
OEIS [A086088](https://oeis.org/A086088):

~~~spl
[
	1 9 2 7 5 6 1 9 7 5 4 8 2 9 2 5 3 0 4 2
	6 1 9 0 5 8 6 1 7 3 6 6 2 2 1 6 8 6 9 8
	5 5 4 2 5 5 1 6 3 3 8 4 7 2 7 1 4 6 6 4
	7 0 3 8 0 0 9 6 6 6 0 6 2 2 9 7 8 1 5 5
	5 9 1 4 9 8 1 8 2 5 3 4 6 1 8 9 0 6 5 3
	2 5
].scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-I.svg)

`bitAnd` and `bitOr` bitwise,
OEIS [A086099](https://oeis.org/A086099):

~~~spl
0:63.collect { :n |
	0:n.collect { :k |
		k.bitAnd(n - k)
	}.bitOr
}.stepPlot
~~~

![](sw/spl/Help/Image/bitOr-E.svg)

The obscure sequence
OEIS [A086267](https://oeis.org/A086267):

~~~spl
let k = 106;
let h = (k + 2).hofstadterQSequence;
h.partition(3, 1).collect { :i |
	let [a, b, c] = i;
	let r = (a - (2 * b) + c - 4) / a;
	3 + (a % 6) + r.floor
}.scatterPlot
~~~

![](sw/spl/Help/Image/hofstadterQSequence-C.svg)

The Baum–Sweet sequence,
OEIS [A086747](https://oeis.org/A086747):

~~~spl
115.baumSweetSequence.discretePlot
~~~

![](sw/spl/Help/Image/baumSweetSequence-B.svg)

Bitwise or of _n_ and _n-1_,
OEIS [A086799](https://oeis.org/A086799):

~~~spl
let n = 1:100;
n.bitOr(n - 1).linePlot
~~~

![](sw/spl/Help/Image/bitOr-A.svg)

Ramanujan sum _Cn(2)_,
OEIS [A086831](https://oeis.org/A086831):

~~~spl
[1 2].padRight([63], 0)
.moebiusTransform
.discretePlot
~~~

![](sw/spl/Help/Image/moebiusTransform-C.svg)

Number of cubes in multiplicative group modulo _n_,
OEIS [A087692](https://oeis.org/A087692):

~~~spl
2:85.collect { :n |
	n.factorInteger.product { :f |
		let [p, k] = f;
		(p = 3).if {
			(k = 1).if {
				2
			} {
				2 * (3 ^ (k - 2))
			}
		} {
			let q = (p - 1) * (p ^ (k - 1));
			(p % 6 = 1).if {
				q / 3
			} {
				q
			}
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/product-D.svg)

The truncated Mertens function,
OEIS [A088004](https://oeis.org/A088004):

~~~spl
1:81.collect { :n |
	n.moebiusMu + n.isPrime.boole
}.prefixSum.stepPlot
~~~

![](sw/spl/Help/Image/moebiusMu-J.svg)

Sum of primitive roots of _n_-th prime,
OEIS [A088144](https://oeis.org/A088144):

~~~spl
1:90.collect { :n |
	n.prime.primitiveRootList.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/primitiveRootList-D.svg)

_(Σ(R(p(n))) - μ(p(n)-1))/p(n)_,
OEIS [A088145](https://oeis.org/A088145):

~~~spl
let m = 43;
let a = 1:m.collect { :n |
	let p = n.prime;
	let k = p - 1;
	1:k.select { :i |
		i.multiplicativeOrder(p) = k
	}
};
1:m.collect { :n |
	let k = a[n].size;
	let p = n.prime;
	(1:k.sum { :i |
		a[n][i]
	} - (p - 1).moebiusMu) / p
}.discretePlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-F.svg)

_(Σ(R(p(n))) - μ(p(n)-1))/p(n)_,
OEIS [A088145](https://oeis.org/A088145):

~~~spl
1:71.collect { :n |
	let p = n.prime;
	let r = p.primitiveRootList.sum;
	(r - (p - 1).moebiusMu) / p
}.discretePlot
~~~

![](sw/spl/Help/Image/primitiveRootList-E.svg)

Sequence where each term is the least integer such that adjacent products are distinct,
OEIS [A088177](https://oeis.org/A088177):

~~~spl
let t = [1 1];
3.toDo(200) { :n |
	t.add(1);
	{
		let s = IdentitySet();
		1.toDo(n - 1) { :i |
			s.include(t[i] * t[i + 1])
		};
		s.size < (n - 1)
	}.whileTrue {
		t[n] := t[n] + 1
	}
};
t.scatterPlot
~~~

![](sw/spl/Help/Image/IdentitySet-A.svg)

Calculate sequence where each term is the least integer such that adjacent products are distinct,
OEIS [A088177](https://oeis.org/A088177) _(a)_,
and hence adjacent products,
OEIS [A088178](https://oeis.org/A088178) _(b)_:

~~~spl
let a = [1 1];
let b = [1];
let p = IdentitySet(b);
let x = 1;
250.timesRepeat {
	let i = 1;
	let y = x;
	{
		p.includes(y)
	}.whileTrue {
		i := i + 1;
		y := y + x
	};
	p.add(y);
	x := i;
	a.add(x);
	b.add(y)
};
b.scatterPlot
~~~

![](sw/spl/Help/Image/IdentitySet-B.svg)

Let _a(n)_ be the prefix sum of the Kolakoski sequence,
_3n - 2a(n)_,
OEIS [A088568](https://oeis.org/A088568):

~~~spl
let n = 115;
let a = n.kolakoskiSequence.prefixSum;
((3 * 1:n) - (2 * a)).discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-F.svg)

First differences of the ones-counting sequence,
OEIS [A088705](https://oeis.org/A088705):

~~~spl
let a = Map { :n |
	(n < 1).if {
		0
	} {
		(n % 2 = 0).if {
			a[n / 2] - 1
		} {
			1
		}
	}
};
a[0:127].discretePlot
~~~

![](sw/spl/Help/Image/mod-L.svg)

A recurrence table,
_a[n-1]+(-1ᵐa[m])_ where _m=⌊(n/2)_,
OEIS [A089045](https://oeis.org/A089045):

~~~spl
{ :a :n |
	let m = (n / 2).floor;
	a[n - 1] + ((-1 ^ m) * a[m])
}.recurrenceTable([1], 85).discretePlot
~~~

![](sw/spl/Help/Image/power-I.svg)

Rational knots of determinant _2n+1_,
counting chiral pairs twice,
OEIS [A089266](https://oeis.org/A089266):

~~~spl
1:200.collect { :n |
	let m = (2 * n + 1);
	let a = m.eulerPhi;
	let b = 2 ^ m.primeNu;
	(a + b) / 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeNu-B.svg)

Continued fraction elements constructed out of a van der Corput sequence,
OEIS [A089618](https://oeis.org/A089618):

~~~spl
let n = 1:250.vanDerCorputNumber(2);
(1 / (2 ^ n - 1)).floor.log.scatterPlot
~~~

![](sw/spl/Help/Image/vanDerCorputNumber-J.svg)

Numbers having no more than one zero in their binary representation,
OEIS [A089633](https://oeis.org/A089633):

~~~spl
0:1024.select { :n |
	n.digitCount(2, 0) < 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-J.svg)

Penny flipping sequence,
OEIS [A089645](https://oeis.org/A089645):

~~~spl
2:115.collect { :n |
	let m = 2 * n + 1;
	let b = 2.multiplicativeOrder(m);
	let c = 2.multiplicativeOrder(
		m,
		[-1 1]
	);
	(b = c).if {
		n * b
	} {
		n * b / 2 - 1
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeOrder-I.svg)

Fibonacci modulo twelve,
period is twenty-four,
OEIS [A089911](https://oeis.org/A089911):

~~~spl
(0:47.fibonacci % 12)
.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-L.svg)

Pascal’s triangle negated modulo three,
OEIS [A090044](https://oeis.org/A090044),
offset to _-1,0,1_:

~~~spl
(16.pascalTriangle.negate % 3 - 1)
.catenate
.discretePlot
~~~

![](sw/spl/Help/Image/pascalTriangle-I.svg)

Ordered differences of primes,
row reversed,
OEIS [A090321](https://oeis.org/A090321):

~~~spl
1:11.prime
.orderedDifferences
.collect(reverse:/1)
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/orderedDifferences-C.svg)

An integer modulo an integer sequence,
_100%n_,
i.e. varying the modulus,
OEIS [A090976](https://oeis.org/A090976):

~~~spl
(100 % 1:65).discretePlot
~~~

![](sw/spl/Help/Image/mod-B.svg)

Kronecker symbol where _m=2_,
period eight,
OEIS [A091337](https://oeis.org/A091337):

~~~spl
0:99.collect { :n |
	n.kroneckerSymbol(2)
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerSymbol-I.svg)

Quaternary sieve,
OEIS [A092418](https://oeis.org/A092418):

~~~spl
let a = [1 .. 100];
1:6.do { :n |
	let k = 4 ^ n;
	let i = Range(k, a.size, k);
	a.removeAtAll(i)
};
a.discretePlot
~~~

![](sw/spl/Help/Image/removeAtAll-C.svg)

_w(n)!_,
OEIS [A093659](https://oeis.org/A093659):

~~~spl
0:250.hammingWeight
.factorial
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-F.svg)

Two interleaved Beatty sequences,
OEIS [A094077](https://oeis.org/A094077):

~~~spl
let k = 45;
let c = 2.sqrt;
[
	k.beattySequence(c),
	k.beattySequence(c / (c - 1))
].interleave.scatterPlot
~~~

![](sw/spl/Help/Image/beattySequence-A.svg)

Two interleaved Beatty sequences,
OEIS [A094077](https://oeis.org/A094077):

~~~spl
let u = 1:Infinity;
let a = Map { :n |
	(n = 1).if {
		1
	} {
		n.isEven.if {
			a[n - 1] + n
		} {
			a.minimumExcludedValue(u)
		}
	}
};
a[1:85].scatterPlot
~~~

![](sw/spl/Help/Image/minimumExcludedValue-A.svg)

Integers whose Zeckendorf representation is palindromic,
OEIS [A094202](https://oeis.org/A094202):

~~~spl
0:500.select { :n |
	n.zeckendorfRepresentation
	.isPalindrome
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-E.svg)

First differences of the ruler function,
OEIS [A094267](https://oeis.org/A094267):

~~~spl
1:85.collect(rulerFunction:/1)
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/rulerFunction-B.svg)

Matrix plot of the first few rows of Pascal’s triangle modulo five,
OEIS [A095140](https://oeis.org/A095140):

~~~spl
(20.pascalTriangle % 5)
.padRight
.rescale
.matrixPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-E.svg)

Pascal’s triangle modulo six,
OEIS [A095141](https://oeis.org/A095141):

~~~spl
(14.pascalTriangle % 6)
.catenate
.stepPlot
~~~

![](sw/spl/Help/Image/pascalTriangle-K.svg)

Table,
read by rows,
where _n_-th row contains all quadratic residues,
including zero,
modulo _n_,
OEIS [A096008](https://oeis.org/A096008):

~~~spl
1:30.collect { :n |
	[0 .. n - 1].collect { :k |
		powerMod(k, 2, n)
	}.nub.sort
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-D.svg)

The quadratic residues modulo _p_ which are coprime to _p_,
OEIS [A096103](https://oeis.org/A096103):

~~~spl
2:30.collect { :p |
	p.quadraticResidues.select { :q |
		q.isCoprime(p)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/quadraticResidues-C.svg)

The period doubling sequence,
OEIS [A096268](https://oeis.org/A096268):

~~~spl
115.periodDoublingSequence.discretePlot
~~~

![](sw/spl/Help/Image/periodDoublingSequence-A.svg)

The triangle given by recursion _T(n,k)=T(n-1,k)-T(n,k-1)_,
OEIS [A096470](https://oeis.org/A096470):

~~~spl
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

Interleave _n_ and _1-n_,
OEIS [A097140](https://oeis.org/A097140):

~~~spl
[-1 1 1].linearRecurrence([0 1 1], 85)
.discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-N.svg)

_(n-2)(-1^n)_,
OEIS [A097141](https://oeis.org/A097141):

~~~spl
let n = 1:65;
((n - 2) * (-1 ^ n)).discretePlot
~~~

![](sw/spl/Help/Image/power-J.svg)

Riordan array _(1+x,1)_ read by rows,
OEIS [A097806](https://oeis.org/A097806):

~~~spl
1:13.collect { :n |
	[1 1].padLeft([n], 0)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/padLeft-D.svg)

A sequence that is distinct from but similar to the complement of the period doubling sequence,
OEIS [A098725](https://oeis.org/A098725):

~~~spl
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

Step plot of fifth iteration of Arshon’s sequence,
OEIS [A099054](https://oeis.org/A099054):

~~~spl
5.arshonsSequence
.stepPlot
~~~

![](sw/spl/Help/Image/arshonsSequence-A.svg)

Sixth iteration of Arshon’s sequence,
offset to to over alphabet _-1,0,1_,
OEIS [A099054](https://oeis.org/A099054):

~~~spl
(6.arshonsSequence - 2)
.discretePlot
~~~

![](sw/spl/Help/Image/arshonsSequence-B.svg)

Self-convolution of the inverse of sixth cyclotomic polynomial,
OEIS [A010892](https://oeis.org/A010892),
OEIS [A099254](https://oeis.org/A099254):

~~~spl
let a = [1 1 0 -1 -1 0].repeat(13);
let k = a.size;
a.convolve(a).first(k).discretePlot
~~~

![](sw/spl/Help/Image/convolve-F.svg)

A knot sequence,
OEIS [A099254](https://oeis.org/A099254):

~~~spl
[2 -3 2 -1].linearRecurrence(
	[1 2 1 -2], 85
).discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-G.svg)

The third arithmetic derivative of _n_,
OEIS [A099306](https://oeis.org/A099306):

~~~spl
0:85.arithmeticDerivative
.arithmeticDerivative
.arithmeticDerivative
.discretePlot
~~~

![](sw/spl/Help/Image/arithmeticDerivative-C.svg)

Sequence matrix for odd numbers,
OEIS [A099375](https://oeis.org/A099375):

~~~spl
1:23:2.prefixes
.collect(reverse:/1)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prefixes-A.svg)

Least excluded _m_ such that _m+a(n-1)_ is a multiple of _n_,
OEIS [A099506](https://oeis.org/A099506):

~~~spl
[1].leastExcludedSequence(185) { :a :n :m |
	let x = m + a[n - 1];
	x.divisible(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-H.svg)

Number of divisors of _2n-1_,
OEIS [A099774](https://oeis.org/A099774):

~~~spl
1:65.collect { :n |
	0.divisorSigma(2 * n - 1)
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSigma-Q.svg)

Scatter plot of the digits of _π^2/9_,
OEIS [A100044](https://oeis.org/A100044):

~~~spl
'Pi^2/9'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/pi-B.svg)

A Chebyshev transform of the Fibonacci numbers,
OEIS [A100047](https://oeis.org/A100047):

~~~spl
[1 1 -1 -1 0 -1 -1 1 1 0].repeat(9)
.discretePlot
~~~

![](sw/spl/Help/Image/repeat-A.svg)

Step plot of fifth iteration of Arshon’s sequence starting with two,
OEIS [A100336](https://oeis.org/A100336):

~~~spl
5.arshonsSequence([2])
.stepPlot
~~~

![](sw/spl/Help/Image/arshonsSequence-C.svg)

Step plot of fifth iteration of Arshon’s sequence starting with three,
OEIS [A100337](https://oeis.org/A100337):

~~~spl
5.arshonsSequence([3])
.stepPlot
~~~

![](sw/spl/Help/Image/arshonsSequence-D.svg)

If _n_ is a prime power _p^m_ then _m_ else zero,
OEIS [A100995](https://oeis.org/A100995):

~~~spl
1:150.collect { :n |
	n.isPrimePower.if {
		n.factorInteger[1][2]
	} {
		0
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/isPrimePower-B.svg)

Dirichlet inverse of the gcd-sum function,
OEIS [A101035](https://oeis.org/A101035):

~~~spl
1:115.collect(
	gcdSum:/1.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-A.svg)

Dirichlet inverse of the gcd-sum function,
OEIS [A101035](https://oeis.org/A101035):

~~~spl
2:72.collect { :n |
	n.factorInteger.collect { :f |
		let [p, e] = f;
		(e = 1).if {
			1 - (2 * p)
		} {
			(p - 1) ^ 2
		}
	}.product
}.discretePlot
~~~

![](sw/spl/Help/Image/factorInteger-K.svg)

Table of Hamming distances between binary vectors,
read by antidiagonals,
OEIS [A101080](https://oeis.org/A101080):

~~~spl
0:11.antidiagonalArray { :n :k |
	n.bitXor(k).hammingWeight
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/hammingWeight-S.svg)

Run lengths of binary representation of _n_,
OEIS [A101211](https://oeis.org/A101211):

~~~spl
1:21.collect { :n |
	let d = n.binaryExpansion;
	d.asRunArray.runs
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/asRunArray-A.svg)

For each _n_,
the index of the first occurence of the prime signature of _n_,
OEIS [A101296](https://oeis.org/A101296):

~~~spl
let ls = [];
let ln = [];
1:250.do { :n |
	let s = n.primeSignature;
	let i = ls.indexOf(s);
	(i = 0).ifTrue {
		ls.add(s);
		i := ls.size
	};
	ln.add(i)
};
ln.scatterPlot
~~~

![](sw/spl/Help/Image/primeSignature-E.svg)

A permutation of the positive integers,
OEIS [A101369](https://oeis.org/A101369):

~~~spl
let m = 2.sqrt;
1:65.collect { :n |
	n.isEven.if {
		n + (n / m - (1 / m)).floor
	} {
		1 + (n / m).floor
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sqrt-C.svg)

Given the initial terms of a permutation of the positive integers,
OEIS [A101369](https://oeis.org/A101369),
derive the partial inverse permutation,
OEIS [A101438](https://oeis.org/A101438):

~~~spl
let m = 2.sqrt;
1:85.collect { :n |
	n.isEven.if {
		n + (n / m - (1 / m)).floor
	} {
		1 + (n / m).floor
	}
}.partialInversePermutation.discretePlot
~~~

![](sw/spl/Help/Image/partialInversePermutation-A.svg)

Triangle of _¬n&k_,
also called the converse nonimplication,
OEIS [A102037](https://oeis.org/A102037):

~~~spl
0:19.triangularArray { :n :k |
	n.bitNot.bitAnd(k)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitNot-B.svg)

Number of zeroes in the Zeckendorf representation of _n_,
OEIS [A102364](https://oeis.org/A102364):

~~~spl
1:250.collect { :n |
	n.zeckendorfRepresentation
	.occurrencesOf(0)
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-H.svg)

Sloping binary numbers,
OEIS [A102370](https://oeis.org/A102370):

~~~spl
1:115.collect { :n |
	let m = n.integerLength(2);
	0:m.sum { :k |
		(n + k).bitAnd(2 ^ k)
	}
}.stepPlot
~~~

![](sw/spl/Help/Image/integerLength-D.svg)

A variant of the sloping binary numbers sequence,
organised in blocks and a permutation of the integers,
OEIS [A102370](https://oeis.org/A102370):

~~~spl
1:115.collect { :n |
	let m = n + 1 - n.integerLength(2);
	[m .. n].withIndexCollect { :j :i |
		(2 ^ (i - 1)).bitAnd(j)
	}.reduce(bitOr:/2)
}.stepPlot
~~~

![](sw/spl/Help/Image/integerLength-E.svg)

_n^2/r(n)_,
OEIS [A102631](https://oeis.org/A102631):

~~~spl
1:85.collect { :n |
	n.square / n.radical
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-I.svg)

Numerators of the unitary harmonic means,
OEIS [A103339](https://oeis.org/A103339):

~~~spl
1L:65.collect { :n |
	n.unitaryDivisors.harmonicMean
}.numerator.discretePlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-C.svg)

Denominators of the unitary harmonic means,
OEIS [A103340](https://oeis.org/A103340):

~~~spl
1L:65.collect { :n |
	n.unitaryDivisors.harmonicMean
}.denominator.discretePlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-D.svg)

Multiplicative suborder of three,
OEIS [A103489](https://oeis.org/A103489):

~~~spl
0:200.collect { :n |
	3.multiplicativeSuborder(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeSuborder-A.svg)

Multiplicative suborder of five,
OEIS [A103491](https://oeis.org/A103491):

~~~spl
0:200.collect { :n |
	5.multiplicativeSuborder(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeSuborder-B.svg)

The number of Schroeder paths of length _2n_ and having _k_ peaks at height one,
OEIS [A104219](https://oeis.org/A104219):

~~~spl
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

The number of runs of identical bits in the binary Zeckendorf representation of _n_,
OEIS [A104324](https://oeis.org/A104324):

~~~spl
1:200.collect { :n |
	n.zeckendorfRepresentation
	.split(=)
	.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-F.svg)

The number of runs of identical bits in the Dual Zeckendorf representation of _n_,
OEIS [A104325](https://oeis.org/A104325):

~~~spl
1:200.collect { :n |
	n.dualZeckendorfRepresentation
	.split(=)
	.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-F.svg)

List of powers of φ in the representation of _n_,
OEIS [A104605](https://oeis.org/A104605):

~~~spl
let phi = 1.goldenRatio;
2:27.collect { :n |
	let e = n.betaExpansion(phi, 32);
	(e[2] - e[1].indicesOf(1)).reverse
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/betaExpansion-D.svg)

Powers of phi in the representation of the integer _n_ as a sum of increasing nonconsecutive powers of the golden ratio,
OEIS [A104605](https://oeis.org/A104605):

~~~spl
OeisEntry('A104605').then { :e |
	e.bFileData
	.first(113)
	.discretePlot
}
~~~

![](sw/spl/Help/Image/goldenRatio-K.svg)

A binary array,
read by falling antidiagonals,
entries are Thue-Morse sequence at _k%2^(n+1)_,
OEIS [A104894](https://oeis.org/A104894):

~~~spl
0:15.antidiagonalArray { :n :k |
	(k % (2 ^ (n + 1)))
	.thueMorse
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/thueMorse-A.svg)

A binary array,
read by falling antidiagonals,
entries are Thue-Morse sequence at _k%2^(n+1)_,
OEIS [A104894](https://oeis.org/A104894):

~~~spl
0:15.antidiagonalArray { :n :k |
	(k % (2 ^ (n + 1)))
	.thueMorse
}.triangularArrayPlot
~~~

![](sw/spl/Help/Image/thueMorse-B.svg)

_a(2n)=-2*a(n)_ and _a(2n+1)=2*a(n)-1_,
OEIS [A104895](https://oeis.org/A104895):

~~~spl
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

The part of _n_ in base φ left of the decimal point,
interpreted as a binary integer,
OEIS [A105425](https://oeis.org/A105425):

~~~spl
let phi = 1.goldenRatio;
2:105.collect { :n |
	let e = n.betaExpansion(phi, 32);
	e[1].first(e[2]).fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/betaExpansion-E.svg)

Number of nonzero quadratic residues,
OEIS [A105612](https://oeis.org/A105612):

~~~spl
2:75.collect { :p |
	p.quadraticResidues.size
}.stepPlot
~~~

![](sw/spl/Help/Image/quadraticResidues-A.svg)

Fibonacci numbers modulo seven,
period is sixteen,
OEIS [A105870](https://oeis.org/A105870):

~~~spl
(0:35.fibonacci % 7)
.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-B.svg)

Fibonacci modulo fourteen,
period is fourty-eight,
OEIS [A105995](https://oeis.org/A105995):

~~~spl
(0:47.fibonacci % 14)
.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-M.svg)

Rowland’s sequence with _m=7_,
step plot,
OEIS [A106108](https://oeis.org/A106108):

~~~spl
7.rowlandsSequence(200)
.stepPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-A.svg)

_a(n)/n_,
where _a_ is Rowland’s sequence,
OEIS [A106108](https://oeis.org/A106108),
values are real numbers in _(2,3)_:

~~~spl
let n = 200;
let a = 7.rowlandsSequence(n);
(a / 1:n).
allButFirst(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-F.svg)

The _+1,-1_ form of the Thue-Morse sequence,
OEIS [A106400](https://oeis.org/A106400):

~~~spl
let a = 102.thueMorseSequence;
((1 - a) * 2 - 1).discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-E.svg)

_C(n-a,k/2)×(-1^a)_ where _a=(k+1)/2_,
OEIS [A108299](https://oeis.org/A108299):

~~~spl
0:13.triangularArray { :n :k |
	let a = (k + 1) // 2;
	(-1 ^ a) * binomial(n - a, k // 2)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-J.svg)

Riordan array _(1,x(1-x))_,
OEIS [A109466](https://oeis.org/A109466):

~~~spl
0:12.triangularArray { :n :k |
	(-1 ^ (n - k)) * binomial(k, n - k)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-M.svg)

Number of compositions of _n_ with _k_ parts,
OEIS [A109466](https://oeis.org/A109466):

~~~spl
0:15.triangularArray { :n :k |
	binomial(n - 1, k - 1)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-N.svg)

A variant of the semi-Fibonacci numbers,
OEIS [A109671](https://oeis.org/A109671):

~~~spl
let a = Map { :n |
	(n = 1).if {
		1
	} {
		n.isEven.if {
			a[n / 2]
		} {
			let p = a[n - 2];
			let q = a[(n - 1) / 2];
			(p - q > 0).if {
				p - q
			} {
				p + q
			}
		}
	}
};
a[1:150].scatterPlot
~~~

![](sw/spl/Help/Image/fibonacciSequence-C.svg)

Riordan array _((1-x)/(1+x),x/(1+x)^2)_,
OEIS [A110162](https://oeis.org/A110162):

~~~spl
0:11.triangularArray { :n :k |
	(n + k = 0).if {
		1
	} {
		let p = n + k;
		let q = n - k;
		let a = binomial(p, q);
		let b = binomial(p - 1, q - 1);
		(-1 ^ q) * (a + b)
	}
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-L.svg)

A self-descriptive sequence,
terms at even indices are the sequence itself,
OEIS [A110963](https://oeis.org/A110963):

~~~spl
1:100.collect { :n |
	{ :x |
		let a = x.integerExponent(2);
		let b = x.bitShiftRight(a);
		(b + 1) / 2
	}.iterate(n, 2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-B.svg)

_-1^(n-k)×L(n,k)_,
OEIS [A111596](https://oeis.org/A111596):

~~~spl
0:11.triangularArray { :n :k |
	(-1 ^ (n - k)) * lahNumber(n, k)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/lahNumber-A.svg)

Triangle read by rows,
row _n_ has terms in lazy Fibonacci representation of _n_,
OEIS [A112309](https://oeis.org/A112309):

~~~spl
0:50.collect { :n |
	let z = n.dualZeckendorfRepresentation;
	let i = z.reverse.indicesOf(1);
	(i + 1).fibonacci
}.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-D.svg)

Number of terms in lazy Fibonacci representation of _n_,
OEIS [A112310](https://oeis.org/A112310):

~~~spl
0:125.collect { :n |
	n.dualZeckendorfRepresentation
	.occurrencesOf(1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-B.svg)

Characteristic function of powerful numbers,
OEIS [A112526](https://oeis.org/A112526):

~~~spl
1:200.collect(isPowerfulNumber:/1)
.boole.discretePlot
~~~

![](sw/spl/Help/Image/isPowerfulNumber-A.svg)

Excess of _3n-1_ primes over _3n+1_ primes,
OEIS [A112632](https://oeis.org/A112632):

~~~spl
let m = 150;
let a = List(m, 1);
3:150.collect { :n |
	let x = n.prime % 6 = 1;
	a[n] := a[n - 1] + x.if { -1 } { 1 }
};
a.differences.discretePlot
~~~

![](sw/spl/Help/Image/prime-G.svg)

With _m=HeinzAscending_,
OEIS [A112798](https://oeis.org/A112798):

~~~spl
let m = 'HeinzAscending';
2:67.collect { :n |
	n.integerPartitionUnrank(m)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitionUnrank-D.svg)

A self-describing sequence made of strings of consecutive integers,
OEIS [A113138](https://oeis.org/A113138):

~~~spl
let k = 100;
let a = List(k);
let n = 0;
let m = -1;
let notice = { :v |
	n := n + 1;
	m := v;
	(n <= k).ifTrue {
		a[n] := v
	}
};
let r = 1;
{ n < k }.whileTrue {
	let x = (m = 1).if { 3 } { 1 };
	notice(x);
	1.toDo(a[r] - 1) { :j |
		notice(x + j)
	};
	r := r + 1
};
(a - 1).discretePlot
~~~

![](sw/spl/Help/Image/whileTrue-B.svg)

Least excluded _m_ that is a divisor of the previous term,
or a multiple of the previous term having at least one prime divisor coprime to it,
OEIS [A113552](https://oeis.org/A113552):

~~~spl
[1].leastExcludedSequence(59) { :a :n :m |
	let p = a[n - 1];
	p.divisible(m) | {
		m.divisible(p) & {
			m.distinctPrimeFactors
			.anySatisfy { :q |
				q.isCoprime(p)
			}
		}
	}
}.log.discretePlot
~~~

![](sw/spl/Help/Image/divisible-I.svg)

Table _n-k_,
read by upwards antidiagonals,
OEIS [A114327](https://oeis.org/A114327):

~~~spl
1:11.antidiagonalArray(-.swap)
.catenate
.discretePlot
~~~

![](sw/spl/Help/Image/antidiagonalArray-A.svg)

Triangle of coefficients of the Lucas polynomials,
OEIS [A114525](https://oeis.org/A114525):

~~~spl
0:17.collect { :n |
	n.lucasPolynomial
	.coefficientList
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/lucasPolynomial-A.svg)

Dispersion of the primes,
OEIS [A114537](https://oeis.org/A114537):

~~~spl
10.antidiagonalArray { :n :k |
	prime:/1.iterate(
		(n - 1).nonPrime,
		k - 1
	)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/nonPrime-B.svg)

_a(n+1)_ tells the number of earlier terms _a(k)_ where _a(k)+n_ is a prime,
OEIS [A114897](https://oeis.org/A114897):

~~~spl
let a:/1 = { :n |
	(n = 1).if {
		1
	} {
		let k = 1;
		let c = 0;
		{ k < n }.whileTrue {
			let m = a(k) + n - 1;
			m.isPrime.ifTrue {
				c := c + 1
			};
			k := k + 1
		};
		c
	}
}.memoize(true);
1:150.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isPrime-B.svg)

Partial sums of the Thue–Morse sequence,
OEIS [A115384](https://oeis.org/A115384):

~~~spl
35.thueMorseSequence.prefixSum.stepPlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-D.svg)

The number of partitions of _n_ such that the sum of the parts, counted without multiplicities, is equal to _k_,
OEIS [A116861](https://oeis.org/A116861):

~~~spl
1:13.triangularArray { :n :k |
	n.integerPartitions.count { :p |
		p.unique.sum = k
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/integerPartitions-G.svg)

The number of triangular numbers modulo _n_,
OEIS [A117484](https://oeis.org/A117484):

~~~spl
1:175.collect { :n |
	n.factorInteger.product { :f |
		let [p, e] = f;
		(p = 2).if {
			2 ^ e
		} {
			let q = (2 * p + 2);
			(p ^ (e + 1) // q) + 1
		}
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-J.svg)

Table of dimensions of integer partitions,
OEIS [A117506](https://oeis.org/A117506):

~~~spl
1:8.collect { :n |
	n.integerPartitions
	.collect(hookLengthFormula:/1)
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/hookLengthFormula-A.svg)

Table of dimensions of integer partitions,
OEIS [A117506](https://oeis.org/A117506):

~~~spl
1:8.collect(
	integerPartitionsDimensions:/1
).catenate.stepPlot
~~~

![](sw/spl/Help/Image/integerPartitionsDimensions-A.svg)

Balanced ternary enumeration of integers,
OEIS [A117966](https://oeis.org/A117966):

~~~spl
let k = 123;
0:k.collect { :i |
	i.integerDigits(3).collect { :n |
		(n = 2).if { -1 } { n }
	}.fromDigits(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-B.svg)

Write _n_ in balanced ternary and then replace negative ones with twos,
OEIS [A117967](https://oeis.org/A117967):

~~~spl
0:121.collect { :n |
	let m = n;
	let r = 0;
	let i = 0;
	let d = nil;
	{
		m > 0
	}.whileTrue {
		[m, d] := m.quotientRemainder(3);
		(d = 2).ifTrue {
			m := m + 1
		};
		r := r + (d * (3 ^ i));
		i := i + 1
	};
	r
}.scatterPlot
~~~

![](sw/spl/Help/Image/quotientRemainder-D.svg)

Matrix plot of Reverend Back’s abbey floor,
the table indices _i_ are given by
OEIS [A118006](https://oeis.org/A118006):

~~~spl
let i = { :x |
	x ++ x ++ x.reverse
}.iterate([0 1], 2);
{ :x :y |
	(x + y) % 2
}.table(i, i).matrixPlot
~~~

![](sw/spl/Help/Image/iterate-A.svg)

Iterate _w⧺w⧺ᴙ(w)_,
initially _0,1_,
OEIS [A118006](https://oeis.org/A118006):

~~~spl
{ :w |
	w ++ w ++ w.reverse
}.iterate([0 1], 3).discretePlot
~~~

![](sw/spl/Help/Image/iterate-F.svg)

Signature sequence of φ²,
OEIS [A118276](https://oeis.org/A118276):

~~~spl
1.goldenRatio.square
.signatureSequence(200)
.scatterPlot
~~~

![](sw/spl/Help/Image/signatureSequence-A.svg)

The degree of the classical modular polynomial,
OEIS [A118778](https://oeis.org/A118778):

~~~spl
1:250.collect { :n |
	let s = 0;
	n.divisors.do { :a |
		(a.square > n).ifTrue {
			let b = gcd(a, n / a);
			let c = eulerPhi(b) / b;
			s := s + (2 * a * c)
		}
	};
	n.sqrt.isInteger.ifTrue {
		s := s + eulerPhi(n.sqrt)
	};
	s
}.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhi-F.svg)

Number of missing residues in Fibonacci sequence modulo _n_,
OEIS [A118965](https://oeis.org/A118965):

~~~spl
1:85.collect { :m |
	let k = m.pisanoPeriod;
	[0 .. m - 1].complement(
		(k.fibonacciSequence % m)
		.unique
	).size
}.discretePlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-F.svg)

Triangle read by rows,
_gcd(k,⌈(n/k))_,
OEIS [A120889](https://oeis.org/A120889),
minus one:

~~~spl
let a = 1:13.triangularArray { :n :k |
	k.gcd((n / k).ceiling)
};
(a.catenate - 1).discretePlot
~~~

![](sw/spl/Help/Image/gcd-P.svg)

A sequence describing the position of its prime terms,
OEIS [A121053](https://oeis.org/A121053):

~~~spl
1:150.collect { :n |
	(n < 5).if {
		[2 3 5 1].at(n)
	} {
		let m = n.primePi;
		(
			n.isPrime | {
				(n + m).isEven
			}
		).if {
			((n + m) / 2).floor.prime
		} {
			(n + 1).isPrime.if {
				n + 2
			} {
				n + 1
			}
		}
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-H.svg)

Sums of primitive roots of _n_
OEIS [A121380](https://oeis.org/A121380):

~~~spl
1:65.collect { :n |
	n.primitiveRootList.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/primitiveRootList-B.svg)

Take odd digits of _n_ with negative sign,
OEIS [A121758](https://oeis.org/A121758):

~~~spl
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

~~~spl
1:69.collect { :n |
	n.integerDigits
	.reverse
	.withIndexCollect { :x :i |
		(-1 ^ (x + 1)) * x * (10 ^ (i - 1))
	}.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/withIndexCollect-B.svg)

Self-inverse permutation of the positive integers,
OEIS [A122111](https://oeis.org/A122111):

~~~spl
1:275.collect { :n |
	let p = n.factorInteger.collect { :f |
		List(f[2], f[1].primePi)
	}.catenate;
	let m = p.max;
	1:m.product { :i |
		p.sum { :j |
			(j >= i).boole
		}.prime
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-P.svg)

List of twin primes modulo four,
OEIS [A122567](https://oeis.org/A122567):

~~~spl
let a = 3:1019.select(
	isLesserTwinPrime:/1
);
let b = [a, a + 2].interleave;
let c = b.deleteDuplicates;
(c % 4).stepPlot
~~~

![](sw/spl/Help/Image/isLesserTwinPrime-C.svg)

Number of zeroes at the end of _n_ when written in base ten,
OEIS [A122840](https://oeis.org/A122840):

~~~spl
1:200.integerExponent(10).discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-C.svg)

Interleave _n+7_ and _13-n_,
OEIS [A122874](https://oeis.org/A122874):

~~~spl
let n = 0:32;
[n + 7, 13 - n].interleave.discretePlot
~~~

![](sw/spl/Help/Image/interleave-F.svg)

Inverse Möbius transform of periodic _1,-1,-3,1,-1,3,1,-1,0_,
OEIS [A123477](https://oeis.org/A123477):

~~~spl
[1 -1 -3 1 -1 3 1 -1 0]
.repeat(12)
.inverseMoebiusTransform
.discretePlot
~~~

![](sw/spl/Help/Image/inverseMoebiusTransform-A.svg)

A direct form for the offset Kolakoski sequence,
with an additional two leading terms,
OEIS [A123594](https://oeis.org/A123594):

~~~spl
let a = [1 1 0];
let i = 3;
{
	i <= 57
}.whileTrue {
	let t = a[i];
	let e = a.last;
	(t = 0).if {
		a.add(1 - e)
	} {
		a.add(e);
		a.add(1 - e)
	};
	i := i + 1
};
a.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-C.svg)

Alternating sums of integer compositions in reverse lexicographic order,
OEIS [A124754](https://oeis.org/A124754):

~~~spl
1:7.collect { :n |
	n.integerCompositions
	.reverseLexicographicSort
	.collect(alternatingSum:/1)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/reverseLexicographicSort-B.svg)

Inverse binomial sum of compositions in standard order,
OEIS [A124756](https://oeis.org/A124756):

~~~spl
1:7.collect { :n |
	n.integerCompositions
	.reverseLexicographicSort
	.collect { :c |
		c.inverseBinomialTransform.last
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/reverseLexicographicSort-C.svg)

Table of exponents of prime factorizations in
OEIS [A025487](https://oeis.org/A025487),
OEIS [A124832](https://oeis.org/A124832):

~~~spl
OeisEntry('A025487').then { :e |
	e.bFileData
	.first(150)
	.collect(primeExponents:/1)
	.catenate
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/primeExponents-A.svg)

The inverse binomial transform of the rabbit sequence,
OEIS [A124841](https://oeis.org/A124841):

~~~spl
(1 - 1:65.fibonacciWord)
.inverseBinomialTransform
.logScale
.discretePlot
~~~

![](sw/spl/Help/Image/inverseBinomialTransform-C.svg)

Primorial inflation of the prime shadow of _n_,
OEIS [A124859](https://oeis.org/A124859):

~~~spl
{ :n |
	(n = 1).if {
		1
	} {
		factorInteger(n).product { :x |
			let i = x[1].primePi + 1;
			i.prime ^ x[2]
		}
	}
}.map(1:50).scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-B.svg)

Enumeration of partitions by binary representation,
OEIS [A125106](https://oeis.org/A125106):

~~~spl
1:43.collect { :n |
	let d = n.integerDigits(2);
	let x = d.reverse.indicesOf(1);
	let m = x.size;
	(x - 1:m + 1).reverse
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/integerDigits-S.svg)

The smallest non-negative integer not already in the sequence such that _a(n-1)_ is congruent to _a(n)%n_,
OEIS [A125717](https://oeis.org/A125717):

~~~spl
let l = [0];
1:200.do { :n |
	let k = l.last.mod(n);
	{ l.includes(k) }.whileTrue {
		k := k + n
	};
	l.add(k)
};
l.scatterPlot
~~~

![](sw/spl/Help/Image/mod-O.svg)

The Vedic square where _n=9_,
OEIS [A125959](https://oeis.org/A125959):

~~~spl
9.vedicSquare.catenate.discretePlot
~~~

![](sw/spl/Help/Image/vedicSquare-D.svg)

Triangle read by rows,
_k_ if _k_ is a divisor of _n_ else zero,
OEIS [A127093](https://oeis.org/A127093):

~~~spl
1:14.triangularArray { :n :k |
	k * n.divisible(k).boole
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/boole-B.svg)

Triangle read by rows,
_n/k_ if _k_ is a divisor of _n_ else zero,
OEIS [A127093](https://oeis.org/A127093):

~~~spl
1:14.triangularArray { :n :k |
	n.divisible(k).if { n / k } { 0 }
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/divide-B.svg)

Cumulant expansion numbers,
OEIS [A127671](https://oeis.org/A127671):

~~~spl
let c = { :p |
	let s = p.unique;
	let k = p.size;
	let j = k - 1;
	let h = s.product { :x |
		p.occurrencesOf(x).!
	};
	let q = p.!.product * h;
	p.sum.! * j.! * (-1 ^ j) / q
};
1:11.collect { :n |
	n.integerPartitions.collect(c:/1)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/product-C.svg)

Monic integer version of Chebyshev T-polynomials,
OEIS [A127672](https://oeis.org/A127672):

~~~spl
0:19.collect { :n |
	let p = n.chebyshevT;
	let c = p.coefficientList;
	(c * 2) / (2 ^ 0:n)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/chebyshevT-F.svg)

Numbers sorted by their Collatz stopping time,
OEIS [A127824](https://oeis.org/A127824):

~~~spl
let s = [1];
let t = 1:15.collect { :unused |
	let u = s.select { :x |
		x % 3 = 1 & {
			let y = (x - 1) / 3;
			y.isOdd & {
				y > 1
			}
		}
	} - 1 / 3;
	s := ((2 * s) ++ u).nub.sort;
	s
};
([1] ++ t.catenate).log.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-D.svg)

Triangle where _(n,n)=n_, _(n,n-1)=-(n-1)_ else zero,
OEIS [A128064](https://oeis.org/A128064):

~~~spl
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

Number of distinct prime factors _p_ of _n_ such that _p^p_ is a divisor of _n_,
OEIS [A129251](https://oeis.org/A129251):

~~~spl
2:115.collect { :n |
	n.distinctPrimeFactors.count { :p |
		n.divisible(p ^ p)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/distinctPrimeFactors-C.svg)

Involution of nonnegative integers induced by the conjugation of the encoded partition,
OEIS [A129594](https://oeis.org/A129594):

~~~spl
let m = 'Karttunen';
0:255.collect { :n |
	n.integerPartitionUnrank(m)
	.conjugatePartition
	.integerPartitionRank(m)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitionUnrank-A.svg)

Involution of nonnegative integers induced by the conjugation of the encoded partition,
block _256:511_,
OEIS [A129594](https://oeis.org/A129594):

~~~spl
let m = 'Karttunen';
256:511.collect { :n |
	n.integerPartitionUnrank(m)
	.conjugatePartition
	.integerPartitionRank(m)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitionUnrank-B.svg)

Bitwise and of _n-1_ and _n_,
OEIS [A129760](https://oeis.org/A129760):

~~~spl
let n = 1:100;
n.bitAnd(n - 1).linePlot
~~~

![](sw/spl/Help/Image/bitAnd-A.svg)

Prefix sum of _n%9_,
OEIS [A130487](https://oeis.org/A130487):

~~~spl
(0:44 % 9).prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/mod-S.svg)

_-1^(n+k)*C(n,k)_,
lower triangular matrix which is inverse to Pascal’s triangle,
OEIS [A130595](https://oeis.org/A130595):

~~~spl
0:11.triangularArray { :n :k |
	(-1 ^ (n + k)) * binomial(n, k)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-K.svg)

A self-referential sequence related to Mancala solitaire,
OEIS [A130747](https://oeis.org/A130747):

~~~spl
let m = 150;
let a = [
	[1 .. 2 * m],
	List(2 * m, 0)
].interleave;
1:m.do { :n |
	let i = a.indicesOf(0);
	let j = a[n];
	let h = i[j];
	a[h] := a[n]
};
a.first(m).scatterPlot
~~~

![](sw/spl/Help/Image/indicesOf-B.svg)

Anti-divisors of _n_,
OEIS [A130799](https://oeis.org/A130799):

~~~spl
3:50.antiDivisors.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/antiDivisors-A.svg)

_a(n)=2^a(n-1)_ modulo _n_,
OEIS [A131644](https://oeis.org/A131644):

~~~spl
let s = 0;
2:85.collect { :n |
	s := 2.powerMod(s, n)
}.discretePlot
~~~

![](sw/spl/Help/Image/powerMod-J.svg)

Numbers whose ternary representation begins with one,
OEIS [A132141](https://oeis.org/A132141):

~~~spl
0:115.select { :n |
	n.ternaryExpansion[1] = 1
}.discretePlot
~~~

![](sw/spl/Help/Image/ternaryExpansion-D.svg)

Number of distinct primes among the squares modulo _n_,
OEIS [A132213](https://oeis.org/A132213):

~~~spl
1:200.collect { :n |
	1:n.powerMod(2, n)
	.unique
	.count(isPrime:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-I.svg)

Quotients of eight,
OEIS [A132292](https://oeis.org/A132292):

~~~spl
1:50.functionPlot { :n |
	n.quotient(8)
}
~~~

![](sw/spl/Help/Image/quotient-A.svg)

Infinitesimal Pascal matrix,
OEIS [A132440](https://oeis.org/A132440):

~~~spl
0:15.collect { :n |
	[n 0].padLeft([n + 1], 0)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/padLeft-B.svg)

Largest divisor of _n_ having the form _2^i×5^j_,
OEIS [A132741](https://oeis.org/A132741):

~~~spl
1:65.collect { :n |
	[2 5].product { :b |
		b ^ n.integerExponent(b)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-Q.svg)

The infinitesimal Lah matrix,
OEIS [A132792](https://oeis.org/A132792):

~~~spl
0:15.collect { :n |
	[n * (n - 1), 0].padLeft([n + 1], 0)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/padLeft-C.svg)

Largest integer _m_ such that _n-m^2_ is a square,
or zero if no such _m_ exists,
OEIS [A133388](https://oeis.org/A133388):

~~~spl
1:100.collect { :n |
	let m = 0;
	let x = 0;
	{ :break:/0 |
		let d = n - m.square;
		(d < 0).if {
			break()
		} {
			let s = d.sqrt;
			s.isInteger.ifTrue {
				x := s;
				break()
			}
		};
		m := m + 1
	}.repeatForeverWithBreak;
	x
}.discretePlot
~~~

![](sw/spl/Help/Image/isInteger-A.svg)

_C(n+10,n)%10_,
OEIS [A133890](https://oeis.org/A133890):

~~~spl
0:115.collect { :n |
	(n + 10).binomial(n) % 10
}.discretePlot
~~~

![](sw/spl/Help/Image/binomial-T.svg)

Antidiagonal array of polygonal numbers,
OEIS [A134394](https://oeis.org/A134394):

~~~spl
17.antidiagonalArray { :i :j |
	(i + 1).polygonalNumber(j)
}.++.scatterPlot
~~~

![](sw/spl/Help/Image/polygonalNumber-C.svg)

_a(n)_ is the smallest integer _m_ not equal to _n_ such that _n=(⌊(n²/m)+m)/2_,
OEIS [A134986](https://oeis.org/A134986):

~~~spl
1:65.collect { :n |
	1:Infinity.detect { :m |
		m != n & {
			let o = n.square / m;
			n = ((o.floor + m) / 2)
		}
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/square-C.svg)

Log scatter plot of a sequence by K. Matylla,
OEIS [A135141](https://oeis.org/A135141):

~~~spl
let a = { :n |
	(n = 1).if {
		1
	} {
		n.isPrime.if {
			2 * a(n.primePi)
		} {
			2 * a(n - 1 - n.primePi) + 1
		}
	}
};
1:200.collect(a:/1).log.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-D.svg)

A permutation of the positive integers,
_a(P(n))=2*a(n)_ and _a(C(n))=2*a(n)+1_,
OEIS [A135141](https://oeis.org/A135141):

~~~spl
let a = Map { :n |
	(n = 1).if {
		1
	} {
		n.isPrime.if {
			2 * a[n.primePi]
		} {
			let m = n - 1 - n.primePi;
			2 * a[m] + 1
		}
	}
};
a[1:85].discretePlot
~~~

![](sw/spl/Help/Image/primePi-S.svg)

Least string of digits that,
when cycled,
each pair of digits can be seen exactly once,
OEIS [A135472](https://oeis.org/A135472):

~~~spl
[
	0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9
	1 1 2 1 3 1 4 1 5 1 6 1 7 1 8 1 9
	2 2 3 2 4 2 5 2 6 2 7 2 8 2 9
	3 3 4 3 5 3 6 3 7 3 8 3 9
	4 4 5 4 6 4 7 4 8 4 9
	5 5 6 5 7 5 8 5 9
	6 6 7 6 8 6 9
	7 7 8 7 9
	8 8 9
	9
].stepPlot
~~~

![](sw/spl/Help/Image/partition-A.svg)

Delayed divison of the Cloitre sequence,
OEIS [A135506](https://oeis.org/A135506):

~~~spl
1L.rowlandsSequence(150, lcm:/2)
.adjacentPairsCollect(/.swap)
.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-G.svg)

Number of trailing equal digits in binary representation of _n_,
OEIS [A136480](https://oeis.org/A136480):

~~~spl
0:65.collect { :n |
	n.binaryExpansion.split(=).last.size
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-F.svg)

Omit the ones from Rowland’s sequence,
OEIS [A137613](https://oeis.org/A137613):

~~~spl
OeisEntry('A137613').then { :e |
	e.bFileData
	.first(250)
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/rowlandsSequence-B.svg)

Number of distinct residues in Fibonacci sequence modulo _p(n)_,
OEIS [A137750](https://oeis.org/A137750):

~~~spl
1:85.prime.collect { :m |
	let k = m.pisanoPeriod;
	(k.fibonacciSequence % m)
	.unique.size
}.discretePlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-G.svg)

Number of divisors _d_ of _n_ such that _d+1_ is not a divisor of _n_,
OEIS [A137921](https://oeis.org/A137921):

~~~spl
1:105.collect { :n |
	divisorSum(n) { :m |
		boole(divisible(n, m + 1).not)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-B.svg)

The toothpick sequence,
OEIS [A139250](https://oeis.org/A139250):

~~~spl
200.toothpickSequence.scatterPlot
~~~

![](sw/spl/Help/Image/toothpickSequence-A.svg)

First differences of toothpicks numbers,
OEIS [A139251](https://oeis.org/A139251):

~~~spl
85.toothpickSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/toothpickSequence-B.svg)

First differences of toothpicks numbers,
further terms,
OEIS [A139251](https://oeis.org/A139251):

~~~spl
250.toothpickSequence
.differences
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/toothpickSequence-C.svg)

Next odd term in Collatz trajectory with starting value _n_,
OEIS [A139391](https://oeis.org/A139391):

~~~spl
2:250.collect { :n |
	n.collatzSequence
	.allButFirst
	.detect(isOdd:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-N.svg)

Array where differences in rows are _n…1_,
OEIS [A141419](https://oeis.org/A141419):

~~~spl
1:13.triangularArray { :n :m |
	m * ((2 * n) - m + 1) / 2
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-E.svg)

Least _k>0_ such that _(2n-1)k_ is a palindrome in base two,
OEIS [A141707](https://oeis.org/A141707):

~~~spl
1:250.collect { :n |
	let k = 1;
	let m = 2 * n - 1;
	{
		(k * m)
		.binaryExpansion
		.isPalindrome
	}.whileFalse {
		k := k + 1
	};
	k
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/isPalindrome-C.svg)

Scatter plot of the
least number _k<n_ and coprime to _n_ such that the largest term of the continued fraction of _k/n_ is as small as possible,
OEIS [A141821](https://oeis.org/A141821):

~~~spl
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

The least maxima of
the least number _k<n_ and coprime to _n_ such that the largest term of the continued fraction of _k/n_ is as small as possible,
OEIS [A141822](https://oeis.org/A141822):

~~~spl
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

Logical convolution,
OEIS [A142149](https://oeis.org/A142149):

~~~spl
0:200.collect { :n |
	n.isOdd.if {
		n
	} {
		n.bitXor(n / 2)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/bitXor-R.svg)

The nonnegative integers interleaved with zeroes,
OEIS [A142150](https://oeis.org/A142150):

~~~spl
0:50.riffle(0).discretePlot
~~~

![](sw/spl/Help/Image/riffle-A.svg)

Logical convolution,
first _2^6_ terms,
OEIS [A142151](https://oeis.org/A142151):

~~~spl
0:63.collect { :n |
	let k = (n + 1).bitLength;
	n + n.bitNor(n + 1, k)
}.discretePlot
~~~

![](sw/spl/Help/Image/bitNor-A.svg)

Logical convolution,
first _2^7_ terms,
OEIS [A142151](https://oeis.org/A142151):

~~~spl
0:127.collect { :n |
	let k = (n + 1).bitLength;
	n + n.bitNor(n + 1, k)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitNor-B.svg)

Also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_,
OEIS [A143305](https://oeis.org/A143305):

~~~spl
1.vanDerCorputsConstant(104)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/vanDerCorputsConstant-A.svg)

Triangle where row _n_ is `one` if _n_ is prime,
`zero` otherwise,
OEIS [A143536](https://oeis.org/A143536):

~~~spl
1:13.triangularArray { :n :k |
	n.isPrime.boole
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/isPrime-J.svg)

Triangle where row _n_ is `one` if _n_ is prime,
`zero` otherwise,
OEIS [A143536](https://oeis.org/A143536):

~~~spl
1:13.triangularArray { :n :k |
	n.isPrime.boole
}.triangularArrayPlot
~~~

![](sw/spl/Help/Image/isPrime-K.svg)

Adjacent terms of the Fibonacci word interpreted as binary values,
OEIS [A143667](https://oeis.org/A143667):

~~~spl
1:115.fibonacciWord
.partition(2, 2)
.collect { :d |
	d.fromDigits(2)
}.discretePlot
~~~

![](sw/spl/Help/Image/fibonacciWord-D.svg)

Direct calculation of terms of the Fibonacci word,
OEIS [A143667](https://oeis.org/A143667):

~~~spl
let a = 1 / 1.goldenRatio;
1:57.collect { :n |
	let m = 2 * n;
	3 - (
		(a * m).floor
		-
		(2 * (a * (m - 1)).floor)
		+
		(a * (m + 1)).floor
	)
}.discretePlot
~~~

![](sw/spl/Help/Image/fibonacciWord-E.svg)

_gcd(k+n/k)_, where _k_ is over all divisors of _n_,
OEIS [A143771](https://oeis.org/A143771):

~~~spl
1:85.collect { :n |
	n.divisors.collect { :d |
		d + (n / d)
	}.gcd
}.discretePlot
~~~

![](sw/spl/Help/Image/gcd-O.svg)

Weight array of the natural numbers,
OEIS [A144112](https://oeis.org/A144112):

~~~spl
0:15.collect { :n |
	[n].padRight([n], 1) ++ [n + 1]
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/padRight-A.svg)

Shadow transform of _C(n+7,8)_,
OEIS [A144869](https://oeis.org/A144869):

~~~spl
0:125.collect { :n |
	binomial(n + 7, 8)
}.shadowTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/shadowTransform-C.svg)

The bitwise _Xor_ of the squares of first _n_ natural numbers,
OEIS [A145768](https://oeis.org/A145768):

~~~spl
bitXor:/2
.foldList(0, 0:125 ^ 2)
.allButFirst
.discretePlot
~~~

![](sw/spl/Help/Image/bitXor-J.svg)

Number of on cells at _n_-th stage in the Ulam-Warburton two-dimensional cellular automaton,
OEIS [A147562](https://oeis.org/A147562):

~~~spl
let a = 1:150.digitCount(2, 1);
let b = [0 1] ++ (4 * (3 ^ (a - 1)));
b.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/prefixSum-H.svg)

_3^(w(n-1)-1)_,
OEIS [A147610](https://oeis.org/A147610):

~~~spl
let n = 2:85;
let w = (n - 1).hammingWeight;
let a = 3 ^ (w - 1);
a.discretePlot
~~~

![](sw/spl/Help/Image/hammingWeight-O.svg)

Groups of order _2n_ that have _Z/nZ_ as a subgroup,
OEIS [A147848](https://oeis.org/A147848):

~~~spl
1:85.collect { :n |
	1:n.sum { :k |
		(n % k = 0).if {
			1:2.sum { :j |
				(gcd(k, n / k) = j).if {
					j
				} {
					0
				}
			}
		} {
			0
		}
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/gcd-F.svg)

The next prime function,
OEIS [A151800](https://oeis.org/A151800):

~~~spl
0:50.functionPlot(nextPrime:/1)
~~~

![](sw/spl/Help/Image/nextPrime-A.svg)

Partial sums of _3^(w(n-1)-1)_,
OEIS [A151920](https://oeis.org/A151920):

~~~spl
let n = 2:85;
let w = (n - 1).hammingWeight;
let a = 3 ^ (w - 1);
a.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-P.svg)

Number of first-quadrant cells that are on after _n_-th stage of the Holladay-Ulam cellular automaton,
OEIS [A151922](https://oeis.org/A151922),
essentially also
OEIS [A151920](https://oeis.org/A151920):

~~~spl
let n = 1:85;
let w = n.digitCount(2, 1);
let a = 3 ^ (w - 1) + 1;
([1] ++ a).prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-O.svg)

First differences of Gould’s sequence,
OEIS [A151930](https://oeis.org/A151930):

~~~spl
63.gouldsSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/gouldsSequence-C.svg)

Kaprekar map,
_b=10_,
discrete plot,
OEIS [A151949](https://oeis.org/A151949):

~~~spl
0:99.collect(kaprekarMap:/1).discretePlot
~~~

![](sw/spl/Help/Image/kaprekarMap-A.svg)

Kaprekar map,
_b=10_,
scatter plot,
OEIS [A151949](https://oeis.org/A151949):

~~~spl
0:250.collect(kaprekarMap:/1).scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-B.svg)

Some later terms of the _b=10_ map,
divided by nine,
OEIS [A151950](https://oeis.org/A151950):

~~~spl
(1600:1900.collect(kaprekarMap:/1) / 9)
.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-L.svg)

Prefix sum of aliquot sums,
OEIS [A153485](https://oeis.org/A153485):

~~~spl
1:65.aliquotSum.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/aliquotSum-F.svg)

Non-zero coefficients of the Swiss-Knife polynomials,
OEIS [A153641](https://oeis.org/A153641):

~~~spl
0:16.collect { :n |
	let m = n // 2;
	0:m.collect { :k |
		binomial(n, 2 * k)
		*
		(2 * k).eulerNumber
	}
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/eulerNumber-B.svg)

The inverse Moebius transform of the Fredholm-Rueppel sequence,
OEIS [A154402](https://oeis.org/A154402):

~~~spl
1:65.collect { :n |
	n.divisorSum { :d |
		(d + 1).log2.isInteger.boole
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSum-E.svg)

The number of ways to express _n_ as the sum of an odd prime, a positive Fibonacci number and twice a positive Fibonacci number,
OEIS [A155114](https://oeis.org/A155114):

~~~spl
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

Product of indices of distinct prime factors of _n_,
OEIS [A156061](https://oeis.org/A156061):

~~~spl
2:85.collect { :n |
	n.distinctPrimeFactors
	.primePi
	.product
}.discretePlot
~~~

![](sw/spl/Help/Image/primePi-M.svg)

Count ones in the Kolakoski sequence,
OEIS [A156077](https://oeis.org/A156077):

~~~spl
let n = 65;
let a = n.kolakoskiSequence.prefixSum;
((2 * 1:n) - a).stepPlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-G.svg)

Unary-encoded compressed factorization of natural numbers,
OEIS [A156552](https://oeis.org/A156552):

~~~spl
(2 .. 150).collect { :n |
	n.primeFactors
	.withIndexCollect { :p :i |
		let a = 1L << (p.primePi - 1);
		a << (i - 1)
	}.sum
}.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-B.svg)

Infinite Fibonacci word fractal sequence,
OEIS [A156596](https://oeis.org/A156596):

~~~spl
let m = [0: [1 2], 1: [1 0], 2: [0 2]];
1:95.collect(fibonacciWord:/1)
.partition(2, 2)
.collect { :d |
	m[d.fromDigits(2)]
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/fibonacciWord-F.svg)

Prefixes of the odd numbers,
OEIS [A158405](https://oeis.org/A158405):

~~~spl
1:23:2.prefixes.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prefixes-C.svg)

Numbers having at least two zeroes in their binary representation,
OEIS [A158582](https://oeis.org/A158582):

~~~spl
0:85.select { :n |
	n.digitCount(2, 0) > 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-K.svg)

_L(2)_ applied to each row of Pascal’s triangle,
OEIS [A160019](https://oeis.org/A160019):

~~~spl
17.pascalTriangle.collect { :x |
	x.lodumoTransform(2)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/lodumoTransform-A.svg)

_L(2)_ of Kolakoski sequence,
OEIS [A160051](https://oeis.org/A160051):

~~~spl
65.kolakoskiSequence
.lodumoTransform(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/lodumoTransform-B.svg)

_L(5)_ of Fibonacci sequence,
OEIS [A160081](https://oeis.org/A160081):

~~~spl
65.fibonacciSequence
.lodumoTransform(5)
.scatterPlot
~~~

![](sw/spl/Help/Image/lodumoTransform-C.svg)

T-toothpick sequence,
OEIS [A160172](https://oeis.org/A160172):

~~~spl
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

Sign of first differences of Recamán’s sequence,
OEIS [A160357](https://oeis.org/A160357):

~~~spl
100.recamanSequence
.differences
.sign
.discretePlot
~~~

![](sw/spl/Help/Image/recamanSequence-E.svg)

Nim-square-root,
OEIS [A160679](https://oeis.org/A160679):

~~~spl
0:127.nimSquareRoot.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-Z.svg)

The Kaprekar binary numbers in decimal,
OEIS [A160761](https://oeis.org/A160761):

~~~spl
0:100.collect { :n |
	n.kaprekarSequence(2).last
}.without(0).stepPlot
~~~

![](sw/spl/Help/Image/kaprekarSequence-B.svg)

The least not occurring integer such that partial sum,
written in binary,
contains binary _n_ as a substring,
OEIS [A160855](https://oeis.org/A160855):

~~~spl
let m = 250;
let a = [];
let k = 1;
1.toDo(m) { :n |
	let k = 1;
	{
		a.includes(k) | {
			let p = a.sum + k;
			let q = p.integerDigits(2);
			let r = n.integerDigits(2);
			let s = q.sequencePosition(r);
			s = []
		}
	}.whileTrue {
		k := k + 1
	};
	a.add(k)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-D.svg)

_J(3,n)/J(1,n)_,
OEIS [A160889](https://oeis.org/A160889):

~~~spl
let n = 1:115;
let a = 3.jordanTotient(n);
let b = 1.jordanTotient(n);
(a / b).scatterPlot
~~~

![](sw/spl/Help/Image/jordanTotient-D.svg)

Table of the fundamental Pisano period of the Fibonacci sequence modulo _n_,
OEIS [A161553](https://oeis.org/A161553):

~~~spl
1:13.collect { :m |
	let k = m.pisanoPeriod;
	k.fibonacciSequence % m
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-E.svg)

_R(Π(R(F(n))))_,
OEIS [A161594](https://oeis.org/A161594):

~~~spl
1:250.collect { :n |
	n.primeFactors
	.product(integerReverse:/1)
	.integerReverse
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-C.svg)

Array read by rows in which row _n_ lists the divisors of _n_ that are _≥√n_,
OEIS [A161908](https://oeis.org/A161908):

~~~spl
1:100.collect { :n |
	n.divisors.select { :m |
		m >= n.sqrt
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/divisors-D.svg)

Ordinal transform of
OEIS [A265332](https://oeis.org/A265332),
which is
OEIS [A051135](https://oeis.org/A051135)
with the first place set to `one`,
OEIS [A162598](https://oeis.org/A162598):

~~~spl
let a = 'A051135'.oeisTerms(200);
a[1] := 1;
a.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/oeisTerms-B.svg)

Write _n_ in binary and count zeroes between ones and also the edge,
OEIS [A163510](https://oeis.org/A163510):

~~~spl
1:37.collect { :n |
	let d = n.integerDigits(2);
	let p = d.riffle(0) ++ [0];
	p.split(=).reject { :x |
		x[1] = 1
	}.collect { :x |
		((x.size - 1) / 2).ceiling
	}.reverse
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/riffle-B.svg)

A permutation of the positive integers,
OEIS [A163511](https://oeis.org/A163511):

~~~spl
let f:/1 = 'A003961'.oeisFunction;
let a = Map { :n |
	(n <= 1).if {
		n + 1
	} {
		n.isEven.if {
			2 * a[n / 2]
		} {
			f(a[n - 1 / 2])
		}
	}
};
a[0:250].log.scatterPlot
~~~

![](sw/spl/Help/Image/isEven-G.svg)

Bitwise or of _n_ and _2n_,
OEIS [A163617](https://oeis.org/A163617):

~~~spl
let n = 0:63;
n.bitOr(2 * n).discretePlot
~~~

![](sw/spl/Help/Image/bitOr-B.svg)

The _n_-th derivative of the logistic function,
OEIS [A163626](https://oeis.org/A163626):

~~~spl
0:17.triangularArray { :n :k |
	(-1 ^ k)
	*
	k.!
	*
	(n + 1).stirlingS2(k + 1)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/stirlingS2-D.svg)

Repeat string twice and remove last symbol,
initially _0,1_,
OEIS [A164349](https://oeis.org/A164349):

~~~spl
{ :x |
	(x ++ x).allButLast
}.iterate([0 1], 7).discretePlot
~~~

![](sw/spl/Help/Image/iterate-B.svg)

Kaprekar map,
_b=2_,
scatter plot,
OEIS [A164884](https://oeis.org/A164884):

~~~spl
0:250.collect { :n |
	n.kaprekarMap(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-C.svg)

Length of preperiodic part of trajectory of _n_ under iteration of the base-two Kaprekar map,
OEIS [A164885](https://oeis.org/A164885),
one less than
OEIS [A164886](https://oeis.org/A164886):

~~~spl
0:85.collect { :n |
	{ :x |
		x.kaprekarMap(2)
	}.fixedPointList(n, =).size - 2
}.discretePlot
~~~

![](sw/spl/Help/Image/kaprekarMap-K.svg)

Kaprekar map,
_b=3_,
scatter plot,
OEIS [A164993](https://oeis.org/A164993):

~~~spl
0:250.collect { :n |
	n.kaprekarMap(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-D.svg)

Kaprekar map,
_b=4_,
scatter plot,
OEIS [A165012](https://oeis.org/A165012):

~~~spl
0:250.collect { :n |
	n.kaprekarMap(4)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-E.svg)

Kaprekar map,
_b=5_,
scatter plot,
OEIS [A165032](https://oeis.org/A165032):

~~~spl
0:250.collect { :n |
	n.kaprekarMap(5)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-F.svg)

Kaprekar map,
_b=6_,
scatter plot,
OEIS [A165051](https://oeis.org/A165051):

~~~spl
0:250.collect { :n |
	n.kaprekarMap(6)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-G.svg)

Kaprekar map,
_b=7_,
scatter plot,
OEIS [A165071](https://oeis.org/A165071):

~~~spl
0:250.collect { :n |
	n.kaprekarMap(7)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-H.svg)

Kaprekar map,
_b=8_,
scatter plot,
OEIS [A165090](https://oeis.org/A165090):

~~~spl
0:250.collect { :n |
	n.kaprekarMap(8)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-I.svg)

Kaprekar map,
_b=9_,
scatter plot,
OEIS [A165110](https://oeis.org/A165110):

~~~spl
0:250.collect { :n |
	n.kaprekarMap(9)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-J.svg)

Characteristic function of numbers that are not multiples of four,
OEIS [A166486](https://oeis.org/A166486):

~~~spl
(0:44 % 4).sign.discretePlot
~~~

![](sw/spl/Help/Image/sign-C.svg)

Partial sums of Sierpinski’s sieve,
scatter plot,
OEIS [A166556](https://oeis.org/A166556):

~~~spl
(0 .. 21).triangularArray { :n :k |
	(k .. n).sum { :j |
		binomial(j, k) % 2
	}
}.++.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-C.svg)

A permutation of the integers,
two positives then one negative,
OEIS [A166711](https://oeis.org/A166711):

~~~spl
[0 0 2 0 0 -1].linearRecurrence(
	[0 1 2 -1 3 4], 85
).discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-L.svg)

A permutation of the integers,
three positives then two negatives,
OEIS [A166871](https://oeis.org/A166871):

~~~spl
[0 0 0 0 2 0 0 0 0 -1].linearRecurrence(
	[0 1 2 3 -1 -2 4 5 6 -3], 85
).discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-M.svg)

Product of run lengths in binary representation,
OEIS [A167489](https://oeis.org/A167489):

~~~spl
0:250.collect { :n |
	n.integerDigits(2)
	.split(=)
	.collect(size:/1)
	.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-H.svg)

Characteristic function of numbers that are not multiples of ten,
OEIS [A168184](https://oeis.org/A168184):

~~~spl
([1 9] # [0 1]).repeat(5).discretePlot
~~~

![](sw/spl/Help/Image/repeat-D.svg)

The amusical permutation applied twice,
OEIS [A168221](https://oeis.org/A168221):

~~~spl
0:65.amusicalPermutation.amusicalPermutation
.discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-G.svg)

Sequence starting at three instead of two,
OEIS [A169837](https://oeis.org/A169837):

~~~spl
85.ekgSequence([3]).scatterPlot
~~~

![](sw/spl/Help/Image/ekgSequence-E.svg)

Sequence starting at five instead of two,
OEIS [A169837](https://oeis.org/A169837):

~~~spl
85.ekgSequence([3]).scatterPlot
~~~

![](sw/spl/Help/Image/ekgSequence-F.svg)

Positions of zeroes in the van Eck sequence,
OEIS [A171865](https://oeis.org/A171865):

~~~spl
200.vanEckSequence
.indicesOf(0)
.discretePlot
~~~

![](sw/spl/Help/Image/vanEckSequence-G.svg)

First differences of positions of zeroes in the van Eck sequence,
OEIS [A171868](https://oeis.org/A171868):

~~~spl
500.vanEckSequence
.indicesOf(0)
.differences
.scatterPlot
~~~

![](sw/spl/Help/Image/vanEckSequence-H.svg)

The van Eck sequence,
starting with _1,0_,
discrete plot,
OEIS [A171911](https://oeis.org/A171911):

~~~spl
85.vanEckSequence([1 0]).discretePlot
~~~

![](sw/spl/Help/Image/vanEckSequence-C.svg)

The van Eck sequence,
starting with _1,0_,
log scale scatter plot,
OEIS [A171911](https://oeis.org/A171911):

~~~spl
250.vanEckSequence([1 0]).log.scatterPlot
~~~

![](sw/spl/Help/Image/vanEckSequence-D.svg)

The van Eck sequence,
starting with _2,0_,
discrete plot,
OEIS [A171912](https://oeis.org/A171912):

~~~spl
85.vanEckSequence([2 0]).discretePlot
~~~

![](sw/spl/Help/Image/vanEckSequence-E.svg)

Positions of ones in the van Eck sequence,
OEIS [A171951](https://oeis.org/A171951):

~~~spl
1200.vanEckSequence
.indicesOf(1)
.discretePlot
~~~

![](sw/spl/Help/Image/vanEckSequence-F.svg)

The Euler triangle,
log scale scatter plot,
OEIS [A173018](https://oeis.org/A173018):

~~~spl
(0L .. 20L).triangularArray(
	eulerianNumber:/2
).catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/eulerianNumber-B.svg)

First few _x_-coordinates,
OEIS [A174344](https://oeis.org/A174344):

~~~spl
65.squareSpiral.column(1).discretePlot
~~~

![](sw/spl/Help/Image/squareSpiral-C.svg)

Partial sums of Stern’s diatomic series,
OEIS [A174868](https://oeis.org/A174868):

~~~spl
85.sternBrocotSequence
.prefixSum
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-G.svg)

Ordinal transform of the next prime function,
OEIS [A175851](https://oeis.org/A175851):

~~~spl
1:250.nextPrime
.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/nextPrime-F.svg)

Ordinal transform of the next prime function,
calculated as _n-f(n)+1_ for composite _n_,
OEIS [A175851](https://oeis.org/A175851):

~~~spl
1:250.collect { :n |
	n.isComposite.if {
		n - n.previousPrime + 1
	} {
		1
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/previousPrime-B.svg)

The only infinite sequence such that _a(n-1)=a(n)-f(a(n))_,
where _f_ counts ones in the binary expansion,
OEIS [A179016](https://oeis.org/A179016):

~~~spl
{ :x |
	x - x.digitCount(2, 1)
}.nestWhileList(10 ^ 3) { :x |
	x > 0
}.reverse.takeWhile { :x |
	x <= 209
}.discretePlot
~~~

![](sw/spl/Help/Image/digitCount-L.svg)

Number of partitions of _n_ into powers of ten,
OEIS [A179051](https://oeis.org/A179051):

~~~spl
let f = { :m :k |
	(m = 0).if {
		1
	} {
		(m < k).if {
			0
		} {
			f(m - k, k) + f(m, k * 10)
		}
	}
};
0:149.collect { :n |
	f(n, 1)
}.discretePlot
~~~

![](sw/spl/Help/Image/if-A.svg)

Unique digits used in _n_ in numerical order,
OEIS [A180410](https://oeis.org/A180410):

~~~spl
1:150.collect { :n |
	n.integerDigits
	.unique
	.sort
	.fromDigits
}.scatterPlot
~~~

![](sw/spl/Help/Image/unique-A.svg)

The golden triangle,
OEIS [A180662](https://oeis.org/A180662):

~~~spl
0:10.triangularArray { :n :k |
	[k, k + 1].fibonacci.product
}.catenate.log.discretePlot
~~~

![](sw/spl/Help/Image/fibonacci-P.svg)

The van Eck sequence,
log scale scatter plot,
OEIS [A181391](https://oeis.org/A181391):

~~~spl
250.vanEckSequence
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/vanEckSequence-A.svg)

The van Eck sequence,
discrete plot,
OEIS [A181391](https://oeis.org/A181391):

~~~spl
65.vanEckSequence.discretePlot
~~~

![](sw/spl/Help/Image/vanEckSequence-B.svg)

The prime shadow of _n_,
OEIS [A181819](https://oeis.org/A181819):

~~~spl
2:120.collect { :n |
	n.primeSignature.prime.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeSignature-C.svg)

The van der Laan sequence,
OEIS [A182097](https://oeis.org/A182097):

~~~spl
35.vanDerLaanSequence
.discretePlot
~~~

![](sw/spl/Help/Image/vanDerLaanSequence-A.svg)

Iterate the amusical permutation map starting at fourty,
OEIS [A182205](https://oeis.org/A182205):

~~~spl
amusicalPermutation:/1
.nestList(40, 250)
.log
.linePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-F.svg)

Maximum wins for longest winning streak,
OEIS [A182210](https://oeis.org/A182210):

~~~spl
1:17.triangularArray { :n :k |
	k * (n + 1) / (k + 1)
}.floor.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/floor-G.svg)

The number of length-_n_ binary sequences with exactly _k_ zeros,
and without three consecutive zeros,
OEIS [A182309](https://oeis.org/A182309):

~~~spl
2:27.collect { :n |
	let m = 2 * (n + 1) / 3;
	2:m.collect { :k |
		let i = k / 2;
		1:i.sum { :j |
			binomial(n - k + 1, j)
			*
			binomial(
				n - k - j + 1,
				k - (2 *j)
			)
		}
	}
}.catenate.log.linePlot
~~~

![](sw/spl/Help/Image/binomial-F.svg)

Enumeration of rationals sorted by sum on components,
numerators,
OEIS [A182972](https://oeis.org/A182972):

~~~spl
4:35.collect { :n |
	let k = (n - 1) // 2;
	1:k.select { :i |
		(i.gcd(n - 1) = 1)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/gcd-L.svg)

Enumeration of rationals sorted by sum on components,
denominators,
OEIS [A182973](https://oeis.org/A182973):

~~~spl
4:35.collect { :n |
	let k = (n - 1) // 2;
	n - 1 - 1:k.select { :i |
		(i.gcd(n - 1) = 1)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/gcd-M.svg)

_₂F₁(-2k,2k-2n;1;-1)_,
OEIS [A184879](https://oeis.org/A184879):

~~~spl
0:10.triangularArray { :n :k |
	hypergeometric2F1(
		-2 * k, (2 * k) - (2 * n), 1, -1
	)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/hypergeometric2F1-D.svg)

Even numbers interleaved with repeated odd numbers,
OEIS [A186421](https://oeis.org/A186421):

~~~spl
0:65.collect { :n |
	n.isEven.if {
		n
	} {
		2 * (n / 4).floor + 1
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/isEven-J.svg)

First differences of even numbers interleaved with repeated odd numbers,
OEIS [A186422](https://oeis.org/A186422):

~~~spl
0:65.collect { :n |
	n.isEven.if {
		n
	} {
		2 * (n / 4).floor + 1
	}
}.differences.discretePlot
~~~

![](sw/spl/Help/Image/isEven-K.svg)

Number of ways to write _n=x+y_ _6x-1_, _6x+1_, _6y+1_ and _6y+5_ all prime,
OEIS [A187757](https://oeis.org/A187757):

~~~spl
1:250.collect { :n |
	let m = n - 1;
	1:m.sum { :k |
		[
			6 * k - 1,
			6 * k + 1,
			6 * (n - k) + 1,
			6 * (n - k) + 5
		].allSatisfy(isPrime:/1).boole
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/isPrime-L.svg)

The largest _m_ such that _n_ is congruent to -1, 0 or 1 `mod` _k_ for all _k_ from 1 to _m_,
OEIS [A187824](https://oeis.org/A187824):

~~~spl
2:99.collect { :n |
	let k = 4;
	{
		let r = n % k;
		r < 2 | { k - r < 2 }
	}.whileTrue {
		k := k + 1
	};
	k - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/mod-N.svg)

Partial sums of _w(n)!_,
OEIS [A188064](https://oeis.org/A188064):

~~~spl
0:250.hammingWeight
.factorial
.prefixSum
.stepPlot
~~~

![](sw/spl/Help/Image/hammingWeight-E.svg)

Array _⌊nφ-⌊kφ-⌊(nφ-kφ)_,
read by antidiagonals,
OEIS [A188294](https://oeis.org/A188294):

~~~spl
let r = 1.goldenRatio;
1:12.antidiagonalArray { :k :n |
	(n * r).floor - (k * r).floor - ((n * r) - (k * r)).floor
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/goldenRatio-M.svg)

Zeckendorf representations,
OEIS [A189920](https://oeis.org/A189920):

~~~spl
1:21.collect(
	zeckendorfRepresentation:/1
).catenate.discretePlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-I.svg)

Triangle of values of _n_ written in base _k_ with digits reversed,
OEIS [A191780](https://oeis.org/A191780):

~~~spl
2:13.triangularArray { :n :k |
	n.integerDigits(k)
	.reverse
	.fromDigits(k)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-P.svg)

A symmetric square array,
read by antidiagonals,
given by a summing recurrence,
OEIS [A191898](https://oeis.org/A191898):

~~~spl
let t = { :n :k |
	[
		{ n < 1 | { k < 1 } } -> { 0 },
		{ n = 1 | { k = 1 } } -> { 1 },
		{ k > n } -> { t(k, n) },
		{ n > k } -> {
			let m = n.mod(k, 1);
			t(k, m)
		},
		{ true } -> {
			0 - (1 .. n - 1).sum { :i |
				t(n, i)
			}
		}
	].which
};
1:17.antidiagonalArray(t:/2)
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/sum-J.svg)

Partitions in graded lexicographical ordering,
OEIS [A193073](https://oeis.org/A193073):

~~~spl
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedLexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-D.svg)

Binary coding of a polynomial over _GF(2)_,
Arndt’s blue code,
OEIS [A193231](https://oeis.org/A193231):

~~~spl
let a = Map { :n |
	[
		{ n <= 1 } -> { n },
		{ n.isEven } -> {
			let m = a[n / 2];
			bitXor(2 * m, m)
		},
		{ n.isOdd } -> {
			let m = a[(n - 1) / 2];
			bitXor(m, 2 * m + 1)
		}
	].which
};
a[0:127].scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-H.svg)

The bitwise _Xor_ of the first _n_ triangular numbers,
OEIS [A193232](https://oeis.org/A193232):

~~~spl
0:150.collect { :n |
	0:n
	.prefixSum
	.reduce(bitXor:/2)
}.discretePlot
~~~

![](sw/spl/Help/Image/bitXor-K.svg)

The sequence lengths for the first few terms of the _p=2_ sequences,
OEIS [A193995](https://oeis.org/A193995):

~~~spl
1:150.collect { :each |
	each
	.perfectDigitalInvariantSequence(
		10, 2
	).size
}.scatterPlot
~~~

![](sw/spl/Help/Image/perfectDigitalInvariantSequence-A.svg)

The number of odd prime indices minus the number of even prime indices,
OEIS [A195017](https://oeis.org/A195017):

~~~spl
2:85.collect { :n |
	n.factorInteger.sum { :f |
		f[2] * (-1 ^ (1 + f[1].primePi))
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/primePi-U.svg)

Consecutive powers of the Gray code permutation,
OEIS [A195467](https://oeis.org/A195467):

~~~spl
0:2.collect { :i |
	let n = 2 ^ i;
	let m = 2 ^ n;
	grayEncode:/1.nestList(
		[0 .. m - 1],
		n - 1
	).catenate
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/grayEncode-H.svg)

Number of distinct residues,
OEIS [A195637](https://oeis.org/A195637):

~~~spl
1:150.collect { :n |
	let m = n - 1;
	0:m.powerMod(n, n).nub.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-F.svg)

Irregular triangle read by rows in which column _k_ lists the odd numbers interleaved with _k-1_ zeros,
and the first element of column _k_ is in row _k(k+1)/2_,
OEIS [A196020](https://oeis.org/A196020):

~~~spl
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

![](sw/spl/Help/Image/inverseTriangularNumber-A.svg)

Product of cumulative sums of divisors of _n_,
OEIS [A197410](https://oeis.org/A197410):

~~~spl
1:85.collect { :n |
	n.divisors.prefixSum.product
}.log.discretePlot
~~~

![](sw/spl/Help/Image/prefixSum-G.svg)

Table of binary Walsh functions,
columns read as binary numbers,
OEIS [A197819](https://oeis.org/A197819):

~~~spl
0:3.collect { :i |
	let n = 2 ^ i;
	let m = 2 ^ n;
	let a = grayEncode:/1.nestList(
		[0 .. m - 1],
		n - 1
	);
	(a % 2).transpose.collect { :d |
		d.fromDigits(2)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/grayEncode-I.svg)

Run lengths of the Ehrenfeucht-Mycielski sequence,
OEIS [A201881](https://oeis.org/A201881):

~~~spl
105.ehrenfeuchtMycielskiSequence
.split(=)
.collect(size:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/ehrenfeuchtMycielskiSequence-B.svg)

Table _(j%i).⌈(i%j)_ read by antidiagonals,
OEIS [A204016](https://oeis.org/A204016):

~~~spl
1:12.antidiagonalArray { :i :j |
	(j % i).max(i % j)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/max-A.svg)

Ordered differences of primes,
OEIS [A204890](https://oeis.org/A204890):

~~~spl
1:11.prime
.orderedDifferences
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/orderedDifferences-A.svg)

Ordered differences of Fibonacci numbers,
OEIS [A204922](https://oeis.org/A204922):

~~~spl
2:11.fibonacci
.orderedDifferences
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/orderedDifferences-B.svg)

Sequence of almost integers,
rounded,
OEIS [A205579](https://oeis.org/A205579):

~~~spl
(1.plasticRatio ^ 0:35).round.discretePlot
~~~

![](sw/spl/Help/Image/plasticRatio-A.svg)

The number of iterations required to reach a power of two in the Collatz sequence,
starting at _n_,
OEIS [A208981](https://oeis.org/A208981):

~~~spl
1:165.collect { :n |
	n.collatzSequence.detectIndex { :x |
		x.log2.isInteger
	} - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-J.svg)

The characteristic function of the powers of two,
OEIS [A209229](https://oeis.org/A209229):

~~~spl
(0:86 - 1).bitLength.differences
.discretePlot
~~~

![](sw/spl/Help/Image/bitLength-D.svg)

Sequence lengths for Collatz problem with rational numbers,
OEIS [A210468](https://oeis.org/A210468):

~~~spl
1:66.collect { :n |
	let x = Fraction(1, (2 * n + 1));
	let y = x.collatzSequence;
	let k = y.size;
	let e = y.last;
	k - 2 - (e = 2).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/collatzSequence-F.svg)

Record values of the Dedekind ψ function,
OEIS [A210523](https://oeis.org/A210523):

~~~spl
1:350.dedekindPsi
.recordValues
.scatterPlot
~~~

![](sw/spl/Help/Image/dedekindPsi-B.svg)

Prime signature of _n_,
OEIS [A212171](https://oeis.org/A212171):

~~~spl
1:75.collect(primeSignature:/1)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/primeSignature-A.svg)

Triangle of _π(n)+π(k)-π(n+k)_,
OEIS [A212210](https://oeis.org/A212210):

~~~spl
1:13.triangularArray { :n :k |
	([n, k, n + k].primePi * [1 1 -1]).sum
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/primePi-G.svg)

_π(n)+π(k)-π(n+k)_,
triangular,
counting from two,
OEIS [A212211](https://oeis.org/A212211):

~~~spl
2:13.triangularArray { :n :k |
	([n, k, n + k].primePi * [1 1 -1]).sum
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/primePi-O.svg)

_π(n)+π(k)-π(n+k)_,
by antidiagonals,
counting from one,
OEIS [A212212](https://oeis.org/A212212):

~~~spl
1:13.antidiagonalArray { :n :k |
	([n, k, n + k].primePi * [1 1 -1]).sum
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/primePi-P.svg)

_π(n)+π(k)-π(n+k)_,
by antidiagonals,
counting from two,
OEIS [A212213](https://oeis.org/A212213):

~~~spl
2:13.antidiagonalArray { :n :k |
	([n, k, n + k].primePi * [1 1 -1]).sum
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/primePi-N.svg)

Record values of Stern’s diatomic series,
OEIS [A212289](https://oeis.org/A212289):

~~~spl
10000.sternBrocotSequence
.recordValues
.discretePlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-C.svg)

Median prime factor of _1:n_,
OEIS [A212300](https://oeis.org/A212300):

~~~spl
3:150.collect { :n |
	let m = 1:n.collect { :k |
		k.greatestPrimeFactor
	}.median;
	(m + 0.5).ceiling.previousPrime
}.stepPlot
~~~

![](sw/spl/Help/Image/median-A.svg)

Characteristic function of cube-free numbers,
OEIS [A212793](https://oeis.org/A212793):

~~~spl
1:85.collect(isCubeFree:/1).boole
.discretePlot
~~~

![](sw/spl/Help/Image/isCubeFree-C.svg)

Bitwise and of _n_ and _2n_,
OEIS [A213370](https://oeis.org/A213370):

~~~spl
let n = 1:64;
n.bitAnd(n * 2).discretePlot
~~~

![](sw/spl/Help/Image/bitAnd-B.svg)

_b⊛c_ where _b(h)=h_ and _c(h)=h+n-1_,
OEIS [A213500](https://oeis.org/A213500):

~~~spl
1:13.antidiagonalArray { :n :k |
	let m = k - 1;
	0:m.sum { :i |
		(k - i) * (n + i)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sum-E.svg)

Count distinct rooted trees obtained from the tree with Matula-Goebel number _n_ by adding one edge,
OEIS [A214567](https://oeis.org/A214567):

~~~spl
let a = { :n |
	(n = 1).if {
		1
	} {
		n.isPrime.if {
			a(n.primePi) + 1
		} {
			n.distinctPrimeFactors
			.sum { :x |
				a(x) - 1
			} + 1
		}
	}
};
1:150.collect(a:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-E.svg)

Number of partitions of _n_ into parts 6, 9 or 20,
OEIS [A214772](https://oeis.org/A214772):

~~~spl
0:150.collect { :n |
	[6 9 20].frobeniusSolve(n).size
}.scatterPlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-F.svg)

Permute integers according to the sum of the Heinz partition,
OEIS [A215366](https://oeis.org/A215366):

~~~spl
let n = 8;
[1 .. 2 ^ n].gatherBy { :j |
	j.integerPartitionUnrank('Heinz')
	.sum
}.take(n + 1).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitionUnrank-C.svg)

Imply Goldbach and Lemoine conjectures,
OEIS [A219055](https://oeis.org/A219055):

~~~spl
1:100.collect { :n |
	let m = n % 2;
	let o = ((n - 1) / (2 + m)).primePi;
	1:o.sum { :k |
		let p = k.prime;
		(
			(p + 6).isPrime & {
				let q = (1 + m) * p;
				(n - q).isPrime & {
					(n - q - 6).isPrime
				}
			}
		).boole
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-F.svg)

A sequence related to the ruler sequence _r_,
where _a(2n)=4a(n)-2^r(n)_,
OEIS [A220466](https://oeis.org/A220466):

~~~spl
1:115.collect { :n |
	let p = n.integerExponent(2);
	let m = (n / (2 ^ p) + 1) / 2;
	let a = (4 ^ p) * (m - 1);
	let b = (2 ^ (p - 1)) * (1 + (2 ^ p));
	a + b
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-L.svg)

New primes found by Rowland’s recurrence,
OEIS [A221869](https://oeis.org/A221869):

~~~spl
OeisEntry('A221869').then { :e |
	e.bFileData
	.first(250)
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/rowlandsSequence-C.svg)

Lower left triangle of Nim multiplication table of _2^n_,
read by rows,
from `zero`,
OEIS [A223540](https://oeis.org/A223540):

~~~spl
0:15.triangularArray{ :m :n |
	(2 ^ n).nimMultiplication(2 ^ m)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-T.svg)

Nim multiplication table of _2^n_,
read by antidiagonals,
from `one`,
OEIS [A223541](https://oeis.org/A223541):

~~~spl
1:21.antidiagonalArray { :m :n |
	(2 ^ n).nimMultiplication(2 ^ m)
}.++.log.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-S.svg)

Key matrix of
OEIS [A223541](https://oeis.org/A223541),
OEIS [A223542](https://oeis.org/A223542):

~~~spl
let k = 2 ^ 5 - 1;
let i = 2 ^ 1:k;
let a = 0:k.antidiagonalArray { :m :n |
	(2 ^ n).nimMultiplication(2 ^ m)
};
let u = a.catenate.unique;
a.deepCollect { :x |
	u.indexOf(x) - 1
}.++.take(264).scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-V.svg)

Nim-products of powers of two,
OEIS [A223543](https://oeis.org/A223543):

~~~spl
let k = 2 ^ 5 - 1;
let i = 2 ^ 0:k;
nimMultiplication:/2.table(i, i)
.catenate.unique.log.linePlot
~~~

![](sw/spl/Help/Image/nimMultiplication-U.svg)

_Σ0:n𝒙|n_,
OEIS [A224915](https://oeis.org/A224915):

~~~spl
0:63.collect { :n |
	0:n.sum { :i |
		n.bitXor(i)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-G.svg)

_Σi^2*-1^i_ for _n:2n_,
OEIS [A225144](https://oeis.org/A225144):

~~~spl
1:65.collect { :n |
	let m = n * 2;
	n:m.sum { :i |
		(i ^ 2) * (-1 ^ i)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-F.svg)

Replace each prime number with its rank in the recursive prime factorization of _n_,
OEIS [A225395](https://oeis.org/A225395):

~~~spl
let a = Map { :n |
	(n = 1).if {
		1
	} {
		n.isPrime.if {
			n.primePi
		} {
			n.factorInteger.product { :f |
				f[1].primePi ^ a[f[2]]
			}
		}
	}
};
a[1:175].scatterPlot
~~~

![](sw/spl/Help/Image/primePi-L.svg)

Alternating sum of decimal expansion of _n_,
OEIS [A225693](https://oeis.org/A225693):

~~~spl
0:200.collect { :n |
	n.integerDigits
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-B.svg)

Moebius function applied to divisors of _n_,
OEIS [A225817](https://oeis.org/A225817):

~~~spl
1:23.collect { :n |
	n.divisors.collect(moebiusMu:/1)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-G.svg)

Array of run lengths of binary representation of _n_,
OEIS [A227186](https://oeis.org/A227186):

~~~spl
0:13.antidiagonalArray { :n :k |
	(n = 0).if {
		0
	} {
		let d = n.binaryExpansion;
		let a = d.reverse.asRunArray;
		let r = a.runs;
		let c = r.size;
		(k + 1 <= c).if {
			r[k + 1]
		} {
			0
		}
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/asRunArray-B.svg)

A graph given by an edge re-writing rule,
the vertices are given by
OEIS [A228853](https://oeis.org/A228853):

~~~spl
{ :t |
	t.collect { :e |
		let [x, y] = e;
		[
			[y, x + y],
			[y, x + (2 * y)]
		]
	}.++
}.nestList([[1, 2]], 6)
.catenate
.asGraph
.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-F.svg)

Least prime in each Rowland’s sequence,
step plot,
OEIS [A230504](https://oeis.org/A230504):

~~~spl
1:75.collect { :m |
	m.rowlandsSequence(13)
	.detect(isPrime:/1)
}.stepPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-D.svg)

Least prime in each Rowland’s sequence,
scatter plot,
OEIS [A230504](https://oeis.org/A230504):

~~~spl
1:100.collect { :m |
	m.rowlandsSequence(13)
	.detect(isPrime:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-E.svg)

Smallest _x_ such that _x%φ(x)=n_,
OEIS [A234642](https://oeis.org/A234642):

~~~spl
0:43.collect { :n |
	let x = 0;
	{
		x := x + 1;
		x % x.eulerPhi = n
	}.whileFalse;
	x
}.discretePlot
~~~

![](sw/spl/Help/Image/eulerPhi-H.svg)

Fixed point of Pisano period _n_,
OEIS [A235249](https://oeis.org/A235249):

~~~spl
1:65.collect { :n |
	pisanoPeriod:/1
	.fixedPoint(n, =)
}.log.stepPlot
~~~

![](sw/spl/Help/Image/pisanoPeriod-D.svg)

Least excluded sequence such that adjacent terms are part of a Pythagorean triple,
OEIS [A235598](https://oeis.org/A235598):

~~~spl
[3]
.leastExcludedSequence(40) { :a :n :m |
	let [p, q] = [a[n - 1], m].square;
	(p + q).isPerfectSquare | {
		(q - p).abs.sqrt.isInteger
	}
}.log.discretePlot
~~~

![](sw/spl/Help/Image/leastExcludedSequence-C.svg)

Irregular triangle read by rows in which column _k_ lists _k_ copies of every positive integer in nondecreasing order,
and the first element of column _k_ is in row _k(k+1)/2_,
OEIS [A235791](https://oeis.org/A235791):

~~~spl
1:24.collect { :n |
	let m = n.inverseTriangularNumber;
	1:m.collect { :k |
		let a = (n + 1) / k;
		let b = (k + 1) / 2;
		(a - b).ceiling
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/ceiling-D.svg)

First differences of 13-rough numbers,
apart from first term also
the differences between terms of compacting Eratosthenes sieve for _P(6)=13_,
OEIS [A236187](https://oeis.org/A236187):

~~~spl
1:500.select { :each |
	each.isRoughNumber(13)
}.differences.scatterPlot
~~~

![](sw/spl/Help/Image/isRoughNumber-B.svg)

First differences of 17-rough numbers,
apart from first term also
the differences between terms of compacting Eratosthenes sieve for _P(7)=17_,
OEIS [A236188](https://oeis.org/A236188):

~~~spl
1:600.select { :each |
	each.isRoughNumber(17)
}.differences.scatterPlot
~~~

![](sw/spl/Help/Image/isRoughNumber-C.svg)

First differences of 19-rough numbers,
apart from first term also
the differences between terms of compacting Eratosthenes sieve for _P(8)=19_,
OEIS [A236189](https://oeis.org/A236189):

~~~spl
1:650.select { :each |
	each.isRoughNumber(19)
~~~

![](sw/spl/Help/Image/isRoughNumber-D.svg)

Irregular triangle read by rows in which column _k_ lists ones interleaved with _k-1_ zeros,
and the first element of column _k_ is in row _k(k+1)/2_,
OEIS [A237048](https://oeis.org/A237048):

~~~spl
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

_a(n)_ is the smallest integer not yet in _a_ that is divisible by all non-zero digits of _a(n-1)_,
OEIS [A237851](https://oeis.org/A237851):

~~~spl
[1].leastExcludedSequence(200) { :a :n :m |
	a[n - 1].integerDigits
	.select(isPositive:/1)
	.unique
	.allSatisfy { :x |
		m.divisible(x)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisible-E.svg)

Zero unless _n_ is a non-prime, in which case plot index,
OEIS [A239968](https://oeis.org/A239968):

~~~spl
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

Write _n_ and _3n_ in ternary and add all digits modulo three,
OEIS [A242399](https://oeis.org/A242399):

~~~spl
0:80.collect { :n |
	let a = n.integerDigits(3);
	let b = (n * 3).integerDigits(3);
	let c = a.padLeft([b.size], 0);
	(b + c % 3).fromDigits(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-C.svg)

Difference between _4n_ and _n_ and _3n_ written in ternary and all digits summed modulo three,
OEIS [A242400](https://oeis.org/A242400):

~~~spl
0:80.collect { :n |
	let a = n.integerDigits(3);
	let b = (n * 3).integerDigits(3);
	let c = a.padLeft([b.size], 0);
	(n * 4) - (b + c % 3).fromDigits(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-D.svg)

A permutation of the natural numbers,
OEIS [A243353](https://oeis.org/A243353):

~~~spl
let f = { :n :i :x |
	(n = 0).if {
		x
	} {
		n.isEven.if {
			f(n / 2, i + 1, x)
		} {
			f((n - 1) / 2, i, x * i.prime)
		}
	}
};
0:250.collect { :n |
	f(n.bitXor((n / 2).floor), 1, 1)
}.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/prime-D.svg)

Calculate run length transform of `fibonacci`,
OEIS [A246028](https://oeis.org/A246028):

~~~spl
0:200.collect { :n |
	0:n.sum { :k |
		let a = (n - k).bitNot;
		let b = bitAnd(a, 2 * k);
		let c = bitAnd(n.bitNot, k);
		bitOr(b, c).isZero.boole
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitAnd-F.svg)

Run length transform of _S(n)=Fibonacci(n+1)_,
OEIS [A246028](https://oeis.org/A246028):

~~~spl
200.runLengthTransform { :n |
	(n + 1).fibonacci
}.scatterPlot
~~~

![](sw/spl/Help/Image/runLengthTransform-A.svg)

Inverse boustrophedon transform,
OEIS [A247453](https://oeis.org/A247453):

~~~spl
0:13.triangularArray { :n :k |
	n.binomial(k)
	*
	(n - k).eulerUpDownNumber
	*
	(-1 ^ (n - k))
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/eulerUpDownNumber-A.svg)

_A003961(n)-2*n_,
OEIS [A252748](https://oeis.org/A252748):

~~~spl
let n = 1:85;
let a = n.collect(
	'A003961'.oeisFunction
);
(a - (2 * n)).discretePlot
~~~

![](sw/spl/Help/Image/oeisFunction-F.svg)

Indices of zeroes in the Ehrenfeucht-Mycielski sequence,
OEIS [A253060](https://oeis.org/A253060):

~~~spl
105.ehrenfeuchtMycielskiSequence
.indicesOf(0)
.discretePlot
~~~

![](sw/spl/Help/Image/ehrenfeuchtMycielskiSequence-C.svg)

Limit of _f(f(f(...f(2)...)))%n_ as the number of iterations of _f(x)=2^x-1_ grows,
OEIS [A254410](https://oeis.org/A254410):

~~~spl
OeisEntry('A254410').then { :e |
	e.bFileData
	.first(150)
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/OeisEntry-D.svg)

Primes and then products of adjacent terms divided by square of `gcd`,
OEIS [A255483](https://oeis.org/A255483):

~~~spl
let t = { :n :m |
	(n = 0).if {
		m.prime
	} {
		let a = t(n - 1, m);
		let b = t(n - 1, m + 1);
		a * b / (gcd(a, b) ^ 2L)
	}
};
0:12.triangularArray { :d :n |
	t(n, 1 + d - n)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/gcd-N.svg)

Column indices of the Wythoff array that contains _L(n)_,
OEIS [A255670](https://oeis.org/A255670):

~~~spl
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

The first variant of Per Nørgård’s infinity sequence,
OEIS [A256184](https://oeis.org/A256184):

~~~spl
250.noergaardInfinitySequence(1)
.scatterPlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-C.svg)

The second variant of Per Nørgård’s infinity sequence,
OEIS [A256185](https://oeis.org/A256185):

~~~spl
250.noergaardInfinitySequence(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-D.svg)

First differences of Nørgård’s infinity sequence,
OEIS [A256187](https://oeis.org/A256187):

~~~spl
100.noergaardInfinitySequence
.differences.discretePlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-E.svg)

Partial sums of the Josephus problem at _k=2_,
OEIS [A256249](https://oeis.org/A256249):

~~~spl
0:85.collect { :n |
	n.josephusProblem(2)
}.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/josephusProblem-D.svg)

The array,
read by antidiagonals,
of the _k_-th derivative of _n_,
OEIS [A258651](https://oeis.org/A258651):

~~~spl
0:27.antidiagonalArray { :n :k |
	arithmeticDerivative:/1.iterate(n, k)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/arithmeticDerivative-D.svg)

Least multiple to have no common one bit in binary expansion,
OEIS [A261892](https://oeis.org/A261892):

~~~spl
1:200.collect { :n |
	let k = 1;
	{
		bitAnd(k * n, n) != 0
	}.whileTrue {
		k := k + 1
	};
	k * n
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitAnd-G.svg)

Triangle,
read by rows,
of _0:n_ sorted by _w_,
OEIS [A262881](https://oeis.org/A262881):

~~~spl
1:21.collect { :n |
	[0 .. n].sortOn(hammingWeight:/1)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-J.svg)

Partition array for the products of the hook lengths corresponding to the partitions of _n_,
OEIS [A263003](https://oeis.org/A263003):

~~~spl
1:11.collect { :n |
	n.integerPartitions.collect { :p |
		p.hookLengths.catenate.product
	}
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/hookLengths-A.svg)

Ordinal transform of the arithmetic derivative of _n_,
OEIS [A263111](https://oeis.org/A263111):

~~~spl
0:85.arithmeticDerivative
.ordinalTransform
.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-M.svg)

The ordinal transform of the multiplicative persistence,
discrete plot,
OEIS [A263131](https://oeis.org/A263131):

~~~spl
1:115.collect { :n |
	n.multiplicativePersistence(10)
}.ordinalTransform.discretePlot
~~~

![](sw/spl/Help/Image/multiplicativePersistence-B.svg)

The ordinal transform of the multiplicative persistence,
scatter plot,
OEIS [A263131](https://oeis.org/A263131):

~~~spl
1:200.collect { :n |
	n.multiplicativePersistence(10)
}.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativePersistence-C.svg)

Highest exponent in the prime factorization of the _n_-th central binomial coefficient,
OEIS [A263922](https://oeis.org/A263922):

~~~spl
1:65.collect { :n |
	(2 * n).binomial(n)
	.primeSignature
	.max
}.discretePlot
~~~

![](sw/spl/Help/Image/primeSignature-I.svg)

List the parts of the unique strict partition with π encoding,
OEIS [A265146](https://oeis.org/A265146):

~~~spl
1:45.collect { :n |
	let l = n.primeFactors.primePi;
	let k = l.size;
	l + 1:k - 1
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/primePi-V.svg)

_n_-th prime minus its binary reversal,
OEIS [A265326](https://oeis.org/A265326):

~~~spl
let k = 200;
1:k.collect { :n |
	let m = n.prime;
	let r = m.integerDigits(2).reverse;
	m - r.fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-A.svg)

Bitwise logical implies triangular array,
_k→n_,
OEIS [A265705](https://oeis.org/A265705):

~~~spl
0:19.triangularArray(bitImplies:/2.swap)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitImplies-A.svg)

Bitwise logical implies triangular array,
OEIS [A265705](https://oeis.org/A265705):

~~~spl
0:19.triangularArray { :n :k |
	(n = 0).if {
		0
	} {
		let m = (2 ^ n.bitLength) - 1 - k;
		m.bitOr(n)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitOr-I.svg)

Bitwise logical implication _n→2n_,
OEIS [A265716](https://oeis.org/A265716):

~~~spl
0:85.collect { :n |
	n.bitImplies(2 * n)
}.discretePlot
~~~

![](sw/spl/Help/Image/bitImplies-B.svg)

Bitwise logical implication _n→2n_,
scatter plot,
OEIS [A265716](https://oeis.org/A265716):

~~~spl
0:127.collect { :n |
	n.bitImplies(2 * n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitImplies-C.svg)

Bitwise logical implication _n→P(n)_,
OEIS [A265885](https://oeis.org/A265885):

~~~spl
1:85.collect { :n |
	n.bitImplies(n.prime)
}.discretePlot
~~~

![](sw/spl/Help/Image/bitImplies-D.svg)

Bitwise logical implication _n→P(n)_,
scatter plot,
OEIS [A265885](https://oeis.org/A265885):

~~~spl
1:127.collect { :n |
	n.bitImplies(n.prime)
}.scatterPlot
~~~

![](sw/spl/Help/Image/bitImplies-E.svg)

_n+⌊(n/4)(-1^(n%4))_,
OEIS [A265888](https://oeis.org/A265888):

~~~spl
0:65.collect { :n |
	n + ((n / 4).floor * (-1 ^ (n % 4)))
}.discretePlot
~~~

![](sw/spl/Help/Image/floor-J.svg)

Sum the parts of the unique strict partition with π encoding,
OEIS [A266475](https://oeis.org/A266475):

~~~spl
1:115.collect { :n |
	let l = n.primeFactors.primePi;
	let k = l.size;
	(l + 1:k - 1).sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/primePi-W.svg)

Ordinal transform of the sums of the unique strict partition of _n_ with π encoding,
OEIS [A266476](https://oeis.org/A266476):

~~~spl
1:250.collect { :n |
	let l = n.primeFactors.primePi;
	let k = l.size;
	(l + 1:k - 1).sum
}.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-N.svg)

First few _y_-coordinates,
OEIS [A268038](https://oeis.org/A268038):

~~~spl
65.squareSpiral.column(2).discretePlot
~~~

![](sw/spl/Help/Image/squareSpiral-D.svg)

An array,
read by antidiagonals,
of the Hamming distance between _k_ and the Gray encoding of the sum of _n_ and the Gray decoding of _k_,
OEIS [A268833](https://oeis.org/A268833):

~~~spl
0:12.antidiagonalArray { :n :k |
	k.hammingDistance(
		(n + k.grayDecode).grayEncode
	)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/hammingDistance-A.svg)

The sum of the prime factors of the sum of the preceding terms,
log scale scatter plot,
OEIS [A268868](https://oeis.org/A268868):

~~~spl
let x = [1 1];
150.timesRepeat {
	x.add(x.sum.primeFactors.sum)
};
x.log.scatterPlot
~~~

![](sw/spl/Help/Image/primeFactors-D.svg)

Sum previous elements that divide _n_,
OEIS [A269347](https://oeis.org/A269347):

~~~spl
let a = [1];
2:55.do { :n |
	let m = n - 1;
	a.add(
		1:m.select { :i |
			n.divisible(a[i])
		}.sum
	)
};
a.log.discretePlot
~~~

![](sw/spl/Help/Image/divisible-G.svg)

Nearest integer to _n×sin(n)_,
discrete plot,
OEIS [A272695](https://oeis.org/A272695):

~~~spl
let n = 0:65;
(n * n.sin).round.discretePlot
~~~

![](sw/spl/Help/Image/round-C.svg)

Nearest integer to _n×sin(n)_,
scatter plot,
OEIS [A272695](https://oeis.org/A272695):

~~~spl
let n = 0:250;
(n * n.sin).round.scatterPlot
~~~

![](sw/spl/Help/Image/round-D.svg)

Nearest integer to _n×tan(n)_,
discrete plot,
OEIS [A274086](https://oeis.org/A274086):

~~~spl
let n = 0:115;
(n * n.tan).round.discretePlot
~~~

![](sw/spl/Help/Image/round-E.svg)

Nearest integer to _n×tan(n)_,
log scale scatter plot,
OEIS [A274086](https://oeis.org/A274086):

~~~spl
let n = 0:250;
(n * n.tan).round.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/round-F.svg)

First few _y_-coordinates,
counterclockwise,
OEIS [A274923](https://oeis.org/A274923):

~~~spl
65.squareSpiral('Counterclockwise')
.column(2).discretePlot
~~~

![](sw/spl/Help/Image/squareSpiral-E.svg)

Lexicographically earliest sequence such that _|a(n+1)-a(n)|_ is a square,
OEIS [A277616](https://oeis.org/A277616):

~~~spl
[1 0 0 0 0 0 0 0 0 0 0 0 1 -1]
.linearRecurrence(
	[0 4 8 12 3 7 11 2 6 10 1 5 9 13],
	85
).discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-H.svg)

Run length transform of primorials,
OEIS [A278159](https://oeis.org/A278159):

~~~spl
0:250.collect { :n |
	let b = n.binaryExpansion;
	let r = b.runLengthsOf(1);
	r.collect(primorial:/1).product
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/primorial-A.svg)

Run length transform of `primorial`,
log scale scatter plot,
OEIS [A278159](https://oeis.org/A278159):

~~~spl
100.runLengthTransform(primorial:/1)
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/runLengthTransform-B.svg)

Characteristic function for Flavius Josephus’s sieve,
OEIS [A278169](https://oeis.org/A278169):

~~~spl
1:37.collect { :n |
	let m = n - 1;
	m:1:-1.injectInto(n) { :a :b |
		b * (a / b + 1).ceiling
	}
}.characteristicFunction.discretePlot
~~~

![](sw/spl/Help/Image/injectInto-C.svg)

The least number with the same prime signature as the Doudna sequence entry,
OEIS [A278222](https://oeis.org/A278222):

~~~spl
65.doudnaSequence.collect { :n |
	1:Infinity.detect { :m |
		n.primeSignature
		=
		m.primeSignature
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/doudnaSequence-C.svg)

Lexicographically earliest sequence such that,
for any distinct _i_ and _j_,
_a(i)=a(j)_ implies _i&j=0_,
OEIS [A279125](https://oeis.org/A279125):

~~~spl
let n = 100;
let g = List(n, 0);
let a = [];
1.toDo(n - 1) { :i |
	let j = 0;
	{
		g[j + 1].bitAnd(i) != 0
	}.whileTrue {
		j := j + 1
	};
	g[j + 1] := g[j + 1] + i;
	a.add := j
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/bitAnd-D.svg)

First differences of
complement of
exponent of the largest power of two dividing _(2n)!_,
OEIS [A279340](https://oeis.org/A279340):

~~~spl
0:99.complement(
	0:51.collect { :n |
		(2 * n).!.integerExponent(2)
	}
).differences.stepPlot
~~~

![](sw/spl/Help/Image/integerExponent-F.svg)

Three-adic valuation of the bijective bit-reverse of _3n_,
OEIS [A280509](https://oeis.org/A280509):

~~~spl
1:75.collect { :n |
	let a = (3 * n).integerReverse(2);
	let b = a * (3 * n).bitAnd(-3 * n);
	b.integerExponent(3)
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-J.svg)

Numerators of _k=1_ Sobol sequence,
discrete plot,
OEIS [A280995](https://oeis.org/A280995):

~~~spl
63.sobolSequence(1).numerator.discretePlot
~~~

![](sw/spl/Help/Image/sobolSequence-E.svg)

Numerators of _k=1_ Sobol sequence,
scatter plot,
OEIS [A280995](https://oeis.org/A280995):

~~~spl
255.sobolSequence(1).numerator.scatterPlot
~~~

![](sw/spl/Help/Image/sobolSequence-G.svg)

Sum previous terms at offset divisors,
OEIS [A281488](https://oeis.org/A281488):

~~~spl
let a = [1];
2:200.do { :n |
	let m = n - 1;
	a.add(
		m.select { :d |
			(n - 2) % d = 0
		}.sum { :d |
			a[d]
		}.negate
	)
};
~~~

![](sw/spl/Help/Image/sum-A.svg)

Lexicographically earliest sequence of distinct terms such that every pair of consecutive terms contains a term that is a unitary divisor of the other term,
OEIS [A282291](https://oeis.org/A282291):

~~~spl
[1].leastExcludedSequence(59) { :a :n :m |
	let [p, q] = [a[n - 1], m].sort;
	q.divisible(p) & {
		p.isCoprime(q / p)
	}
}.log.discretePlot
~~~

![](sw/spl/Help/Image/isCoprime-D.svg)

Lexicographically earliest sequence of distinct terms such that every pair of consecutive terms contains a term that is a unitary divisor of the other term,
OEIS [A282291](https://oeis.org/A282291):

~~~spl
let a = [1];
58.timesRepeat {
	let k = 1;
	let e = a.last;
	{
		let [p, q] = [k, e].sort;
		a.includes(k) | {
			q.divisible(p).notAnd {
				p.isCoprime(q / p)
			}
		}
	}.whileTrue {
		k := k + 1
	};
	a.add(k)
};
a.log.discretePlot
~~~

![](sw/spl/Help/Image/notAnd-A.svg)

Recursive two-parameter sequence allowing Ramanujan’s sum calculation,
OEIS [A282634](https://oeis.org/A282634):

~~~spl
let b:/2 = { :n :m |
	(n = 1).if {
		(m = 0).boole
	} {
		(n > 1).if {
			b(n - 1, m)
			-
			b(n - 1, m - n + 1)
		} {
			0
		}
	}
}.memoize(true);
(1 .. 17).collect { :n |
	(0 .. n - 1).collect { :m |
		let o = (n - 1) / 2 - (m / n);
		(0 .. o.round).sum { :i |
			b(n, i * n + m)
		}
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/sum-B.svg)

Second differences of Stern’s diatomic series,
OEIS [A283104](https://oeis.org/A283104):

~~~spl
150.sternBrocotSequence
.differences(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotSequence-E.svg)

Unique sequence representing an array read by antidiagonals in which the _i_-th row is this sequence itself multiplied by _i_,
OEIS [A283681](https://oeis.org/A283681):

~~~spl
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

Ordinal transform of maximum divisor of _n_,
OEIS [A286477](https://oeis.org/A286477):

~~~spl
1:115.collect { :n |
	n / n.leastPrimeFactor
}.ordinalTransform.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-O.svg)

Ordinal transform of minimal number of factorials that add to _n_,
OEIS [A286478](https://oeis.org/A286478):

~~~spl
0:250.collect { :n |
	n.factorialExpansion.sum
~~~

![](sw/spl/Help/Image/factorialExpansion-B.svg)

Ordinal transform of the restricted growth sequence of least number with the same prime signature as the Doudna sequence entry,
OEIS [A286552](https://oeis.org/A286552):

~~~spl
200.doudnaSequence.collect { :n |
	1:Infinity.detect { :m |
		n.primeSignature
		=
		m.primeSignature
	}
}.restrictedGrowthSequenceTransform
.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/doudnaSequence-E.svg)

Ordinal transform of ones in binary reflected Gray code of _n_,
OEIS [A286558](https://oeis.org/A286558):

~~~spl
0:200.collect { :n |
	n.grayEncode.digitCount(2, 1)
}.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-G.svg)

Restricted growth sequence of least number with the same prime signature as the Doudna sequence entry,
OEIS [A286622](https://oeis.org/A286622):

~~~spl
200.doudnaSequence.collect { :n |
	1:Infinity.detect { :m |
		n.primeSignature
		=
		m.primeSignature
	}
}.restrictedGrowthSequenceTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/doudnaSequence-D.svg)

Lexicographically earliest sequence of distinct positive terms
such that for consecutive terms _w(i+j)≥10_,
OEIS [A287639](https://oeis.org/A287639):

~~~spl
[1].leastExcludedSequence(100) { :a :n :m |
	(a[n - 1] + m).hammingWeight >= 10
}.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-K.svg)

Lexicographically earliest sequence of distinct positive terms
such that for consecutive terms _w(i+j)≥10_,
further terms,
OEIS [A287639](https://oeis.org/A287639):

~~~spl
OeisEntry('A287639').then { :e |
	e.bFileData
	.first(300)
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/hammingWeight-L.svg)

Lexicographically earliest sequence of distinct positive terms
such that for consecutive terms _w(i+j)≥10_,
later segment of further terms,
OEIS [A287639](https://oeis.org/A287639):

~~~spl
OeisEntry('A287639').then { :e |
	e.bFileData
	.copyFromTo(950, 1200)
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/hammingWeight-M.svg)

Fixed point of the mapping _00→0010 01→010 10→000_ starting with _00_,
OEIS [A289016](https://oeis.org/A289016):

~~~spl
[
	[0 0] -> [0 0 1 0],
	[0 1] -> [0 1 0],
	[1 0] -> [0 0 0]
].substitutionSystem([0 0], 8)
.last.discretePlot
~~~

![](sw/spl/Help/Image/substitutionSystem-J.svg)

The ordinal transform of the number of iterations of _φ(x)_ at _n_ needed to reach one,
OEIS [A289152](https://oeis.org/A289152):

~~~spl
1:105.collect { :n |
	eulerPhi:/1
	.nestWhileList(n) { :x |
		x != 1
	}.size - 1
}.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-U.svg)

The arithmetic function _v3(n,3)_,
OEIS [A289435](https://oeis.org/A289435):

~~~spl
2:85.collect { :n |
	n * n.divisors.collect { :d |
		let a = d - 1 - gcd(d, 3);
		((a / 3).floor + 1) / d
	}.max
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisors-S.svg)

A problem related to gerrymandering,
OEIS [A290323](https://oeis.org/A290323):

~~~spl
let f = { :p :e |
	(p = 2).if {
		(e = 1).if {
			2
		} {
			(e % 3).caseOf(
				[
					1 -> { 9 / 5 },
					2 -> { 3 },
					0 -> { 1 }
				]
			) * (5 ^ (e / 3).floor)
		}
	} {
		((p + 1) / 2) ^ e
	}
};
1:200.collect { :n |
	n.factorInteger.collect { :f |
		let [p, e] = f;
		f(p, e)
	}.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/caseOf-A.svg)

The arithmetic function _v±(n,3)_,
OEIS [A290988](https://oeis.org/A290988):

~~~spl
let h = 3;
2:85.collect { :n |
	let d = n.divisors;
	let a = (d - 2) / (2 * h);
	((2 * a.floor + 1) * n / d).max
~~~

![](sw/spl/Help/Image/divisors-R.svg)

Least _k_ such that the _w(k)_ equals the _w(k×n)_,
OEIS [A292849](https://oeis.org/A292849):

~~~spl
1:250.collect { :n |
	1:Infinity.detect { :k |
		k.hammingWeight
		=
		(k * n).hammingWeight
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-I.svg)

Irregular triangle read by rows of _0:2^n-1_ sorted by _w_,
OEIS [A294648](https://oeis.org/A294648):

~~~spl
1:7.collect { :n |
	let m = 2 ^ n - 1;
	[0 .. m].sortOn(hammingWeight:/1)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-G.svg)

Deficiency minus binary weight,
OEIS [A294898](https://oeis.org/A294898):

~~~spl
1:115.collect { :n |
	(2 * n).!.integerExponent(2)
	-
	1.divisorSigma(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-O.svg)

Two-adic valuation of _τ(n)_,
OEIS [A295664](https://oeis.org/A295664):

~~~spl
1:120.collect { :n |
	0.divisorSigma(n).integerExponent(2)
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-G.svg)

The odd numbers interleaved with their negations,
OEIS [A296063](https://oeis.org/A296063):

~~~spl
[-1 1 1].linearRecurrence(
	[1 -1 3], 65
).discretePlot
~~~

![](sw/spl/Help/Image/linearRecurrence-K.svg)

Total variation of base-ten digits of _n_,
OEIS [A297330](https://oeis.org/A297330):

~~~spl
1:150.collect { :n |
	n.integerDigits(10)
	.partition(2, 1)
	.collect { :x |
		x.differences.abs
	}.catenate.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/differences-I.svg)

Moebius transform of largest difference between consecutive divisors of _n_,
OEIS [A300721](https://oeis.org/A300721):

~~~spl
1:85.collect { :n |
	n - (n / n.leastPrimeFactor)
}.moebiusTransform
.discretePlot
~~~

![](sw/spl/Help/Image/moebiusTransform-D.svg)

Distance to nearest perfect power,
OEIS [A301573](https://oeis.org/A301573):

~~~spl
0:250.collect { :n |
	let k = 0;
	{
		(n + k).isPerfectPower | {
			(n - k).isPerfectPower | {
				(n - k) = 1 | {
					(n + k) = 1
				}
			}
		}
	}.whileFalse {
		k := k + 1
	};
	k
}.scatterPlot
~~~

![](sw/spl/Help/Image/isPerfectPower-A.svg)

The ordinal transform of the ordinal transform of _φ(n)_,
OEIS [A303777](https://oeis.org/A303777):

~~~spl
1:85.eulerPhi
.ordinalTransform
.ordinalTransform
.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-B.svg)

Ordinal transform of the ordinal transform of the next prime function,
OEIS [A304106](https://oeis.org/A304106):

~~~spl
1:200.nextPrime
.ordinalTransform
.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/nextPrime-G.svg)

The largest prime factor of the _n_-th term of EKG-sequence,
OEIS [A304733](https://oeis.org/A304733):

~~~spl
115.ekgSequence
.greatestPrimeFactor
.discretePlot
~~~

![](sw/spl/Help/Image/ekgSequence-G.svg)

Ordinal transform of the largest prime factor of the _n_-th term of EKG-sequence,
OEIS [A304734](https://oeis.org/A304734):

~~~spl
250.ekgSequence
.greatestPrimeFactor
.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-H.svg)

A sequence by Rémy Sigrist,
_a(2n)=a(n)+k(n)_ and a(2n+1)=a(n)+3k(n)_,
where _k(n)_ is the least positive integer not leading to a duplicate term in the sequence,
OEIS [A304971](https://oeis.org/A304971):

~~~spl
let m = 300;
let a = [1];
let s = 2L ^ a[1];
1.toDo((m / 2).ceiling) { :n |
	let k = 1;
	let p = a[n];
	{ :break:/0 |
		let q = p + k;
		let r = p + (3 * k);
		(
			(s.bitAt(q + 1) = 0) & {
				s.bitAt(r + 1) = 0
			}
		).ifTrue {
			a := a ++ [q, r];
			s := s + (2 ^ q) + (2 ^ r);
			break()
		};
		k := k + 1
	}.repeatForeverWithBreak
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/bitAt-A.svg)

Concatenation of the current sequence with the lengths of the runs in the sequence,
OEIS [A306211](https://oeis.org/A306211):

~~~spl
let y = { :x |
	x ++ x.split(=).collect(size:/1)
}.iterate([1], 10);
(y - 1).discretePlot
~~~

![](sw/spl/Help/Image/split-A.svg)

_a(n)=o(n-1)+o(n-2)_ where _o(n)_ is the number of occurrences of _a(n)_ in _a_ up to _n_,
OEIS [A306246](https://oeis.org/A306246):

~~~spl
let m = 250;
let o = List(m, 0);
let p = nil;
let q = nil;
1:m.collect { :n |
	let v = (n <= 2).if {
		n
	} {
		q + p
	};
	q := p;
	p := o[1 + v] := o[1 + v] + 1;
	v
}.scatterPlot
~~~

![](sw/spl/Help/Image/plus-A.svg)

Ordinal transform of
OEIS [A306246](https://oeis.org/A306246),
OEIS [A306251](https://oeis.org/A306251):

~~~spl
'A306246'.oeisTerms(250)
.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-I.svg)

Indices of the first occurrences of the _n_-th binary vector in the Ehrenfeucht-Mycielski sequence,
OEIS [A308173](https://oeis.org/A308173):

~~~spl
let x = 500.ehrenfeuchtMycielskiSequence;
(1 .. 7).collect { :i |
	let j = 2 ^ i;
	(0 .. j - 1).collect { :k |
		x.indexOfSubstring(
			k.integerDigits(2, i)
		)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/ehrenfeuchtMycielskiSequence-D.svg)

Walk a rook along a square spiral,
OEIS [A308896](https://oeis.org/A308896):

~~~spl
let k = 6;
let e = (2 * k + 1) ^ 2;
let h = List(2 * k + 1, 0L);
let v = List(2 * k + 1, 0L);
let z = (k + 1) * 1J1;
let n = 0;
let dir = 1;
let w = 1;
let a = [];
{ :break:/0 |
	1.toDo(2) { :t |
		1.toDo(w) { :i |
			let [p, q] = z.realImaginary;
			let u = 1 + v[p].bitOr(h[q]);
			let x = u.integerExponent(2);
			n := n + 1;
			v[p] := v[p] + (2 ^ x);
			h[q] := h[q] + (2 ^ x);
			a.add(x);
			(n = e).ifTrue {
				break()
			};
			z := z + dir
		};
		dir := dir * 0J1
	};
	w := w + 1
}.repeatForeverWithBreak;
a.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-M.svg)

Dirichlet convolution of natural numbers with triangular numbers,
OEIS [A309731](https://oeis.org/A309731):

~~~spl
1:115.collect(
	dirichletConvolve(
		{ :j | j },
		{ :j | j * (j + 1) / 2 }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-D.svg)

In the binary expansion of _n_,
sum the exponents associated with one terms and subtract the exponents associated with zero terms,
OEIS [A309983](https://oeis.org/A309983):

~~~spl
1:85.collect { :n |
	let b = n.binaryExpansion;
	let p = 2 * b.allButLast - 1;
	let k = p.size;
	(p * k:1:-1).sum
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-L.svg)

Alternating sum of the prime indices of _n_,
OEIS [A316524](https://oeis.org/A316524):

~~~spl
1:85.collect { :n |
	n.primeFactors
	.primePi
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/primeFactors-F.svg)

Numerators of rational valued sequence whose Dirichlet convolution with itself yields the ordinal transform of the next prime function,
OEIS [A317830](https://oeis.org/A317830):

~~~spl
let a = Map { :n |
	n.isComposite.if {
		n - n.previousPrime + 1L
	} {
		1L
	}
};
let f = Dictionary { :n |
	(n = 1).if {
		1
	} {
		let p = n.divisors.sum { :d |
			(1 < d & { d < n }).if {
				f[d] * f[n / d]
			} {
				0
			}
		};
		(a[n] - p) / 2
	}
};
f[1:115].numerator.logScale.discretePlot
~~~

![](sw/spl/Help/Image/previousPrime-C.svg)

Dirichlet inverse of the Stern diatomic sequence,
OEIS [A317843](https://oeis.org/A317843):

~~~spl
1:115.collect(
	sternBrocotNumber:/1
	.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-G.svg)

A sequence by I.Gutkovskiy,
OEIS [A318583](https://oeis.org/A318583):

~~~spl
let a:/1 = { :n |
	(n <= 2).if {
		1
	} {
		(n - 2).divisors.sum { :d |
			a(d)
			*
			((n - 2) / d).moebiusMu
		}
	}
}.memoize(true);
1:175.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/moebiusMu-D.svg)

A generalisation of Euler’s totient function,
OEIS [A321029](https://oeis.org/A321029):

~~~spl
let f = { :p :e |
	(p < 7).if {
		p ^ (e - 1)
	} {
		(p - 5) * (p ^ (e - 1))
	}
};
2:125.collect { :n |
	n.factorInteger.collect { :x |
		f(x[1], x[2])
	}.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/factorInteger-C.svg)

Divisor sum _-1^(d-1)*d^2_,
OEIS [A321543](https://oeis.org/A321543):

~~~spl
1:85.collect { :n |
	n.divisorSum { :d |
		-1 ^ (d - 1) * d.square
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisorSum-F.svg)

Restricted growth sequence transform of the ordered pair of two-adic and three-adic valuations,
OEIS [A322026](https://oeis.org/A322026):

~~~spl
1:65.collect { :n |
	[
		n.integerExponent(2),
		n.integerExponent(3)
	]
}.restrictedGrowthSequenceTransform
.discretePlot
~~~

![](sw/spl/Help/Image/restrictedGrowthSequenceTransform-B.svg)

Count the number of occurrences of the _n_-th digit of the sequence among the first _n_ digits,
OEIS [A322182](https://oeis.org/A322182):

~~~spl
let a = [1];
let d = [1];
2.toDo(200) { :i |
	let p = d[i - 1];
	let q = (1 .. i - 1).sum { :j |
		(d[j] = p).boole
	};
	a.add(q);
	d.addAll(q.integerDigits)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/integerDigits-I.svg)

The minimal absolute difference between _n_ and each of the powers of the previous terms,
OEIS [A322522](https://oeis.org/A322522):

~~~spl
let comparePowers = { :n :m |
	(n <= 1).if {
		m - n
	} {
		let a = n;
		{
			a < m
		}.whileTrue {
			a := a * n
		};
		(m - (a / n)).min(a - m)
	}
};
let a = [1];
let b = [1];
150.timesRepeat {
	a.add(
		b.collect { :n |
			let m = a.size + 1;
			n.comparePowers(m)
		}.min
	);
	(a.last > b.last).ifTrue {
		b.add(a.last)
	}
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/whileTrue-A.svg)

Ordinal transform of largest difference between consecutive divisors of _n_,
OEIS [A322871](https://oeis.org/A322871):

~~~spl
2:85.collect { :n |
	n - (n / n.leastPrimeFactor)
}.ordinalTransform.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-C.svg)

Ordinal transform of Moebius transform of largest difference between consecutive divisors of _n_,
OEIS [A322873](https://oeis.org/A322873):

~~~spl
1:85.collect { :n |
	n - (n / n.leastPrimeFactor)
}.moebiusTransform
.ordinalTransform
.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-D.svg)

Ordinal transform of Moebius transform of _φ(n)_,
OEIS [A322874](https://oeis.org/A322874):

~~~spl
1:85.eulerPhi
.moebiusTransform
.ordinalTransform
.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-J.svg)

Count of distinct products,
OEIS [A322967](https://oeis.org/A322967):

~~~spl
OeisEntry('A322967').then { :e |
	e.bFileData
	.first(135)
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/tensorProduct-A.svg)

Dirichlet inverse of the Dedekind ψ function,
OEIS [A323363](https://oeis.org/A323363):

~~~spl
1:115.collect(
	{ :n |
		n * n.divisorSum { :d |
			d.moebiusMu ^ 2 / d
		}
	}.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-E.svg)

Restricted growth sequence transform of Per Nørgård’s infinity sequence,
OEIS [A323907](https://oeis.org/A323907):

~~~spl
85.noergaardInfinitySequence
.restrictedGrowthSequenceTransform
.discretePlot
~~~

![](sw/spl/Help/Image/restrictedGrowthSequenceTransform-A.svg)

_1+Iff(k-1,n-k)_,
OEIS [A327490](https://oeis.org/A327490):

~~~spl
1:12.triangularArray { :n :k |
	1 + bitIff(k - 1, n - k)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitIff-A.svg)

Irregular table read by rows,
initially _1_,
then the ordinal transform of all of the existing terms,
OEIS [A327616](https://oeis.org/A327616):

~~~spl
let a = Map { :n |
	(n = 1).if {
		[1]
	} {
		let m = n - 1;
		a[1:m].catenate.ordinalTransform
	}
};
a[1:9].catenate.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-P.svg)

Number of ones in the base-φ representation of _n_ modulo two,
OEIS [A330037](https://oeis.org/A330037):

~~~spl
let phi = 1.goldenRatio;
let c = 2:125.collect { :n |
	let e = n.betaExpansion(phi, 32);
	e[1].sum
};
(c % 2).discretePlot
~~~

![](sw/spl/Help/Image/betaExpansion-C.svg)

Least nonnegative integer _k_ such that _xor(n,k)_ is a cube,
OEIS [A330271](https://oeis.org/A330271):

~~~spl
0:127.collect { :n |
	0:Infinity.detect { :k |
		n.bitXor(k).cubeRoot.isInteger
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/cubeRoot-B.svg)

Integers whose Dual Zeckendorf representation is palindromic,
OEIS [A331191](https://oeis.org/A331191):

~~~spl
0:500.select { :n |
	n.dualZeckendorfRepresentation
	.isPalindrome
}.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-E.svg)

For _n>1_, _T(n,k)_ is the count of _k_ in the rows up to _n_,
OEIS [A333867](https://oeis.org/A333867):

~~~spl
let t = [[1]];
1:17.do { :n |
	let u = t.flatten;
	let v = u.max;
	t.add(
		1:v.collect { :m |
			u.occurrencesOf(m)
		}
	)
};
t.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/occurrencesOf-B.svg)

Numbers whose binary expansion generates rotationally symmetric _xor_-triangles,
OEIS [A334556](https://oeis.org/A334556):

~~~spl
OeisEntry('A334556').then { :e |
	e.data.discretePlot
}
~~~

![](sw/spl/Help/Image/xorTriangle-D.svg)

Numbers whose binary expansion generate rotationally symmetrical _xor_-triangles that have central triangles of zeros,
OEIS [A334769](https://oeis.org/A334769):

~~~spl
OeisEntry('A334769').then { :e |
	e.data.discretePlot
}
~~~

![](sw/spl/Help/Image/xorTriangle-E.svg)

Minimal common prime of two Goldbach partitions of _2n_ and _2(n+1)_,
or zero if no common prime exists,
OEIS [A335045](https://oeis.org/A335045):

~~~spl
let d = Map { :n |
	[1 1].frobeniusSolve(2 * n)
	.select { :x |
		x.allSatisfy(isPrime:/1)
	}.catenate
};
2:55.collect { :n |
	let e = intersection(d[n], d[n + 1]);
	e.isEmpty.if {
		0
	} {
		e.min
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/frobeniusSolve-G.svg)

The Nim _k_-th power of _n_,
array read by upward antidiagonals,
OEIS [A335162](https://oeis.org/A335162):

~~~spl
0:17.antidiagonalArray(nimPower:/2)
.collect(reverse:/1).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/nimMultiplication-W.svg)

Array read by antidiagonals,
places are the digit sum of _n×k_,
OEIS [A336225](https://oeis.org/A336225):

~~~spl
0:17.antidiagonalArray { :n :k |
	(n * k).digitSum
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/digitSum-D.svg)

Squarefree kernel of _n_ divided by the squarefree part of _n_,
_r(n)/c(n)_,
OEIS [A336643](https://oeis.org/A336643):

~~~spl
1:85.collect { :n |
	n.radical / n.squareFreePart
}.stepPlot
~~~

![](sw/spl/Help/Image/radical-G.svg)

Two-adic valuation of _σ(n)_,
OEIS [A336937](https://oeis.org/A336937):

~~~spl
1:120.collect { :n |
	1.divisorSigma(n).integerExponent(2)
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-H.svg)

Ordinal transform of edited
OEIS [A143771](https://oeis.org/A143771),
OEIS [A339914](https://oeis.org/A339914):

~~~spl
let a = 1:200.collect { :n |
	n.divisors.collect { :d |
		d + (n / d)
	}.gcd
};
a[1] := 1;
a.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-E.svg)

A variant of the Van Eck sequence,
c.f. `vanEckSequence`,
OEIS [A340488](http://oeis.org/A340488):

~~~spl
let a = [0];
let r = [0];
0.toDo(250) { :n |
	let x = a.last;
	let y = nil;
	(x + 1 > r.size).ifTrue {
		r.add(0)
	};
	y := x.bitXor(r[x + 1]);
	r[x + 1] := r[x + 1] + 1;
	a.add(y)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/bitXor-O.svg)

The inventory sequence,
discrete plot,
OEIS [A342585](https://oeis.org/A342585):

~~~spl
99.inventorySequence.discretePlot
~~~

![](sw/spl/Help/Image/inventorySequence-A.svg)

The inventory sequence,
log scale scatter plot,
OEIS [A342585](https://oeis.org/A342585):

~~~spl
333
.inventorySequence
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/inventorySequence-B.svg)

The first _k_ terms of the inventory sequence,
OEIS [A342585](https://oeis.org/A342585):

~~~spl
let k = 200;
let a = [];
let c = 0;
let n = 0;
let f = 1.toDo(k) { :i |
	let n = a.occurrencesOf(c);
	a.add(n);
	(n = 0).if {
		c := 0
	} {
		c := c + 1
	}
};
a.collect { :n |
	n.isZero.if { 0 } { n.log }
}.scatterPlot
~~~

![](sw/spl/Help/Image/occurrencesOf-A.svg)

_gcd(1+n,ψ(n))_,
OEIS [A342915](https://oeis.org/A342915):

~~~spl
1:65.collect { :n |
	(1 + n).gcd(n.dedekindPsi)
}.discretePlot
~~~

![](sw/spl/Help/Image/dedekindPsi-C.svg)

Number of ones in the binary expansion of _n_ which have an even number of zeroes at less significant positions,
OEIS [A343029](https://oeis.org/A343029):

~~~spl
0:65.collect { :n |
	let b = n.binaryExpansion.reverse;
	let z = 0;
	let p = 0;
	b.do { :i |
		(i = 0).if {
			z := z + 1
		} {
			z.isEven.ifTrue {
				p := p + 1
			}
		}
	};
	p
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-A.svg)

Number of ones in the binary expansion of _n_ which have an odd number of zeroes at less significant positions,
OEIS [A343030](https://oeis.org/A343030):

~~~spl
0:65.collect { :n |
	let b = n.binaryExpansion.reverse;
	let z = 0;
	let q = 0;
	b.do { :i |
		(i = 0).if {
			z := z + 1
		} {
			z.isOdd.ifTrue {
				q := q + 1
			}
		}
	};
	q
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-B.svg)

First differences of the regular paperfolding sequence,
OEIS [A343173](https://oeis.org/A343173):

~~~spl
115.regularPaperfoldingSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/regularPaperfoldingSequence-D.svg)

A sequence by David James Sycamore,
OEIS [A343887](https://oeis.org/A343887):

~~~spl
let a = [1];
let s = [];
let m = 250;
1.toDo(m) { :i |
	let p = a.last;
	let q = a.allButLast;
	let r = nil;
	q.includes(p).not.if {
		a.add(q.count { :x | x > p })
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

![](sw/spl/Help/Image/secondLast-A.svg)

The ordinal transform of _gcd(1+n,ψ(n))_,
OEIS [A344771](https://oeis.org/A344771):

~~~spl
1:65.collect { :n |
	(1 + n).gcd(n.dedekindPsi)
}.ordinalTransform.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-R.svg)

A sequence by David James Sycamore,
OEIS [A345147](https://oeis.org/A345147):

~~~spl
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

Ordinal transform of Kempner function,
OEIS [A345934](https://oeis.org/A345934):

~~~spl
1:250.kempnerFunction
.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-K.svg)

Shadow transform of `fibonacci`,
OEIS [A346080](https://oeis.org/A346080):

~~~spl
0:115.fibonacci
.shadowTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/shadowTransform-E.svg)

A variant of the inventory sequence,
OEIS [A347738](https://oeis.org/A347738):

~~~spl
let b = [1: 0];
let a = Map { :n |
	(n = 1).if {
		0
	} {
		let m = n - 1;
		let t = (a[n - 1] = 0).if {
			0
		} {
			b[n - 1] + 1
		};
		b[n] := t;
		1:m.sum { :j |
			(a[j] >= t).boole
		}
	}
};
a[1:150].scatterPlot
~~~

![](sw/spl/Help/Image/sum-I.svg)

Count Nim-factors,
OEIS [A348291](https://oeis.org/A348291):

~~~spl
let k = 85;
let t = nimMultiplication:/2.table(1:k, 1:k);
2:k.collect { :n |
	let m = n - 1;
	1:m.sum { :i |
		1:m.sum { :j |
			(t[i][j] = n).boole
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/nimMultiplication-Y.svg)

Dirichlet inverse of the amusical permutation function,
OEIS [A349351](https://oeis.org/A349351):

~~~spl
1:115.collect(
	amusicalPermutation:/1
	.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-H.svg)

Sum of the amusical permutation and it’s dirichlet inverse,
OEIS [A349352](https://oeis.org/A349352):

~~~spl
let f:/1 = amusicalPermutation:/1;
let g:/1 = f:/1.dirichletInverse;
1:115.collect { :n |
	f(n) + g(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-I.svg)

_Σ0:n|n_,
OEIS [A350093](https://oeis.org/A350093):

~~~spl
0:63.collect { :n |
	0:n.sum { :i |
		n.bitOr(i)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-H.svg)

Row sums of triangle of _¬n&k_,
also called the converse nonimplication,
OEIS [A350094](https://oeis.org/A350094):

~~~spl
0:63.triangularArray { :n :k |
	n.bitNot.bitAnd(k)
}.collect(sum:/1).scatterPlot
~~~

![](sw/spl/Help/Image/bitNot-C.svg)

Array read by antidiagonals,
places are the digital root of _n×k_,
OEIS [A353109](https://oeis.org/A353109):

~~~spl
0:21.antidiagonalArray { :n :k |
	(n * k).digitalRoot(10)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/digitalRoot-C.svg)

Is _n_ an odd number with an even number of prime factors,
OEIS [A353557](https://oeis.org/A353557):

~~~spl
1:121.collect { :n |
	n.isOdd & {
		n.primeOmega.isEven
	}
}.boole.discretePlot
~~~

![](sw/spl/Help/Image/primeOmega-E.svg)

Irregular array read by rows where row _k_ lists the run-sums of the _k_-th composition in standard order,
OEIS [A353932](https://oeis.org/A353932):

~~~spl
1:5.collect { :n |
	n.integerCompositions
	.reverseLexicographicSort
	.collect { :c |
		c.split(=).collect(sum:/1)
	}
}.catenate.catenate.discretePlot
~~~

![](sw/spl/Help/Image/reverseLexicographicSort-E.svg)

The largest five-smooth divisor of _n_,
OEIS [A355582](https://oeis.org/A355582):

~~~spl
1:65.collect { :n |
	[2 3 5].product { :b |
		b ^ n.integerExponent(b)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/integerExponent-P.svg)

_C(2n,n)C(n,k)_,
OEIS [A356546](https://oeis.org/A356546):

~~~spl
0:10.triangularArray { :n :k |
	binomial(2 * n, n) * binomial(n, k)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-Q.svg)

First differences of integer compositions in reverse lexicographic order,
OEIS [A358133](https://oeis.org/A358133):

~~~spl
1:6.collect { :n |
	n.integerCompositions
	.reverseLexicographicSort
}.catenate.collect(differences:/1)
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/reverseLexicographicSort-D.svg)

Characteristic function for
numbers not divisible by _p^p_ for any prime _p_,
OEIS [A359550](https://oeis.org/A359550):

~~~spl
2:85.collect { :n |
	n.factorInteger.collect { :f |
		f[1] > f[2]
	}.boole.product > 0
}.boole.discretePlot
~~~

![](sw/spl/Help/Image/factorInteger-N.svg)

Triangle where _(n,k)_ is the number of integer partitions of _n_ with median _k_,
where _k_ ranges from one to _n_ in steps of one half,
OEIS [A359893](https://oeis.org/A359893):

~~~spl
Range(1, 10, 1).collect { :n |
	Range(1, n, 1/2).collect { :k |
		n.integerPartitions.select { :p |
			p.median = k
		}.size
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/median-B.svg)

The number of integer partitions of _n_ with median _k_,
OEIS [A359901](https://oeis.org/A359901):

~~~spl
1:12.triangularArray { :n :k |
	n.integerPartitions.count { :p |
		p.median = k
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/integerPartitions-I.svg)

A sequence by David James Sycamore,
OEIS [A360179](https://oeis.org/A360179):

~~~spl
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

One for zero else zero in Nørgård’s infinity sequence,
OEIS [A361016](https://oeis.org/A361016):

~~~spl
200.noergaardInfinitySequence
.collect(isZero:/1).boole.discretePlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-F.svg)

Restricted growth sequence transform of the ordered pair of counts of ones in the binary expansion of _n_ which have an even and odd number of zeroes at less significant positions,
OEIS [A361020](https://oeis.org/A361020):

~~~spl
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

_a(n)%4=3_,
where _a_ is the delayed divison of the Cloitre sequence,
OEIS [A361463](https://oeis.org/A361463):

~~~spl
let c = 1L.rowlandsSequence(200, lcm:/2);
let a = c.adjacentPairsCollect(/.swap) - 1;
((a % 4) =.each 3).boole.discretePlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-I.svg)

`gcd` of the Cloitre sequence and offset indices,
OEIS [A361470](https://oeis.org/A361470):

~~~spl
let k = 100;
1L.rowlandsSequence(k - 1, lcm:/2)
.gcd(2:k)
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-H.svg)

A variant of a sequence by David James Sycamore,
OEIS [A361511](https://oeis.org/A361511):

~~~spl
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

The _1,3_ Kolakoski sequence,
OEIS [A362927](https://oeis.org/A362927),
minus two:

~~~spl
(85.kolakoskiSequence([1 3]) - 2)
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-M.svg)

An experimental sequence by D.J. Sycamore,
OEIS [A366601](https://oeis.org/A366601):

~~~spl
let a = { :n |
	let m = integerExponent(n, 2) + 1;
	bitShiftRight(n, m)
};
let c = [0];
250.timesRepeat {
	let x = c.last;
	let k = c.occurrencesOf(x);
	(k = 1).if {
		let i = a(x + 1);
		let j = c[i + 1];
		c.add(j)
	} {
		c.add(k - 1)
	}
};
c.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-D.svg)

The ordinal transform of the final nonzero digits of _n!_,
OEIS [A367799](https://oeis.org/A367799):

~~~spl
let a = 0:85.!.withoutTrailingZeroes % 10;
a.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-Q.svg)

The ordinal transform of the leading digits of _n!_,
OEIS [A368010](https://oeis.org/A368010):

~~~spl
let n = 0:115.!;
(n // (10 ^ n.log10.floor))
.ordinalTransform.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-S.svg)

Initial segment of table of iterations,
read by rising antidiagonals.
OEIS [A368179](https://oeis.org/A368179):

~~~spl
let k = 16;
let a = 0:k.collect { :n |
	amusicalPermutation:/1
	.nestList(n, k)
};
let b = [];
1:k.sum.antidiagonalIndicesDo { :i :j |
	b.add(a[j][i])
};
b.log.discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-J.svg)

The binary expansion of _3n+1_,
substituting _01_ for all trailing _0_ following the odd part,
OEIS [A371094](https://oeis.org/A371094):

~~~spl
0:150.collect { :n |
	let m = 1 + (3 * n);
	let e = m.integerExponent(2);
	(m * (2 ^ e)) + (((4 ^ e) - 1) / 3)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerExponent-I.svg)

The ordinal transform of the binary expansion of _n_ modulo two and contracted,
OEIS [A371944](https://oeis.org/A371944):

~~~spl
1:115.collect { :n |
	let b = n.binaryExpansion;
	let o = b.ordinalTransform;
	(o % 2).binaryContraction
}.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-T.svg)

Second differences of sequence of nonsquarefree numbers,
OEIS [A376593](https://oeis.org/A376593):

~~~spl
1:150.reject(isSquareFree:/1)
.differences(2).discretePlot
~~~

![](sw/spl/Help/Image/isSquareFree-E.svg)

Second differences of Kolakoski sequence,
OEIS [A376604](https://oeis.org/A376604):

~~~spl
115.kolakoskiSequence
.differences(2)
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-I.svg)

The least integer, absolutely, not yet in the sequence such that the _|a(n-1)-a(n)|_ is a square,
OEIS [A377091](https://oeis.org/A377091):

~~~spl
let m = 85;
let s = IdentitySet([0]);
{ :x |
	let a = 1:Infinity.detect { :i |
		s.includes(i).not | {
			s.includes(-i).not
		}
	};
	{
		s.includes(a) | {
			(x - a).abs
			.isPerfectSquare
			.not
		}
	}.whileTrue {
		a := (a < 0).boole - a
	};
	s.add(a);
	a
}.nestList(0, m).discretePlot
~~~

![](sw/spl/Help/Image/isPerfectSquare-D.svg)

Ordinal transform of the largest five-smooth divisor of _n_,
OEIS [A379006](https://oeis.org/A379006):

~~~spl
1:115.collect { :n |
	[2 3 5].product { :b |
		b ^ n.integerExponent(b)
	}
}.ordinalTransform.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-F.svg)

The lexicographically earliest sequence of positive numbers which is identical to the run lengths of its first differences,
OEIS [A380317](https://oeis.org/A380317):

~~~spl
OeisEntry('A380317').then { :e |
	e.bFileData
	.first(300)
	.linePlot
}
~~~

![](sw/spl/Help/Image/OeisEntry-E.svg)

Sequence which is the partial sums of the proper divisors of its own elements,
OEIS [A389395](https://oeis.org/A389395):

~~~spl
let a = [1 2 4 5 6 8 11];
6:17.do { :i |
	let p = a.last;
	let q = a[i].divisors.allButLast;
	a := a ++ (p + q.prefixSum)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/prefixSum-D.svg)

Sequence which is the partial sums of the divisors of its own elements,
OEIS [A389395](https://oeis.org/A389395):

~~~spl
let a = [1 2 4 5 7 11];
4:17.do { :i |
	let p = a.last;
	let q = a[i].divisors;
	a := a ++ (p + q.prefixSum)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/prefixSum-F.svg)

First differences of sequence which is the partial sums of the proper divisors of its own elements,
OEIS [A389613](https://oeis.org/A389613):

~~~spl
let a = [1 2 4 5 6 8 11];
6:27.do { :i |
	let p = a.last;
	let q = a[i].divisors.allButLast;
	a := a ++ (p + q.prefixSum)
};
a.differences.discretePlot
~~~

![](sw/spl/Help/Image/prefixSum-E.svg)

Restricted growth sequence transform of the ordered triple of binary carry sequence and the counts of ones in the binary expansion of _n_ which have an even and odd number of zeroes at less significant positions,
OEIS [A389896](https://oeis.org/A389896):

~~~spl
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

Array read by antidiagonals,
places are the integer reverse of _n×k_,
OEIS [A391365](https://oeis.org/A391365):

~~~spl
0:17.antidiagonalArray { :n :k |
	(n * k).integerReverse
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-I.svg)

Numbers that have only one largest digit _m_ and where the sum of the digits is equal to _2m_,
OEIS [A393832](https://oeis.org/A393832):

~~~spl
0:1200.select { :n |
	let d = n.integerDigits;
	let m = d.max;
	d.occurrencesOf(m) = 1 & {
		d.sum = (2 * m)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/occurrencesOf-C.svg)
