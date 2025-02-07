# Negated

- _Negated(aNumber)_

`Negated` is an alias for the unary `-` operator.
It answers _aNumber_ multiplied by negative `one`,
also called inversion.

At `SmallFloat`:

```
>>> Negated(9)
-9

>>> Times(9, -1)
-9
```

At `Ugen`:

```
Times(
	Negated(
		SinOsc(220, 0),
		Saw(110)
	),
	0.1
)
```

* * *

See also: -, +, *, /, Divide, Minus, Plus, Times

Categories: Math, Ugen
