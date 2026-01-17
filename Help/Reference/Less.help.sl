# Less

- _Less(α, β)_

Answer `one` if α is less than β, else `zero`.

```
>>> Less(0, 1)
1

>>> Less(1, 0)
0

>>> Less(1, 1)
0
```

Amplitude modulated pink noise:

```
PinkNoise()
.Times(
	Lag(
		LfSaw(1, -1).Less(0),
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

See also: Greater, Plus, Times

Categories: Ugen
