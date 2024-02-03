# ExpRandRange -- math

Exponentially distributed random number in indicated range.

As amplitude:

```
SinOsc(440, 0) * ExpRandRange(0.01, LfNoise2(1 / 3).Range(0.01, 0.1))
```

As frequency:

```
SinOsc(ExpRandRange(333, LfNoise2(1 / 3).Range(333, 555)), 0) / 13
```

ExpRandRange must not touch zero:

```
ExpRandRange(SinOsc(0.1, 0).Range(0.1, 1), 0.1) - 1 * 0.1
