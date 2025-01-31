# Plus

- _Plus(aNumber, anotherNumber)_

Answer the sum of _aNumber_ and _anotherNumber_.
`Plus` is an alias for `+`.

At `SmallFloat`:

```
>>> Plus(3, 4)
7
```

At `Ugen`:

```
Times(
	Plus(
		SinOsc(220, 0),
		Saw(110)
	),
	0.1
)
```

* * *

See also: +, *, Minus, Times, MulAdd

Categories: Math, Ugen
