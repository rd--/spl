# grayEncode

- _grayEncode(anInteger)_

Encode _anInteger_ using binary reflected Gray code.
A Gray code is an encoding of numbers so that adjacent numbers have a single digit differing by 1.
The inverse is `grayDecode`.

```
>>> 0:15.collect { :n |
>>> 	let e = n.grayEncode;
>>> 	let d = e.grayDecode;
>>> 	[n, e, d].collect { :i |
>>> 		i.integerDigits(2).stringJoin
>>> 	}
>>> }
[
	'0' '0' '0';
	'1' '1' '1';
	'10' '11' '10';
	'11' '10' '11';
	'100' '110' '100';
	'101' '111' '101';
	'110' '101' '110';
	'111' '100' '111';
	'1000' '1100' '1000';
	'1001' '1101' '1001';
	'1010' '1111' '1010';
	'1011' '1110' '1011';
	'1100' '1010' '1100';
	'1101' '1011' '1101';
	'1110' '1001' '1110';
	'1111' '1000' '1111'
]
```

Scatter plot of the gray encodings of the first two-thousand integers:

~~~
0:2000.collect(grayEncode:/1).scatterPlot
~~~

* * *

See also: Binary, bitShiftRight, bitXor, grayDecode

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html)
[2](https://mathworld.wolfram.com/GrayCode.html),
_OEIS_
[1](https://oeis.org/A014550)
[2](https://oeis.org/A003188),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)
