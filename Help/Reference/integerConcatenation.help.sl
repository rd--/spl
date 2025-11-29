# integerConcatenation

- _integerConcatenation(m, n, b=10)_

Answer the concatenation of two integers _m_ and _n_,
the number formed by concatenating their numerals.

With _b=10_:

```
>>> 1234.integerConcatenation(5678)
12345678
```

With _b=2_:

```
>>> 2r1001.integerConcatenation(
>>> 	2r1010,
>>> 	2
>>> )
2r10011010
```

Concatenate the decimal numbers _1,2,…,n_,
OEIS [A007908](https://oeis.org/A007908):

```
>>> 2:10.foldList(
>>> 	1,
>>> 	integerConcatenation:/2
>>> )
[
	1
	12
	123
	1234
	12345
	123456
	1234567
	12345678
	123456789
	12345678910
]
```

* * *

See also: concatenation, integerDigits, integerLength

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Concatenation.html),
_OEIS_
[1](https://oeis.org/A007908)
