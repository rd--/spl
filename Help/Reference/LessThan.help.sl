# LessThan

- _LessThan(α, β)_

Answer `one` if α is less than β, else `zero`.

```
>>> LessThan(0, 1)
1

>>> LessThan(1, 0)
0

>>> LessThan(1, 1)
0
```

Amplitude modulated pink noise:

```
PinkNoise()
.Times(
	Lag(
		LfSaw(1, -1).LessThan(0),
		0.1
	)
)
.Times(0.05)
```

The same graph notated using operators:

```
PinkNoise() * Lag(LfSaw(1, -1) < 0, 0.1) * 0.05
```

* * *

See also: GreaterThan, Plus, Times

Categories: Ugen
