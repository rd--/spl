# pellNumbers

- _pellNumbers(anInteger)_

Answer a `List` of the first _anInteger_ Pell numbers:

```
>>> 16.pellNumbers
[
	0 1 2 5 12 29 70 169 408 985
	2378 5741 13860 33461 80782
	195025
]
```

There is a closed form for calculating the n-th Pell number (zero-indexed):

```
>>> [0 .. 15].collect(pellNumber:/1)
[
	0 1 2 5 12 29 70 169 408 985
	2378 5741 13860 33461 80782
	195025
]
```

The silver ratio is the limiting ratio of consecutive Pell numbers:

```
>>> 195025 / 80782
1.silverRatio
```

A Pell prime is a Pell number that is prime.
The first few Pell primes (OEIS A086383):

```
>>> 30.pellNumbers.select(isPrime:/1)
[2 5 29 5741 33461 44560482149]
```

The zero indices of the Pell primes in `pellNumbers` are themselves prime (OEIS A096650):

```
>>> let p = 99.pellNumbers;
>>> [
>>> 	2 5 29 5741 33461
>>> 	44560482149
>>> ].collect { :each |
>>> 	p.indexOf(each) - 1
>>> }
[2 3 5 11 13 29]
```

* * *

See also: fibonacciSequence, linearRecurrence, pellLucasNumbers, silverRatio

Guides: Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PellNumber.html),
_OEIS_
[1](https://oeis.org/A000129)
[2](https://oeis.org/A086383)
[3](https://oeis.org/A096650),
_W_
[1](https://en.wikipedia.org/wiki/Pell_number)

Categories: Math, Sequence
