# isRoughNumber

- _isRoughNumber(n, k)_

Answer `true` if the integer _n_ is a _k_-rough number,
a positive integer all of whose prime factors are greater than or equal to _k_.

Find the seven-rough numbers up to one hundred,
OEIS [A007775](https://oeis.org/A007775):

>>> 1:100.select { :each |
>>> 	each.isRoughNumber(7)
>>> }
[
	 1  7 11 13 17 19 23 29 31 37
	41 43 47 49 53 59 61 67 71 73
	77 79 83 89 91 97
]
```

Find the eleven-rough numbers up to three hundred,
OEIS [A008364](https://oeis.org/A008364):

```
>>> 1:300.select { :each |
>>> 	each.isRoughNumber(11)
>>> }
[
	  1  11  13  17  19
	 23  29  31  37  41
	 43  47  53  59  61
	 67  71  73  79  83
	 89  97 101 103 107
	109 113 121 127 131
	137 139 143 149 151
	157 163 167 169 173
	179 181 187 191 193
	197 199 209 211 221
	223 227 229 233 239
	241 247 251 253 257
	263 269 271 277 281
	283 289 293 299
]
```

First differences of 7-rough numbers,
this sequence has period eight:

```
>>> 1:100.select { :each |
>>> 	each.isRoughNumber(7)
>>> }.differences
[
	6 4 2 4 2 4 6 2
	6 4 2 4 2 4 6 2
	6 4 2 4 2 4 6 2
	6
]
```

Plot first differences of 11-rough numbers,
this sequence has period 48,
OEIS [A049296](https://oeis.org/A049296):

~~~spl svg=A
1:450.select { :each |
	each.isRoughNumber(11)
}.differences.scatterPlot
~~~

![](sw/spl/Help/Image/isRoughNumber-A.svg)

Plot first differences of 13-rough numbers:

~~~spl svg=B
1:500.select { :each |
	each.isRoughNumber(13)
}.differences.scatterPlot
~~~

![](sw/spl/Help/Image/isRoughNumber-B.svg)

Plot first differences of 17-rough numbers:

~~~spl svg=C
1:600.select { :each |
	each.isRoughNumber(17)
}.differences.scatterPlot
~~~

![](sw/spl/Help/Image/isRoughNumber-C.svg)

Plot first differences of 19-rough numbers:

~~~spl svg=D
1:650.select { :each |
	each.isRoughNumber(19)
}.differences.scatterPlot
~~~

![](sw/spl/Help/Image/isRoughNumber-D.svg)

Plot first differences of 23-rough numbers:

~~~spl svg=E
1:750.select { :each |
	each.isRoughNumber(23)
}.differences.scatterPlot
~~~

![](sw/spl/Help/Image/isRoughNumber-E.svg)

* * *

See also: allSatisfy, isSmoothNumber, primeFactors

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RoughNumber.html),
_OEIS_
[1](https://oeis.org/A007775)
[2](https://oeis.org/A008364)
[3](https://oeis.org/A049296),
_W_
[1](https://en.wikipedia.org/wiki/Rough_number)

Categories: Testing
