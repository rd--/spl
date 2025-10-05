# fortunateNumber

- _fortunateNumber(n)_

Answer the _n_-th fortunate number.

First few terms:

```
>>> 1:10.collect(fortunateNumber:/1)
[3 5 7 13 23 17 19 23 37 61]
```

_Note_: Slow for small _n_,
to calculate the thirteenth term the next prime after the `primorial` of thirteen is required:

```
>>> 13.primorial
304250263527210
```

* * *

See also: nextPrime, primorial

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FortunatePrime.html),
_OEIS_
[1](https://oeis.org/A005235)
[2](https://oeis.org/A046066),
_W_
[1](https://en.wikipedia.org/wiki/Fortunate_number)
