# UgenGraph

- _UgenGraph(aString, aUgen)_

A `Type` representing a named graph of unit generators.

This type can be encoded to the binary format understood by _scsynth_.

```
>>> UgenGraph(
>>> 	'sin',
>>> 	SinOsc(440, 0) * 0.1
>>> ).isUgenGraph
true
```

Accessors are:

- `name`: the name of the graph
- `constantList`: the list of `SmallFloat` constants referred to in the graph
- `controlList`: the list of `LocalControl` inputs
- `ugenList`: the sorted list of `ScUgen` values

Collect names of `LocalControl` and `ScUgen` values:

```
>>> let g = UgenGraph(
>>> 	'sin',
>>> 	SinOsc(
>>> 		NamedControl('freq', 440),
>>> 		0
>>> 	) * 0.1
>>> );
>>> let c = g.constantList;
>>> let k = g.controlList;
>>> let u = g.ugenList;
>>> (
>>> 	g.name,
>>> 	c,
>>> 	k.collect(name:/1),
>>> 	u.collect(displayName:/1)
>>> )
(
	'sin',
	[0 0.1],
	['freq'],
	['Control' 'SinOsc' 'Mul' 'Out']
)
```

* * *

See also: Graph, name, ScUgen, Ugen
