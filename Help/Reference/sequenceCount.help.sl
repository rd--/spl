# sequenceCount

- _sequenceCount(l, x)_

Answer the number of times _x_ appears as a sublist of the list _l_.

Count the number of appearances of a sublist:

```
>>> [1 2 1 2 1 2].sequenceCount([1 2])
3
```

Count sequences of integers in a list:

```
>>> let r = Sfc32(789124);
>>> [1 .. 10].randomChoice(r, [10 ^ 3])
>>> .sequenceCount([3 .. 5])
4
```

Numbers whose binary representation contains no two adjacent ones,
OEIS [A003714](https://oeis.org/A003714):

```
>>> 0:99.select { :n |
>>> 	n.integerDigits(2)
>>> 	.sequenceCount([1 1]) = 0
>>> }
[
	 0  1  2  4  5  8  9 10 16 17
	18 20 21 32 33 34 36 37 40 41
	42 64 65 66 68 69 72 73 74 80
	81 82 84 85
]
```

Numbers whose binary representation contains no two adjacent zeros,
called the dual Zeckendorf representation,
OEIS [A104326](https://oeis.org/A104326):

```
>>> 0:50.collect { :n |
>>> 	n.integerDigits(2)
>>> }.select { :n |
>>> 	n.sequenceCount([0 0]) = 0
>>> }
[
	0;
	1;
	1 0;
	1 1;
	1 0 1;
	1 1 0;
	1 1 1;
	1 0 1 0;
	1 0 1 1;
	1 1 0 1;
	1 1 1 0;
	1 1 1 1;
	1 0 1 0 1;
	1 0 1 1 0;
	1 0 1 1 1;
	1 1 0 1 0;
	1 1 0 1 1;
	1 1 1 0 1;
	1 1 1 1 0;
	1 1 1 1 1;
	1 0 1 0 1 0;
	1 0 1 0 1 1;
	1 0 1 1 0 1;
	1 0 1 1 1 0;
	1 0 1 1 1 1
]
```

* * *

See also: count, sequencePosition

Guides: Sequence Alignment Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SequenceCount.html)
_OEIS_
[1](https://oeis.org/A003714)
[2](https://oeis.org/A104326)
