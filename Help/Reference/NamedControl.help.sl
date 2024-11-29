# NamedControl

- _NamedControl(name, defautValue)_

Answers a `Ugen` holding a `LocalControl` with the given _name_ and _defautValue_.

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

Categories: Ugen
