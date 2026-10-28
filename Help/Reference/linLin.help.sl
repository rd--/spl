# linLin

- _linLin(in, srcLow=-1, srcHigh=1, dstLow=0, dstHigh=1)_

Maps a linear range of values to another linear range of values.

- in: input to convert
- srcLoq: lower limit of input range
- srcHigh: upper limit of input range
- dstLoq: lower limit of output range
- dstHigh: upper limit of output range

Map oscillator to frequency:

```
let mod = sinOsc(line(1, 10, 10), 0);
sinOsc(
	linLin(mod, -1, 1, 100, 900),
	0
) * 0.1
```

Modulating destination values:

```
let mod = lfNoise2(80);
sinOsc(
	mod.linLin(
		-1,
		1,
		mouseX(200, 8000, 1, 0.2),
		mouseY(200, 8000, 1, 0.2)
	),
	0
) * 0.1
```

Modulating source and destination values:

```
let mod = lfNoise2(80);
sinOsc(
	mod.linLin(
		sinOsc(0.2, 0),
		sinOsc(0.2543, 0),
		mouseX(200, 8000, 1, 0.2),
		mouseY(200, 8000, 1, 0.2)
	),
	0
) * 0.1
```

Rescale low-frequency sawtooth oscillator output as frequency control:

```
let f = lfSaw(1, 1).linLin(-1, 1, 220, 440);
sinOsc(f.lag(0.05), 0) * 0.1
```

At `SmallFloat`:

```
>>> [0 0.5 1].collect { :each |
>>> 	each.linLin(0, 1, 3, 9)
>>> }
[3 6 9]
```

Invert a bipolar sine signal and scale to be unipolar:

~~~spl svg=A
(0 -- 2.pi).functionPlot { :x |
	x.sin.linLin(-1, 1, 1, 0)
}
~~~

![](Help/Image/linLin-A.svg)

* * *

See also: linExp, rescale

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/linlin.html),
_Max_
[1](https://docs.cycling74.com/reference/scale/)
[2](https://docs.cycling74.com/reference/gen_common_scale/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/linLin.html)

Categories: Ugen
