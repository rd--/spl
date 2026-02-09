# thueMorse

- _thueMorse(n)_

Answer the _n_-th term of the Thue-Morse sequence.

The fifth term of the Thue–Morse sequence:

```
>>> 5.thueMorse
0
```

Five has an even number of ones in its binary expansion:

```
>>> 5.integerDigits(2)
[1 0 1]
```

The first 10 elements of the sequence:

```
>>> 0:9.collect(thueMorse:/1)
[0 1 1 0 1 0 0 1 1 0]
```

Display the values alongside the binary expansion:

```
>>> 0:9.collect { :n |
>>> 	let d = n.integerDigits(2);
>>> 	(n, n.thueMorse, d)
>>> }
[
	(0, 0, [0]),
	(1, 1, [1]),
	(2, 1, [1 0]),
	(3, 0, [1 1]),
	(4, 1, [1 0 0]),
	(5, 0, [1 0 1]),
	(6, 0, [1 1 0]),
	(7, 1, [1 1 1]),
	(8, 1, [1 0 0 0]),
	(9, 0, [1 0 0 1])
]
```

Threads over lists:

```
>>> [12 8 55 2].thueMorse
[0 1 1 1]
```

Plot a binary array related to the Thue-Morse sequence,
reading antidiagonals,
OEIS [A104894](https://oeis.org/A104894):

~~~spl svg=A
0:15.triangularArray { :n :k |
	((n - k) % (2 ^ (k+ 1 )))
	.thueMorse
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/thueMorse-A.svg)

Plot as array:

~~~spl svg=B
0:15.triangularArray { :n :k |
	((n - k) % (2 ^ (k+ 1 )))
	.thueMorse
}.triangularArrayPlot
~~~

![](sw/spl/Help/Image/thueMorse-B.svg)

* * *

See also: digitCount, integerDigits, thueMorseSequence

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Thue-MorseSequence.html)
[2](https://reference.wolfram.com/language/ref/ThueMorse.html)
