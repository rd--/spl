# sqrDif

- _sqrDif(α, β)_

Square of the difference,
equivalent to _(α-β)^2_.
This can be more efficient than the written out form.

At `Ugen`:

```
sinOsc(800, 0)
.sqrDif(
	sinOsc(
		xLine(200, 500, 5),
		0
	)
) * 0.125
```

Written out:

```
let a = sinOsc(800, 0);
let b = sinOsc(xLine(200, 500, 5), 0);
let c = a - b;
(c * c) * 0.125
```

* * *

See also: absDif

Guides: Unit Generators

Categories: Ugen, Math
