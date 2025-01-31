# Minus

- _Minus(aNumber)_
- _Minus(aNumber, anotherNumber)_

`Minus` is an alias for `-`.

The unary form answers _aNumber_ multiplied by negative `one`,
also called negation or inversion.

At `SmallFloat`:

```
>>> Minus(9)
-9

>>> Times(9, -1)
-9
```

At `Ugen`:

```
Times(
	Minus(
		SinOsc(220, 0),
		Saw(110)
	),
	0.1
)
```

The binary form answers the sum of _aNumber_ and the negation of _anotherNumber_.

At `SmallFloat`:

```
>>> Minus(3, 4)
-1

>>> Plus(3, Minus(4))
-1
```

At `Ugen`:

~~~
Times(
	Minus(
		SinOsc(440, 0)
	),
	0.1
)
~~~

* * *

See also: -, +, *, /, MulAdd, Plus, Times

Categories: Math, Ugen
