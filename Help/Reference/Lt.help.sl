# Lt

- _Lt(α, β)_

Answer `one` if α is less than β, else `zero`.

```
>>> Lt(0, 1)
1

>>> Lt(1, 0)
0

>>> Lt(1, 1)
0
```

Amplitude modulated pink noise:

```
PinkNoise()
.Mul(
	Lag(
		LfSaw(1, -1).Lt(0),
		0.1
	)
)
.Mul(0.05)
```

The same graph notated using operators:

```
PinkNoise() * Lag(LfSaw(1, -1) < 0, 0.1) * 0.05
```

* * *

See also: Add, Gt, Mul

Categories: Ugen
