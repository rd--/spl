# excess

- _excess(n, m)_

Residual of clipping.
_excess(α, β)_ answers the difference of the original signal and its clipped form,
ie. _α - clip(α, -β, β)_.

```
SinOsc(
	1000,
	0
).excess(
	Line(0, 1, 23)
) / 3
```

* * *

See also: bilateralClip, bilateralfold, bilateralwrap

Guides: Unit Generators

Categories: Ugen, Math, Operator
