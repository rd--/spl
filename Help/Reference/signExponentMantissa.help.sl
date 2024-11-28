# signExponentMantissa

- _signExponentMantissa(aSmallFloat)_

Answer the components of an Ieee 754 as a three element `List`.
The components are _sign_, _exponent_ and _mantissa_.
The reconstruction is _(-1 ^ sign) * (2 ^ exponent) * mantissa_.

```
>>> let f = { :x |
>>> 	let sem = x.signExponentMantissa;
>>> 	(sem, sem.fromSignExponentMantissa)
>>> };
>>> let n = [
>>> 	1 -1 0.123 -0.123 1.5
>>> 	-1.5 1E100 -1E100 1E-100 -1E-100
>>> 	inf
>>> ];
>>> n.collect(f:/1)
[
	([0 0 1], 1),
	([1 0 1], -1),
	([0 -4 1.968], 0.123),
	([1 -4 1.968], -0.123),
	([0 0 1.5], 1.5),
	([1 0 1.5], -1.5),
	([0 332 1.142987391282275], 1E100),
	([1 332 1.142987391282275], -1E100),
	([0 -333 1.7498005798264096], 1E-100),
	([1 -333 1.7498005798264096], -1E-100),
	([0, 1024, 1], inf)
]
```

* * *

See also: fromSignExponentMantissa, SmallFloat
