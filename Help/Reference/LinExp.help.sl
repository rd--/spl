# LinExp

- _LinExp(in, srcLow=-1, srcHigh=1, dstLow=0.001, dstHigh=1)_

Convert a linear range of values to an exponential range of values.
The _dstLow_ and _dstHigh_ arguments must be non-zero and have the same sign.

- in: input to convert
- srcLoq: lower limit of input range
- srcHigh: upper limit of input range
- dstLoq: lower limit of output range
- dstHigh: upper limit of output range

Convert -1 to +1 sawtooth into 0.01 to 1.0 exponential:

```
let s = LfSaw(500, 0);
[s * 0.1, LinExp(s, -1, 1, 0.001, 0.1)]
```

Convert oscillator output to frequency input:

```
let mod = SinOsc(Line(1, 10, 10), 0);
[
	SinOsc(mod * 400 + 500, 0),
	SinOsc(LinExp(mod, -1, 1, 100, 900), 0)
] * 0.1
```

* * *

See also: LinLin

Categories: Ugen
