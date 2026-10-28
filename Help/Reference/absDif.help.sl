# absDif

- _absDif(α, β)_

Answer the absolute value of the difference of α and β.
Alias for `absoluteDifference`.

```
>>> absDif(1, 2)
1
```

Simple rhythm:

```
let m = 0.2.absDif(
	sinOsc(2, 0) * 0.5
);
sinOsc(440, 0) * m / 2
```

* * *

See also: -, abs, sqrDif

Guides: Unit Generators

Categories: Math, Ugen
