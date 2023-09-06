# asFraction -- converting

- _asFraction(aSmallFloat, anInteger)_
- _asFraction(aSmallFloat)_ ≡ _asFraction(aSmallFloat, 100)_

Derive a Fraction that approximates a floating point number given a maxima for the denominator.

	(1 .. 3).collect { :n | pi.asFraction(10 ^ n) } = [22:7, 311:99, 2862:911]

* * *

See also: asFloat, asInteger, asNumber, limitDenominator
