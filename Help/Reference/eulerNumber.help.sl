# eulerNumber

- _eulerNumber(n)_

Answer the _n_-th Euler number.

Calculate Euler numbers:

```
>>> 14.eulerNumber
-199360981

>>> 16.eulerNumber
19391512145

>>> 18.eulerNumber
-2404879675441

>>> 20.eulerNumber
370371188237525

>>> 22L.eulerNumber
-69348874393137901L
```

The first ten Euler numbers,
OEIS [A122045](https://oeis.org/A122045):

```
>>> [0 .. 10].collect(eulerNumber:/1)
[1 0 -1 0 5 0 -61 0 1385 0 -50521]
```

The first ten non-zero Euler numbers,
OEIS [A028296](https://oeis.org/A028296):

```
>>> [0, 2 .. 18].collect(eulerNumber:/1)
[
	1
	-1
	5
	-61
	1385
	-50521
	2702765
	-199360981
	19391512145
	-2404879675441
]
```

The Euler or up/down numbers,
OEIS [A000111](https://oeis.org/A000111):

```
>>> 0:26.collect { :n |
>>> 	n.isEven.if {
>>> 		n.eulerNumber.abs
>>> 	} {
>>> 		let a = n + 1;
>>> 		let b = 2 ^ a;
>>> 		let c = a.bernoulliNumber;
>>> 		let d = b * (b - 1) * c;
>>> 		(c / d).abs
>>> 	}
>>> }
[
	1
	1
	1
	2
	5
	16
	61
	272
	1385
	7936
	50521
	353792
	2702765
	22368256
	199360981
	1903757312
	19391512145
	209865342976
	2404879675441
	29088885112832
	370371188237525
	4951498053124096
	69348874393137901L
	1015423886506852352L
	15514534163557086905L
	246921480190207983616L
	4087072509293123892361L
]
```

The sequence of Euler numbers modulo a fixed number is periodic:

~~~spl svg=A
1:50.collect { :n |
	(2L * n).eulerNumber % 17
}.discretePlot
~~~

![](sw/spl/Help/Image/eulerNumber-A.svg)

* * *

See also: bernoulliNumber, eulerGamma

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerNumber.html)
[2](https://reference.wolfram.com/language/ref/EulerE.html),
_OEIS_
[1](https://oeis.org/A122045)
[2](https://oeis.org/A000111)
[3](https://oeis.org/A000364)
[4](https://oeis.org/A028296)
[5](https://oeis.org/A000111),
_W_
[1](https://en.wikipedia.org/wiki/Euler_numbers)
