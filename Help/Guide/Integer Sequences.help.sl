# Integer Sequences

Scatter plot of OEIS [A063543](https://oeis.org/A063543):

~~~
1:2000.collect { :n |
	n - n.integerDigits.reject(isZero:/1).product
}.scatterPlot
~~~

OEIS [A117966](https://oeis.org/A117966):

~~~
>>> { :i |
>>> 	i.integerDigits(3).collect { :n |
>>> 		(n = 2).if { -1 } { n }
>>> 	}.fromDigits(3)
>>> }.map(0:59)
[
	  0  1 -1  3   4   2  -3  -2  -4   9
	 10  8 12 13  11   6   7   5  -9  -8
	-10 -6 -5 -7 -12 -11 -13  27  28  26
	 30 31 29 24  25  23  36  37  35  39
	 40 38 33 34  32  18  19  17  21  22
	 20 15 16 14 -27 -26 -28 -24 -23 -25
]
~~~

OEIS [A265326](https://oeis.org/A265326):

```
>>> { :n |
>>> 	let m = n.nthPrime;
>>> 	m - m.integerDigits(2).reversed.fromDigits(2)
>>> }.map(1:60)
[
	  1   0   0   0  -2    2   0   -6  -6   6
	  0  -4   4 -10 -14   10   4   14 -30 -42
	  0 -42 -18  12  30   18 -12    0  18  42
	  0 -62  -8 -70 -20  -82 -28  -34 -62  -8
	-26   8 -62  62  34  -28   8  -28  28  62
	 82  -8  98  28   0 -186 -84 -210 -60 -24
]
```

Scatter plot of the first _k_ terms of OEIS [A342585](https://oeis.org/A342585):

~~~
let k = 1500;
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
a.collect { :n | n.isZero.if { 0 } { n.log } }.scatterPlot
~~~

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
- `digitCount`: A006046
- `digitalRoot`: A010888
- `divisorSigma`: A000005
- `doubleFactorial`: A000165
- `eulerGradusSuavitatis`: A275314
- `eulerPhi`: A002088
- `factorial`: A000435
- `fareySequence`: A005728 A006842 A006843
- `fibonacciSequence`: A000045
- `fibonacciWord`: A003849
- `fibonacci`: A000045
- `fromDigits`: A019518
- `grayEncode`: A014550 A003188
- `harmonicNumber`: A002805 A001008
- `integerDigits`: A062756 A364024 A007376 A265326 A117966
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
- `narayanaNumber`: A001263
- `narayanaSequence`: A000930
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
