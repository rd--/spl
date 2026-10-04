# Stream

- _Stream([x₁ x₂ …])_

`Stream` is both a `Trait`,
representing the ability to maintain a position reference into a collection of objects,
and a constructor method for stream types.

At `List` and `Range`, answer a `CollectionStream` on the collection _c_.
At a finite `Range`:

```
>>> let i = 1:9.Stream;
>>> (i.next, i.next, i.next)
(1, 2, 3)
```

At an infinite `Range`:

```
>>> let i = 1:Infinity:2.Stream;
>>> (i.next, i.skip(10_000), i.next)
(1, 10_001, 20_003)
```

Stream is a trait:

```
>>> system
>>> .traitDictionary['Stream']
>>> .isTrait
true
```

List of types implementing `Stream`:

```
>>> system
>>> .traitTypes('@Stream')
>>> .sort!
[
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

`Stream` adds `reset` to the `Iterator` protocol.

The `Stream` constructor method answers a `CollectionStream`:

```
>>> Stream[1 2 3].typeOf
'CollectionStream'
```

_Rationale_:
> We use the phrase _streaming over a collection_ to mean accessing the
> elements of a collection in such a way that it is possible to
> enumerate or store each element, one at a time, possibly
> intermingling these operations. By creating several Streams over the
> same collection, it is possible to maintain multiple position
> references into the same collection. (Blue Book, p. 195)

* * *

See also: BlockStream, CollectionStream, Iterator, PositionableStream, reset, WriteStream

Guides: Stream Functions
