# List

List is a very general Type used to represent collections of values.
Lists may have any length or depth.

- _List(anInteger, anObject)_
- _List(α) ⇒ List(α, nil)_

Create a new List of _anInteger_ places, each initialised to _nil_, or to _anObject_.

Lists are of variable size, elements can be added at the start, at the end, or in a place given by a relation to existing items.

List implements the _Iterable_, _Indexable_, _Collection_, _Sequence_, _PrimitiveSequence_ and _Ordered_ traits.

* * *

See also: asList, asCollection, ByteArray, enclose, Float64Array, nest, Type

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/List.html)

Categories: Collection, Type
