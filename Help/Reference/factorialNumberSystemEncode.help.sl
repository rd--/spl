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

* * *

See also: factorial, factorialExpansion, factorialNumberSystemDecode

Guides: Mathematical Functions

References:
_OEIS_
[1](https://oeis.org/A007623),
_W_
[1](https://en.wikipedia.org/wiki/Factorial_number_system)
