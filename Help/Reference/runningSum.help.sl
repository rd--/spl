# runningSum

- _runningSum(in, numSamp)_

A running sum over a user specified number of samples, useful for running RMS power windowing.

- in: Input signal
- numSamp: How many samples to take the running sum over (initialisation time only, not modulatable)

Overloads of course, would need scaling:

```
runningSum(audioIn([1]), 40) / 40
```

Running Average over _x_ samples:

```
let x = 100;
runningSum(lfSaw(440, 0), x) / x
```

Rms power:

```
let input= lfSaw(440, 0);
let numsamp = 30;
(
	runningSum(input.square, numsamp)
	/
	numsamp
).signedSqrt
```

Play around:

```
let input = audioIn([1]);
let numsamp = 500;
let power= mouseX(0.1, 4, 0, 0.2);
let sum = runningSum(input ^ power, numsamp);
(sum / numsamp) ^ power.reciprocal
```

* * *

Guides: Unit Generators

Categories: Ugen
