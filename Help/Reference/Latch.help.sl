# Latch

- _Latch(in=0, trig=0)_

Sample and hold.
Holds input signal value when triggered.

- in: input signal
- trig: trigger

Step noise:

```
Latch(WhiteNoise(), Impulse(900, 0)) * 0.1
```

Step noise as frequency input:

```
Blip(
	Latch(
		WhiteNoise(),
		Impulse(9, 0)
	) * 400 + 500,
	4
) * 0.1
```

The above are just meant as examples.
_LfNoise0_ is a faster way to generate random steps:

```
Blip(LfNoise0(9) * 400 + 500, 4) * 0.1
```

Array expansion:

```
WhiteNoise()
.Latch(Impulse([2, 7], 0))
.LinLin(-1, 1, 222, 777)
.SinOsc(0) * 0.1
```

Plotting:

~~~spl ui
let d = Dust([1 5] * 100);
Latch(d, d).soundPlot(0.1)
~~~

* * *

See also: Gate

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Latch.html)

Categories: Ugen
