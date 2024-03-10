# UgenGraph

A `Type` representing a named graph of unit generators.

This type can be encoded to the binary format understood by _scsynth_.

Accessors are:

- `name`: the name of the graph
- `constantList`: the list of `SmallFloat` constants referred to in the graph
- `controlList`: the list of `LocalControl` inputs
- `ugenList`: the sorted list of `ScUgen` values

	>>> let freq = NamedControl('freq', 440);
	>>> let ugenGraph = UgenGraph('sin', SinOsc(freq, 0) * 0.1);
	>>> (
	>>> 	ugenGraph.name,
	>>> 	ugenGraph.constantList,
	>>> 	ugenGraph.controlList.collect(name:/1),
	>>> 	ugenGraph.ugenList.collect(displayName:/1)
	>>> )
	('sin', [0 0.1], ['freq'], ['Control' 'SinOsc' 'Mul' 'Out'])

* * *

* * *

See also: Graph, name, ScUgen, Ugen
