# Integer Sequences

Scatter plot of Oeis [A063543](https://oeis.org/A063543):

~~~
{ :n |
	n - n.integerDigits.reject(isZero:/1).product
}.map(1:2000).scatterPlot
~~~

Oeis [A117966](https://oeis.org/A117966):

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

Map[FromDigits[#, 3] &, IntegerDigits[#, 3] /. 2 -> -1 & /@ Range@ 80] (* Michael De Vlieger, Nov 17 2015 *)

Oeis [A265326](https://oeis.org/A265326):

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
