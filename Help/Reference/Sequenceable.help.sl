# Sequenceable

`Sequenceable` is collection `Trait` for collections that have a well-defined order associated with their elements.

```
>>> system
>>> .traitDictionary['Sequenceable']
>>> .isTrait
true
```

Types implementing `Sequenceable`:

>>> system
>>> .traitTypes('@Sequenceable')
>>> .sort
[
	'AsciiString'
	'ByteArray'
	'Float32Array'
	'Float64Array'
	'LinkedList'
	'List'
	'ListView'
	'NumericArray'
	'Range'
	'SortedList'
	'Span'
	'SparseArray'
]
```

Implementing this trait does not necessarily mean that the type is, in any ordinary sense, a sequence.
For instance trees, matrices and arrays are all sequenceable, without being sequences.

The `Sequenceable` trait is particularly important for binary elementwise operations over collections,
the key methods for which are `withCollect` and `adaptToCollectionAndApply`.

Methods for accessing:

- `atAll`
- `atAllPut`
- `first`
- `second`
- `middle`
- `last`
- `allButFirst`
- `allButLast`
- `indexOf,indexOfIfAbsent`
- `indexOfSubstringStartingAt`
- `indexOfSubstringStartingAtIfAbsent`
- `replaceFromToWith`
- `replaceFromToWithStartingAt`

Methods for copying:

- `++`
- `copyFromTo`
- `copyReplaceAllWith`
- `copyReplaceFromToWith`
- `copyWith`
- `copyWithout`
- `copyWithoutAll`
- `forceToPaddingWith`
- `reverse`
- `shuffled`
- `sortBy`

Methods for enumerating:

- `findFirst`
- `findLast`
- `keysAndValuesDo`
- `reverseDo`
- `withDo`
- `reverseWithDo`

* * *

See also: Collection, Iterable, Ordered, Trait

Guides: Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Sequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Sequence)

Categories: Collection, Trait
