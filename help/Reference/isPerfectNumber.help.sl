# isPerfectNumber

- _isPerfectNumber(anInteger)_

```
>>> 6.isPerfectNumber
true
```

The first three perfect numbers (A000396 in Oeis):

```
>>> 2:500.select(isPerfectNumber:/1)
[6 28 496]
```

Each Mersenne prime generates one even perfect number:

```
>>> let p = 7;
>>> ((2 ^ (p - 1)) * (2 ^ p - 1)).isPerfectNumber
true
```

See also: isPerfectSquare

References:
_W_
[1](https://en.wikipedia.org/wiki/Perfect_number)
