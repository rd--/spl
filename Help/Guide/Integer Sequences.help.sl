# Integer Sequences

Scatter plot of every fourth item of the first few terms of OEIS [A063543](https://oeis.org/A063543):

~~~spl svg=A
1:4:1000.collect { :n |
	let d = n.integerDigits;
	n - d.reject(isZero:/1).product
}.scatterPlot
~~~

![](<sw/spl/Help/Image/Integer Sequences-A.svg>)

Scatter plot of the first few terms of OEIS [A117966](https://oeis.org/A117966):

~~~spl svg=B
0:123.collect { :i |
	i.integerDigits(3).collect { :n |
		(n = 2).if { -1 } { n }
	}.fromDigits(3)
}.scatterPlot
~~~

![](<sw/spl/Help/Image/Integer Sequences-B.svg>)

Scatter plot of the first few terms of OEIS [A265326](https://oeis.org/A265326):

~~~spl svg=C
1:60.collect { :n |
	let m = n.nthPrime;
	let d = m.integerDigits(2);
	m - d.reversed.fromDigits(2)
}.scatterPlot
~~~

![](<sw/spl/Help/Image/Integer Sequences-C.svg>)

Scatter plot of the first _k_ terms of OEIS [A342585](https://oeis.org/A342585):

~~~spl svg=D
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

![](<sw/spl/Help/Image/Integer Sequences-D.svg>)

The following help files include references to integer sequences:

- `additivePersistence`: A031286
- `arithmeticGeometricMean`: A068521 A084895 A084896 A084897
- `bellNumber`: A000110
- `bernoulli`: A000367 A002445
- `bitAnd`: A279125
- `bitReversalPermutation`: A030109
- `bitXor`: A003188
- `brunsConstant`: A065421
- `calkinWilfSequence`: A002487
- `cantorStaircase`: A095844 A095845
- `catalanNumber`: A000108
- `catalanTriangle`: A009766
- `delannoySequence`: A008288
- `digitCount`: A000120 A006046
- `digitalRoot`: A010888
- `divisorSigma`: A000005
- `doubleFactorial`: A000165
- `eulerGradusSuavitatis`: A275314
- `eulerNumber`: A000111 A000364 A028296
- `eulerPhi`: A002088
- `factorial`: A000435
- `fareySequence`: A005728 A006842 A006843
- `fibonacciSequence`: A000045
- `fibonacciWord`: A003849
- `fibonacci`: A000045
- `fromDigits`: A019518
- `gouldsNumber`: A001316
- `gouldsSequence`: A001316
- `grayEncode`: A014550 A003188
- `harmonicNumber`: A002805 A001008
- `integerDigits`: A062756 A364024 A007376 A265326 A117966
- `inventorySequence`: A342585
- `isAlmostPrime`: A000040 A001358 A046308 A069272
- `isLesserTwinPrime`: A001359 A014574 A006512
- `isPerfectNumber`: A000396
- `isPerfectSquare`: A000290
- `isPowerfulNumber`: A001694 A118896 A060355
- `isPrimePower`: A246655
- `isSmoothNumber`: A000079 A003586 A051037 A002473 A051038 A080197 A080681 A080682 A080683
- `iterate`: A014707
- `keplerTree`: A294442 A020651
- `lassalleNumber`: A180874
- `linearRecurrence`: A000931 A000204 A000129 A002203 A001608
- `liouvilleLambda`: A008836
- `lobbNumber`: A039599
- `lucasNumber`: A000032
- `lucasNumbers`: A000032
- `lyndonWords`: A001037
- `metallicMean`: A001622 A014176 A098316 A098317 A098318
- `minkowskiQuestionMark`: A048819
- `moebiusMu`: A008683
- `motzkinSequence`: A001006
- `narayanaNumber`: A001263
- `narayanaSequence`: A000930
- `noergaardInfinitySequence`: A004718 A073334
- `nthPrimeGap`: A001223
- `padovanSequence`: A000931 A001608 A182097
- `pascalTriangle`: A007318
- `pellLucasNumbers`: A002203
- `pellNumbers`: A000129 A086383 A096650
- `perrinFunction`: A001608 A112881
- `perrinSequence`: A001608
- `plasticRatio`: A060006
- `polygonalNumber: A000217 A139610
- `recamanSequence`: A005132
- `schroderSequence`: A006318
- `silverConstant`: A116425
- `silverRatio`: A014176
- `sternBrocotNumber`: A002487
- `sternBrocotSequence`: A002487
- `stolarskyArray`: A035506
- `stolarskyHarborthConstant`: A006046 A077464
- `supergoldenRatio`: A092526
- `supersilverRatio`: A356035
- `thueMorseSequence`: A010060
- `vanDerCorputNumber`: A030101 A030102
- `vanDerLaanSequence`: A182097
- `vedicSquare`: A125959 A180592 A180593 A180594
- `wythoffArray`: A003622 A035513
- `wythoffLower`: A000201
- `wythoffPair`: A000201 A001950
- `wythoffUpper`: A001950
- `zeckendorfRepresentation`: A014417

* * *

Guides: Magic Squares, Mathematical Sequences
