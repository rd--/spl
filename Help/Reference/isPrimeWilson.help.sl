# isPrimeWilson

- _isPrimeWilson(anInteger)_

Answer `true` if _anInteger_ is a prime number,
according to Wilson’s primality test,
else `false`.
Wilson’s theorem states that a natural number _n > 1_ is a prime number if,
and only if,
the product of all the positive integers less than _n_ is one less than a multiple of _n_.

Using `LargeInteger` since the `factorial` quickly exceeds the precision of `SmallFloat`:

```
>>> (1L .. 99L).select(isPrimeWilson:/1)
[
	 2  3  5  7 11 13 17 19 23 29
	31 37 41 43 47 53 59 61 67 71
	73 79 83 89 97
]
```

Validate using `isPrime`:

```
>>> 1:99.select(isPrime:/1)
[
	 2  3  5  7 11 13 17 19 23 29
	31 37 41 43 47 53 59 61 67 71
	73 79 83 89 97
]
```

* * *

See also: isPrime

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WilsonsTheorem.html),
_W_
[1](https://en.wikipedia.org/wiki/Wilson%27s_theorem)

Categories: Testing
