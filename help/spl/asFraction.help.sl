# asFraction -- math

- _asFraction(aSmallFloat, anInteger)_

Find a Fraction that approximates a floating point number given a maxima for the denominator.

	(1 .. 3).collect { :n | pi.asFraction(10 ** n) } = [22:7, 311:99, 2862:911]

* * *

See also: limitDenominator

