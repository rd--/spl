# AmpDb

Convert linear amplitude to decibels.
Inverse of _DbAmp_.

```
SinOsc(
	[
		Line(0, 1, 2).AmpDb,
		Line(-96, 0.001, 2)
	] * 110 + 110,
	0
) * 0.1
```

* * *

See also: DbAmp
