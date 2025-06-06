# zeroCrossingDetect

- _zeroCrossingDetect(aSequence)_

Answer a boolean sequence in which `true` corresponds to zero crossings in _aSequence_.

Zero crossings of a list:

```
>>> [4 0 1 -2 1 -2 -3 -1 3]
>>> .zeroCrossingDetect
[
	false false false true true
	true false false true
]
```

A zero-crossing occurs when the last non-zero `sign` is opposite to the current `sign`:

```
>>> [0 -1 0 0 1 0]
>>> .zeroCrossingDetect.boole
[0 0 0 0 1 0]
```

Visiting zero is not a zero crossing:

```
>>> [0 1 0 1 0 -1 0 -1 0 -1 0]
>>> .zeroCrossingDetect.boole
[0 0 0 0 0 1 0 0 0 0 0]
```

* * *

See also: boole, count, zeroCrossingCount

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CrossingDetect.html),
_Mathworks_
[1](https://mathworks.com/help/dsp/ref/dsp.zerocrossingdetector-system-object.html),
_W_
[1](https://en.wikipedia.org/wiki/Zero_crossing)
