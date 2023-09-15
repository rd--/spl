# fractionPart -- truncation and round off

- _fractionPart(aNumber)_

Answer a number whose value is the difference between the _aNumber_ and its truncated value,
so that _x.truncated + x.fractionPart = x_.

	1.6.fractionPart + 1.6.truncated = 1.6
	-1.6.fractionPart + -1.6.truncated = -1.6
	1.fractionPart = 0
	0.5.fractionPart = 0.5
	pi.fractionPart + pi.truncated = pi
	| x = pi.negated; | x.fractionPart + x.truncated = x

* * *

See also: integerPart, truncated
