# Iterator

- _Stream([x₁ x₂ …])_

`Iterator` is both a `Trait`,
representing the ability to maintain a position reference into a collection of objects,
and a constructor method for iterator types.

At `List` and `Range`,
answer a `CollectionStream` on the collection _c_.

```
>>> let i = Iterator(1:9);
>>> (i.next!, i.next!, i.next!)
(1, 2, 3)
```

`Iterator` is a `Trait`:

```
>>> system
>>> .traitDictionary['Iterator']
>>> .isTrait
true
```

List of types implementing `Iterator`:

```
>>> system
>>> .traitTypes('@Iterator')
>>> .sort!
[
	'AliasMethod'
	'BlockStream'
	'CollectionStream'
	'LaggedFibonacci'
	'LinearCongruential'
	'MersenneTwister'
	'MutableCollectionStream'
	'Sfc32'
	'SplitMix'
]
```

To implement `Iterator` a type must implement `next`.

```
>>> let i = 1:9.Iterator;
>>> (i.next!, i.next!, i.next!)
(1, 2, 3)
```

`Iterator` implements:

- `any`
- `do`
- `nextInto`
- `nextMatchFor`
- `nextSatisfy`
- `nextUntil`
- `nextWhile`
- `upToEnd`

* * *

See also: CollectionStream, do, Iterable, next, Stream

Guides: Stream Functions

Categories: Collection, Trait
