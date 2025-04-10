# AllpassL

- _AllpassN(in=0, maxdelaytime=0.2, delaytime=0.2, decaytime=1)_

All pass delay line, linear interpolation.

Mouse controls decay time:

```
let t = Dust([2, 2]);
let z = PinkNoise() * Decay(
	t * 0.5,
	TRand(0.05, 0.15, t)
);
let decayTime = MouseY(0.5, 1.5, 0, 0.2);
8.timesRepeat {
	let delayTime = { 0.1.atRandom } ! 2;
	z := AllpassL(
		z,
		delayTime,
		delayTime,
		decayTime
	)
};
z
```

Mouse controls feedback coefficient:

```
let t = Dust([2, 2]);
let z = PinkNoise() * Decay(
	t * 0.5,
	TRand(0.05, 0.15, t)
);
let feedbackCoefficient = MouseY(
	0.35, 0.65, 0, 0.2
);
8.timesRepeat {
	let delayTime = { 0.1.atRandom } ! 2;
	let decayTime = delayTime / (
		feedbackCoefficient.Log
		/
		-60.DbAmp.Log.Abs
	);
	z := AllpassL(
		z,
		delayTime,
		delayTime,
		decayTime
	)
};
z
```

Show calculation of feedback coefficient and decay time:

```
>>> let delayTime = 0.1;
>>> let decayTime = 1;
>>> 0.001 ^ (
>>> 	delayTime / decayTime.abs
>>> ) * decayTime.sign
0.5012

>>> let delayTime = 0.1;
>>> let feedbackCoefficient = 0.5;
>>> delayTime / (
>>> 	feedbackCoefficient.log
>>> 	/
>>> 	0.001.log.abs
>>> )
-0.9966
```

* * *

See also: AllpassC, AllpassN, CombL

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/AllpassL.html)

Categories: Ugen, Filter, Delay
