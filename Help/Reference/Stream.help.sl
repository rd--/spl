# Stream

- _Stream([x₁ x₂ …])_

`Stream` is a `Trait` that represents the ability to maintain a position reference into a collection of objects.

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
>>> .sort
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
