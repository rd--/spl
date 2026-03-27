# hammingNumbers

- _hammingNumbers(n, m=1)_

Answer a sorted `List` of the Hamming numbers starting from the integer _m_,
which must be a Hamming number,
up to another integer _n_,
which need not be a Hamming number.

Hamming numbers are numbers whose prime divisors are less or equal to five,
also called five-smooth numbers.

Hamming numbers,
OEIS [A051037](https://oeis.org/A051037):

```
>>> 36.hammingNumbers
[
	 1  2  3  4  5  6  8  9 10 12
	15 16 18 20 24 25 27 30 32 36
]
```

Hamming numbers up to 2^96:

```
>>> let h = (2L ^ 96).hammingNumbers;
>>> (h.size, h[1691], h.last)
(
	43210,
	2125764000L,
	79228162514264337593543950336L
)
```

* * *

See also: hammingDistance

Guides: Integer Sequence Functions
