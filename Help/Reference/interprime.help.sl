# interprime

- _interprime(n)_

+SmallFloat{
	interprime { :n |
		let a = (n + 1).prime;
		let b = (n + 2).prime;
		(a + b) / 2
	}
}

Answer the _n_--th interprime number.

```
>>> 1:24.collect(interprime:/1)
[
	 4  6  9 12 15 18 21 26 30 34
	39 42 45 50 56 60 64 69 72 76
	81 86 93 99
]
```

* * *

See also: prime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Interprime.html),
_OEIS_
[1](https://oeis.org/A024675),
_W_
[1](https://en.wikipedia.org/wiki/Interprime)

Categories: Math
