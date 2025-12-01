# factorialNumberSystemEncode

- _factorialNumberSystemEncode(n)_

Encode the integer _n_ into the factorial number system.

Encode _719_:

```
>>> 719.factorialNumberSystemEncode
54321

>>> 54321.factorialNumberSystemDecode
719
```

Threads over lists:

```
>>> [0 .. 50]
>>> .factorialNumberSystemEncode
>>> .factorialNumberSystemDecode
[0 .. 50]
```

First few terms,
OEIS [A007623](https://oeis.org/A007623):

```
>>> [0 .. 50]
>>> .factorialNumberSystemEncode
[
	   0    1   10   11   20
	  21  100  101  110  111
	 120  121  200  201  210
	 211  220  221  300  301
	 310  311  320  321 1000
	1001 1010 1011 1020 1021
	1100 1101 1110 1111 1120
	1121 1200 1201 1210 1211
	1220 1221 1300 1301 1310
	1311 1320 1321 2000 2001
	2010
]
```

Integers whose factorial expansion ends with one,
OEIS [A071156](https://oeis.org/A071156):

```
>>> 0:14.collect(oeisA071156:/1)
[0 1 3 5 9 11 15 17 23 33 35 39 41 47 57]
```

Th factorial number system encoding of A071156,
OEIS [A071158](https://oeis.org/A071158):

```
>>> 1:39.collect { :n |
>>> 	n.oeisA071156
>>> 	.factorialNumberSystemEncode
>>> }
[
	    1
	   11
	   21
	  111
	  121
	  211
	  221
	  321
	 1111
	 1121
	 1211
	 1221
	 1321
	 2111
	 2121
	 2211
	 2221
	 2321
	 3211
	 3221
	 3321
	 4321
	11111
	11121
	11211
	11221
	11321
	12111
	12121
	12211
	12221
	12321
	13211
	13221
	13321
	14321
	21111
	21121
	21211
]
```

The terms of A071156 can be calculated from A014486 using
OEIS [A085198](https://oeis.org/A085198):

~~~spl svg=A
0:150.collect(oeisA085198:/1)
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/factorialNumberSystemEncode-A.svg)

* * *

See also: factorial, factorialExpansion, factorialNumberSystemDecode

Guides: Mathematical Functions

References:
_OEIS_
[1](https://oeis.org/A007623)
[2](https://oeis.org/A071156)
[3](https://oeis.org/A071158),
_W_
[1](https://en.wikipedia.org/wiki/Factorial_number_system)
