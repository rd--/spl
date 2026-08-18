# Plus

- _Plus(m, n)_

Answer the sum of _m_ and _n_.
Alias for `plus` and the `+` operator,
which is named `plusSign`.

At `SmallFloat`:

```
>>> Plus(3, 4)
7

>>> plus(3, 4)
7

>>> +(3, 4)
7

>>> plusSign(3, 4)
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

_Rationale_:
`Plus` is defined as the constructor for the binary addition operator,
specifically in relation to the specification of signal processing graphs.
This operator is not spelled _Add_,
since `add` is the name of the method for adding an element to a collection.
Note however that the composite of `Times` and `Plus` is spelled `MulAdd`,
not _TimesPlus_.

```
>>> let p = [1 2 3];
>>> let q = 4;
>>> (p + q, p.add(q), p)
([5 6 7], 4, [1 2 3 4])
```

* * *

See also: +, Divide, Subtract, Times

Guides: Unit Generators

Categories: Math, Ugen
