# NamedControl

- _NamedControl(s, x)_

Answers a `Ugen` holding a `LocalControl` with the given name _s_ and the defaut value _x_.

```
>>> let freq = NamedControl('freq', 440);
>>> let localControl = freq.scUgen.localControl;
>>> (
>>> 	freq.isUgen,
>>> 	freq.scUgen.name,
>>> 	localControl.name,
>>> 	localControl.defaultValue
>>> )
(true, 'LocalControl', 'freq', 440)
```

* * *

See also: LocalControl, ScUgen, Ugen

Guides: Unit Generators

Categories: Ugen
