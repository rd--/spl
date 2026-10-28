# absoluteValue

- _absoluteValue(x)_

Answer the absolute value of _x_.
Alias of `abs`.

```
>>> -23.absoluteValue
23
```

At `Ugen`,
contrary motion:

```
let a = line(-1, 1, 2);
let b = a.absoluteValue;
sinOsc(
	[a b] * 220 + [220 440],
	0
) * [a b] * 0.1
```

Compare:

```
let o = syncSaw(100, 440);
[o, o.absoluteValue] * 0.1
```

Full-wave rectification:

```
sinOsc(440, 0).absoluteValue * 0.1
```

* * *

See also: abs, absDif

Guides: Unit Generators

Categories: Math, Ugen
