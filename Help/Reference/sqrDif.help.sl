# sqrDif

- _sqrDif(α, β)_

Square of the difference,
is equivalent to _(α-β)^2_.
This can be more efficient than the written out form.

At `Ugen`:

```
SinOsc(800, 0)
.sqrDif(
	SinOsc(
		XLine(200, 500, 5),
		0
	)
) * 0.125
```

Written out:

```
let a = SinOsc(800, 0);
let b = SinOsc(XLine(200, 500, 5), 0);
let c = a - b;
(c * c) * 0.125
```

* * *

See also: absDif

Guides: Unit Generators

Categories: Ugen, Math
