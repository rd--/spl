# RunningSum

- _RunningSum(in, numSamp)_

A running sum over a user specified number of samples, useful for running RMS power windowing.

- in: Input signal
- numSamp: How many samples to take the running sum over (initialisation time only, not modulatable)

Overloads of course, would need scaling:

```
RunningSum(AudioIn([1]), 40) / 40
```

Running Average over _x_ samples:

```
let x = 100;
RunningSum(LfSaw(440, 0), x) / x
```

Rms power:

```
let input= LfSaw(440, 0);
let numsamp = 30;
(
	RunningSum(input.Squared, numsamp)
	/
	numsamp
).Sqrt
```

Play around:

```
let input = AudioIn([1]);
let numsamp = 500;
let power= MouseX(0.1, 4, 0, 0.2);
let sum = RunningSum(input ^ power, numsamp);
(sum / numsamp) ^ power.Recip
```

* * *

Categories: Ugen
