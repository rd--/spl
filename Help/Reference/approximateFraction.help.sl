# approximateFraction

- _approximateFraction(n, ε)_

Convert the number _n_ to a `Fraction` given error bound _ε_.
Alias for `rationalize`.

```
>>> [-1 -2 -3].collect { :each |
>>> 	(27 / 32).approximateFraction(
>>> 		10 ^ each
>>> 	)
>>> }
[3/4 11/13 27/32]

>>> [0, -1 .. -5].collect { :each |
>>> 	1.pi.approximateFraction(10 ^ each)
>>> }
[3/1 16/5 22/7 201/64 333/106 355/113]
```

* * *

See also: asFraction, convergents, rationalize, semiconvergents

Guides: Mathematical Functions

Categories: Converting
