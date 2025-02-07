# Named Controls

Named controls are an alternate notation for specifying `Local Controls`.

Indices for named controls are assigned when the unit generator graph is constructed.
The named controls are collected altogether, sorted by name, and assigned indexes accordingly.

In simple cases the indices can be readily inferred, below _amp_ will have index zero and _freq_ index one.

```
SinOsc(
	NamedControl('freq', 440),
	0
) * NamedControl('amp', 0.1)
```

However as a rule if controls are specified using `NamedControl` they should be set by name, not index.

There is an abbreviated notation illustrated below, `kr` is simply an alias for `NamedControl`.

```
SinOsc([
	'freq1'.kr(440),
	'freq2'.kr(440 + 3)
], 0) * 'amp'.kr(0.1)
```

`Local Controls` and `Named Controls` can not be used together.
All local controls must be specified using the one mechanism.

* * *

See also: Local Controls, NamedControl
