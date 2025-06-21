# lookAndSaySequence

- _lookAndSaySequence(n)_

Answer the first _n_ terms of the look and say sequence.
The answers are given as lists of digits.

```
>>> 10.lookAndSaySequence
[
	1;
	1 1;
	2 1;
	1 2 1 1;
	1 1 1 2 2 1;
	3 1 2 2 1 1;
	1 3 1 1 2 2 2 1;
	1 1 1 3 2 1 3 2 1 1;
	3 1 1 3 1 2 1 1 1 3 1 2 2 1;
	1 3 2 1 1 3 1 1 1 2 3 1 1 3 1 1 2 2 1 1;
]
```

The digit counts of the first few terms:

```
>>> 23.lookAndSaySequence
>>> .collect(size:/1)
[
	1 2 2 4 6 6 8 10 14 20
	26 34 46 62 78 102 134 176 226 302
	408 528 678
]
```

Convert terms to to large integers:

```
>>> 11.lookAndSaySequence.collect { :x |
>>> 	x.fromDigits(10L)
>>> }
[
	1L
	11L
	21L
	1211L
	111221L
	312211L
	13112221L
	1113213211L
	31131211131221L
	13211311123113112211L
	11131221133112132113212221L
]
```

* * *

See also: conwaysConstant, gijswijtsSequence

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LookandSaySequence.html)
_OEIS_
[1](https://oeis.org/A005150)
[2](https://oeis.org/A005341)
_W_
[1](https://en.wikipedia.org/wiki/Look-and-say_sequence)
