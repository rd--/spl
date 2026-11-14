# signExponentMantissa

- _signExponentMantissa(x)_

Answer the components of an Ieee 754 as a three element `List`.
The components are _sign_, _exponent_ and _mantissa_.
The reconstruction is _(-1 ^ sign) * (2 ^ exponent) * mantissa_.

```
>>> let f = { :x |
>>> 	let sem = x.signExponentMantissa;
>>> 	(sem, sem.fromSignExponentMantissa)
>>> };
>>> let n = [1 -1 0.123 -0.123 1.5 -1.5];
>>> n.collect(f/1)
[
	([0 0 1], 1),
	([1 0 1], -1),
	([0 -4 1.968], 0.123),
	([1 -4 1.968], -0.123),
	([0 0 1.5], 1.5),
	([1 0 1.5], -1.5)
]
```

* * *

See also: Float, fractionExponent, fromSignExponentMantissa, mantissaExponent

Guides: Floating Point Functions
