# hammingNumbersFromUpTo

_hammingNumbersFromUpTo(anInteger, anotherInteger)_

Answer a sorted List of the Hamming numbers starting from _anInteger_,
which must be a Hamming number,
up to _anotherInteger_,
which need not be a Hamming number.

Hamming numbers are numbers whose prime divisors are less or equal to 5.

The first twenty Hamming numbers:

```
>>> hammingNumbersFromUpTo(1, 36)
[1 2 3 4 5 6 8 9 10 12 15 16 18 20 24 25 27 30 32 36]
```

Hamming numbers up to 2^96:

```
>>> let h = hammingNumbersFromUpTo(1n, 2 ^ 96);
>>> (h.size, h[1691], h.last)
(43210, 2125764000n, 79228162514264337593543950336n)
```
