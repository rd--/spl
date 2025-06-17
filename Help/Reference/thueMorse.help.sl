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
>>> 	(n, n.thueMorse, n.integerDigits(2))
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

* * *

See also: digitCount, integerDigits, thueMorseSequence

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Thue-MorseSequence.html)
[2](https://reference.wolfram.com/language/ref/ThueMorse.html)
