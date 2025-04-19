# isPerfectNumber

- _isPerfectNumber(anInteger)_

Answer `true` if _anInteger_ is a perfect number, and `false` otherwise.
A positive integer _n_ is a perfect number if the sum of all its divisors is _2 * n_.

Six is a perfect number:

```
>>> 6.isPerfectNumber
true
```

Twelve is not a perfect number:

```
>>> 12.isPerfectNumber
false
```

Select the first three perfect numbers (A000396 in OEIS):

```
>>> 2:500.select(isPerfectNumber:/1)
[6 28 496]
```

The next perfect number is 8,128, and after that 33,550,336:

```
>>> 8128.isPerfectNumber
true
```

Each Mersenne prime generates one even perfect number:

```
>>> let p = 7;
>>> ((2 ^ (p - 1)) * (2 ^ p - 1)).isPerfectNumber
true
```

See also: isPerfectSquare

Guides: Integer Sequences

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PerfectNumberQ.html),
_OEIS_
[1](https://oeis.org/A000396),
_W_
[1](https://en.wikipedia.org/wiki/Perfect_number)

Categories: Testing, Math
