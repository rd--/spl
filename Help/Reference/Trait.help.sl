# Trait

A `Trait` is a `Type` that holds a named `Method` dictionary.

Trait names begin with the ampersand character,
the trait _T_ is named _@T_.

The dictionary keys are _qualified_ method names, i.e. _sum/1_.

The `System` holds a dictionary of traits indexed by name:

```
>>> system.traitDictionary
>>> .isDictionary
true

>>> let d = system.traitDictionary;
>>> d.includesKey('@Collection')
true
```

`traitLookup` answers the named trait:

```
>>> system
>>> .traitLookup('@Collection')
>>> .isTrait
true

>>> system
>>> .traitLookup('@Collection')
>>> .name
'@Collection'
```

The `methodDictionary` of a `Trait` holds `Method` values:

```
>>> system
>>> .traitLookup('@Do')
>>> .methodDictionary
>>> .includesKey('sum/1')
true

>>> system
>>> .traitLookup('@Do')
>>> .methodDictionary['sum/1']
>>> .isMethod
true
```

The list of system traits:

```
>>> system.traitDictionary
>>> .keys
>>> .sort!
[
	'@Add'
	'@ArithmeticProgression'
	'@At'
	'@Binary'
	'@BinaryLargeObject'
	'@Cache'
	'@CartesianCoordinates'
	'@Character'
	'@Collect'
	'@Collection'
	'@Colour'
	'@Compare'
	'@Copy'
	'@Dictionary'
	'@Do'
	'@Equal'
	'@Event'
	'@EventTarget'
	'@Exception'
	'@Frequency'
	'@Geometry'
	'@Graph'
	'@ImplicitFloat'
	'@Indices'
	'@Integer'
	'@Iterator'
	'@Json'
	'@Length'
	'@Link'
	'@Mass'
	'@Multiset'
	'@New'
	'@Number'
	'@Object'
	'@OeisSequence'
	'@Ordered'
	'@PlaneAngle'
	'@PolygonMesh'
	'@PrimitiveError'
	'@ProbabilityDistribution'
	'@Put'
	'@RandomNumberGenerator'
	'@Remove'
	'@Sequence'
	'@Set'
	'@Store'
	'@Stream'
	'@SymbolicBoolean'
	'@SymbolicCompare'
	'@SymbolicNumber'
	'@SymbolicObject'
	'@Time'
	'@Tuning'
	'@Unordered'
	'@Url'
	'@UrlQueryParameters'
]
```

* * *

See also: Method, System, Type

Guides: Reflection Functions, What is a Trait

Further Reading: Cannon 1982, Curry 1982, Moon 1986, Weinreb 1980, Ungar and Smith 1987

Categories: Behaviour, Type
