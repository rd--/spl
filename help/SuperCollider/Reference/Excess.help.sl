# Excess -- maths operator

Residual of clipping.

_Excess(a, b)_ answers the difference of the original signal and its clipped form,
ie. _a - Clip2(a, b)_.

	SinOsc(1000, 0).Excess(Line(0, 1, 23)) / 3

* * *

See also: Clip2, Fold2, Wrap2
