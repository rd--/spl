# Sequenceable

`Sequenceable` is collection `Trait` for collections that have a well-defined order associated with their elements.

Implementing this trait does not imply that the type is, in any ordinary sense, a sequence.
For instance trees, matrices and arrays are all sequenceable, without being sequences.

The `Sequenceable` trait is particularly important for elementwise operations over collections,
the key methods for which are `withCollect` and `adaptToCollectionAndApply`.

```
>>> system
>>> .traitDictionary['Sequenceable']
>>> .isTrait
true

>>> system
>>> .traitTypes('Sequenceable')
>>> .includes('List')
true
```

Methods for accessing: `atAll`, `atAllPut`, `first`, `second`, `middle`, `last`, `allButFirst`, `allButLast`, `indexOf,indexOfIfAbsent`, `indexOfSubstringStartingAt`, `indexOfSubstringStartingAtIfAbsent`, `replaceFromToWith`, `replaceFromToWithStartingAt`

Methods for copying: `++`, `copyFromTo`, `copyReplaceAllWith`, `copyReplaceFromToWith`, `copyWith`, `copyWithout`, `copyWithoutAll`, `forceToPaddingWith`, `reversed`, `shuffled`, `sortBy`

Methods for enumerating: `findFirst`, `findLast`, `keysAndValuesDo`, `reverseDo`, `withDo`, `reverseWithDo`

* * *

See also: Collection, Iterable, Ordered, Trait

Categories: Collection, Trait
