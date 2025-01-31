# Sequence

`Sequence` is collection `Trait` for collections that have a well-defined order associated with their elements.
Thus each element is externally-named by integers referred to as indices.

```
>>> system
>>> .traitDictionary['Sequence']
>>> .isTrait
true

>>> system
>>> .traitTypes('Sequence')
>>> .includes('List')
true
```

Methods for accessing: `atAll`, `atAllPut`, `first`, `second`, `middle`, `last`, `allButFirst`, `allButLast`, `indexOf,indexOfIfAbsent`, `indexOfSubstringStartingAt`, `indexOfSubstringStartingAtIfAbsent`, `replaceFromToWith`, `replaceFromToWithStartingAt`

Methods for copying: `++`, `copyFromTo`, `copyReplaceAllWith`, `copyReplaceFromToWith`, `copyWith`, `copyWithout`, `copyWithoutAll`, `forceToPaddingWith`, `reversed`, `shuffled`, `sortBy`

Methods for enumerating: `findFirst`, `findLast`, `keysAndValuesDo`, `reverseDo`, `withDo`, `reverseWithDo`

* * *

See also: Collection, Iterable, Ordered, Trait

Categories: Collection, Trait
